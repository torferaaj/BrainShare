
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


Container userPageProfilePhoto(BuildContext context) {
  return Container(
    // color: Colors.green,
    height: 110,
    child: Stack(
      children: [
        Container(
          padding: EdgeInsets.all(3),

          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            gradient: const LinearGradient(
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
                colors: [
                  Color(0xfff7b555),
                  Color(0xfff7ae25),
                  Color(0xff3df230),
                  Color(0xfff7ae25),
                  Color(0xff3df230),
                ]),
          ),

          child: Container(
            padding: EdgeInsets.all(3),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50)
            ),

            child: ClipOval(
              child: GestureDetector(
                onTap: (){
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (BuildContext context) => UserProfilePage()
                  //     )
                  // );
                },
                child: Image.asset("images/MyPhoto.jpeg", height: 85,),
                // Image.network(
                //   "https://randomuser.me/api/portraits/men/60.jpg",
                //   height: 85,
                // ),
              ),
            ),
          ),
        ),
        Positioned(
            bottom: 5,
            left: 60,
            child: Container(
              height: 32,
              width: 32,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(50)
              ),
              child: Center(
                child: Icon(
                  CupertinoIcons.checkmark_seal_fill,
                  color: Color(0xfff6b500),
                  size: 28,
                ),
              ),
            )
        ),
      ],
    ),
  );
}
