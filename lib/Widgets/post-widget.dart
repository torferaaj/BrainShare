import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../model/user-model.dart';
import 'normal-profile-photo-widget.dart';

class PostWidget extends StatelessWidget {
  const PostWidget({
    Key? key,
    required this.user,
    required this.blur,
  }) : super(key: key);

  final User user;
  final double blur;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 10,),

        //post widget
        Container(
          // color: Colors.greenAccent,
          height: 240,
          child: Stack(
            children: [
              //Faculty tag
              Positioned(
                top: 5,
                right: 0,

                child: Container(
                  height: 20,
                  width: 70,
                  decoration: BoxDecoration(
                      color: Colors.lightGreen.shade400,
                      borderRadius: BorderRadius.circular(6)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 2.0),
                    child: Text(
                      "#faculty",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 13,

                      ),
                    ),
                  ),

                ),
              ),

              //user name
              Positioned(
                top: 8,
                left: 70,
                child: Text(
                  user.name,
                  style: TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),

              //bottom icons box
              Positioned(
                top: 100,
                left: 3,
                child: Container(
                  height: 106,
                  width: 324,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    // border: Border.all(width: 1, color: Colors.blue.shade50,),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: blur,
                        // offset: -distance,
                        color: Colors.white,
                      ),
                      BoxShadow(
                        blurRadius: blur,
                        // offset: distance,
                        color: Colors.black12,
                      ),
                    ],
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 58, left: 20, right: 10),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            IconButton(onPressed: () {}, icon: Icon(CupertinoIcons.add, color: Colors.black54, size: 20,)),
                            Spacer(),
                            IconButton(onPressed: () {}, icon: Icon(CupertinoIcons.ellipses_bubble, color: Colors.black54, size: 20,)),
                            Spacer(),
                            IconButton(onPressed: () {}, icon: Icon(CupertinoIcons.collections, color: Colors.black54, size: 20,)),
                            Spacer(),
                            IconButton(onPressed: () {}, icon: Icon(CupertinoIcons.bookmark, color: Colors.black54, size: 20,)),
                            Spacer(),
                            IconButton(onPressed: () {}, icon: Icon(CupertinoIcons.fullscreen, color: Colors.black54, size: 20,)),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              //Queried time tag
              Positioned(
                top: 212,
                right: 30,
                child: Container(
                  width: 120,
                  // color: Colors.red,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "Queried 10:23pm",
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w300,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              //post title eg: #C programming
              Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: Container(
                  height: 130,
                  width: 330,
                  decoration: BoxDecoration(
                    color: Colors.blue.shade100,
                    border: Border.all(width: 1.0, color: Colors.blue.shade100),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 75.0, top: 2,),
                            child: Text(
                              "# C Programming",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue.shade800,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              //Solved or Unsolved

              // Positioned(
              //   top: 70,
              //   left: 15,
              //   child: Container(
              //     // color: Colors.green,
              //     height: 60,
              //     width: 60,
              //     child: Image.asset("images/solved.png"),
              //   ),
              // ),

              //vertical divider below the post title name
              Positioned(
                top: 50,
                left: 90,
                child: IntrinsicHeight(
                  child: Container(
                    height: 13,
                    width: 10,
                    // color: Colors.red,
                    child: VerticalDivider(
                      color: Colors.white,
                      width: 10,
                      thickness: 1.5,
                    ),
                  ),
                ),
              ),

              //Query content
              Positioned(
                left: 30,
                top: 63,
                child: Container(
                  // color: Colors.red,
                  // height: 70,
                  width: 290,
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.white),
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Text(
                    'How to check char * "length" before I use string functions in C?',
                    style: TextStyle(
                      color: Colors.black45,
                      fontWeight: FontWeight.bold,

                    ),
                  ),
                ),
              ),

              //Normal profile photo widget
              Positioned(
                top: 0,
                left: 15,
                child: NormalProfilePhotoWidget(context),
              ),
            ],
          ),
        ),

        //divider
        Container(
          child: Divider(
            thickness: 1,
            indent: 25,
            endIndent: 25,
            color: Colors.grey.shade300,
          ),
        ),
      ],
    );

  }
}