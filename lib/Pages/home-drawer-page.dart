import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../main.dart';
import 'feed-page.dart';

class homePage extends StatefulWidget {
  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  double value = 0;

  AppBar CustomAppBar(){
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0.0,
      automaticallyImplyLeading: false,
      titleSpacing: -15,
      title: Padding(
        padding: const EdgeInsets.only(top: 8.0, left: 0),
        child: Image.asset("images/BrainShare_name.png", height: 210,)
      ),
      actions: [
        IconButton(onPressed: () {}, icon: Icon(CupertinoIcons.search), color: Color(0xff5398ed),),
        IconButton(
          onPressed: () {},
          icon: Icon(CupertinoIcons.ellipses_bubble), color: Colors.black,) //Color(0xff2d2e2e)
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors:[
                  Colors.blue.shade400,
                  Colors.blue.shade800,
                ],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
          ),

          drawer_list(context),

          TweenAnimationBuilder(
              tween: Tween<double>(begin: 0, end: value),
              duration: Duration(milliseconds: 500),
              curve: Curves.fastOutSlowIn,
              builder: (_,double val,__){
                return(Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.identity()
                      ..setEntry(3, 2, 0.001)
                      ..setEntry(0, 3, 200 * val)
                      ..rotateY(pi/6 * val),
                  child: Scaffold(
                    appBar: CustomAppBar(),
                    body: FeedPage(),
                    ),
                  )
                );
              }
          ),

          GestureDetector(

            onHorizontalDragUpdate: (e) {
              if(e.delta.dx > 0) {
                setState(() {
                  value = 1;

                });
              }
              else{
                setState(() {
                  value = 0;
                });
              }
            },
          ),
        ],
      ),
    );
  }

}