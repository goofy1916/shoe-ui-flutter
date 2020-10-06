import 'package:flutter/material.dart';

class BrandSelector extends StatefulWidget {
  BrandSelector({Key key, this.brands}) : super(key: key);

  final List<String> brands;

  @override
  _BrandSelectorState createState() => _BrandSelectorState();
}

class _BrandSelectorState extends State<BrandSelector> {

  int _currentIndex = 0;
  bool _isSelected;

  List<Widget> _buildShoesBrand(){
    return widget.brands.map((brand) {
      var index = widget.brands.indexOf(brand);
      _isSelected = _currentIndex ==index;
      return GestureDetector(
        onTap: (){
          setState(() {
            _currentIndex = index;
          });
        },
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            brand,
            style: TextStyle(
              color: _isSelected? Colors.black: Colors.grey,
              fontWeight: FontWeight.bold,
              fontSize: _isSelected? 24: 20,
            ),
          ),
        ),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
//      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: _buildShoesBrand(),
    );
  }
}