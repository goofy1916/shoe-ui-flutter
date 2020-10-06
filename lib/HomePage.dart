import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shoesstore/data.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isExpanded = false;
  bool isLiked = false;

  int currentColorIndex = 0;
  int currentSizeIndex = 0;
  int _counter = 1;

  _increase() {
    setState(() {
      _counter++;
    });
  }

  _decrease() {
    setState(() {
      _counter--;
    });
  }

  _expand() {
    setState(() {
      isExpanded = !isExpanded;
    });
  }

  List<Widget> colorSelector() {
    List<Widget> colorItemList = new List();

    for (var i = 0; i < colors.length; i++) {
      colorItemList
          .add(colorItem(colors[i], i == currentColorIndex, context, () {
        setState(() {
          currentColorIndex = i;
        });
      }));
    }
    return colorItemList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.grey[700], Colors.grey[900]]),
        ),
        child: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only( right: 20, left: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                        size: 28,
                      ),
                      Text(
                        "Energy Cloud",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.w700),
                      ),
                      IconButton(
                        icon: Icon(
                          isLiked
                              ? FontAwesomeIcons.heart
                              : FontAwesomeIcons.solidHeart,
                          color: Colors.white,
                          size: 28,
                        ),
                        onPressed: () {
                          setState(() {
                            isLiked = !isLiked;
                          });
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Column(
                  children: <Widget>[
                    ShoeDisplay(),
                    buildLower(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Padding buildLower() {
    return Padding(
      padding: const EdgeInsets.only(left: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Product Description",
            style: TextStyle(
                color: Colors.grey[500],
                fontSize: 18,
                fontWeight: FontWeight.w700),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20, top: 10, right: 20),
            child: AnimatedCrossFade(
              firstChild: Text(
                desc,
                style: TextStyle(color: Colors.white),
                maxLines: 2,
              ),
              secondChild: Text(
                desc,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              crossFadeState: isExpanded
                  ? CrossFadeState.showSecond
                  : CrossFadeState.showFirst,
              duration: kThemeAnimationDuration,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20, right: 18),
            child: GestureDetector(
              onTap: _expand,
              child: Text(
                isExpanded ? "Less" : "more..",
                style: TextStyle(
                  fontSize: 12,
                  color: Color(0xFFFB382F),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 18,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 60),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Size",
                  style: TextStyle(
                      color: Colors.grey[500],
                      fontSize: 18,
                      fontWeight: FontWeight.w700),
                ),
                Text(
                  "Quantity",
                  style: TextStyle(
                      color: Colors.grey[500],
                      fontSize: 18,
                      fontWeight: FontWeight.w700),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 10),
                child: Row(
                  children: sizeNumlist.map((size) {
                    var index = sizeNumlist.indexOf(size);
                    return GestureDetector(
                        onTap: () {
                          setState(() {
                            currentSizeIndex = index;
                          });
                        },
                        child:
                            sizeItem(size, index == currentSizeIndex, context));
                  }).toList(),
                ),
              ),
              quantitySelector()
            ],
          ),
          SizedBox(
            height: 14,
          ),
          Text(
            "Select Color",
            style: TextStyle(
                color: Colors.grey[500],
                fontSize: 18,
                fontWeight: FontWeight.w700),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: colorSelector(),
          ),
          SizedBox(
            height: 14,
          ),
          Text(
            "Price",
            style: TextStyle(
                color: Colors.grey[500],
                fontSize: 18,
                fontWeight: FontWeight.w700),
          ),
          SizedBox(
            height: 14,
          ),
          Container(
            height: 120,
            width: double.infinity,
            child: Stack(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "\$80",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 50,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: 40,
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        onPressed: (){
                        },
                        color: Color(0xFFFB382F),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text("Add To Cart", style: TextStyle(
                              color: Colors.white,
                              fontSize: 18
                            ),),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Positioned(
                  right: -40,
                  bottom: -80,
                  child: Image.asset("assets/cart.png",
                  width: 240,
                  height: 200,
                  fit: BoxFit.cover,),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget quantitySelector() {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: Colors.grey,
        ),
        width: 100,
        height: 30,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Flexible(
                flex: 3,
                child: GestureDetector(
                  onTap: _decrease,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Icon(
                      Icons.remove,
                      color: Colors.white,
                      size: 18,
                    ),
                  ),
                ),
              ),
              Container(
                width: 2,
                color: CupertinoColors.darkBackgroundGray,
              ),
              Flexible(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    _counter.toString(),
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w800),
                  ),
                ),
              ),
              Container(
                width: 2,
                color: CupertinoColors.darkBackgroundGray,
              ),
              Flexible(
                flex: 3,
                child: GestureDetector(
                  onTap: _increase,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 18,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ShoeDisplay extends StatelessWidget {
  const ShoeDisplay({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 275,
      child: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.center,
            child: Stack(
              children: <Widget>[
                Image.asset("assets/adidas.png"),
                Padding(
                  padding: const EdgeInsets.only(top: 50, right: 60),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.grey[800]),
                        width: 60,
                        child: Image.asset("assets/360.png")),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            left: 24,
            bottom: 10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Rating",
                  style: TextStyle(
                      color: Colors.grey[500],
                      fontSize: 18,
                      fontWeight: FontWeight.w700),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20, top: 10),
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.star,
                        color: Colors.yellow,
                        size: 32,
                      ),
                      Text(
                        "4.5",
                        style: TextStyle(fontSize: 22, color: Colors.yellow),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "(378 People)",
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

Widget colorItem(
    Color color, bool isSelected, BuildContext context, VoidCallback _ontab) {
  return GestureDetector(
    onTap: _ontab,
    child: Padding(
      padding: EdgeInsets.only(left: 10.0),
      child: Container(
        width: 30.0,
        height: 30.0,
        decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(5.0),
            boxShadow: isSelected
                ? [
                    BoxShadow(
                        color: Colors.black.withOpacity(.8),
                        blurRadius: 10.0,
                        offset: Offset(0.0, 10.0))
                  ]
                : []),
        child: ClipPath(
          clipper: MClipper(),
          child: Container(
            width: double.infinity,
            height: double.infinity,
            color: color,
          ),
        ),
      ),
    ),
  );
}

Widget sizeItem(var size, bool isSelected, BuildContext context) {
  return Container(
    margin: EdgeInsets.only(right: 10),
    width: 30,
    height: 30,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: isSelected ? Color(0xFFFB382F) : Colors.grey,
        boxShadow: isSelected
            ? [
                BoxShadow(
                    blurRadius: 10,
                    offset: Offset(0, 5),
                    color: Colors.black.withOpacity(0.8))
              ]
            : []),
    child: Center(
      child: Text(
        size.toString(),
        style: TextStyle(fontWeight: FontWeight.w800, color: Colors.white),
      ),
    ),
  );
}

class MClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();
    path.lineTo(0, size.height);
    path.lineTo(size.width * 2, size.height);
    path.lineTo(size.width, size.height * 2);
    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
