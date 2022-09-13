import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Pages/user-profile-page.dart';

Stack PremiumProfilePhotoWidget(BuildContext context) {

  return Stack(
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
              color: Colors.blue,
              borderRadius: BorderRadius.circular(50)
          ),

          child: ClipOval(
            child: GestureDetector(
              onTap: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => UserProfilePage()
                    )
                );
              },
              child: Image.asset("images/MyPhoto.jpeg", height: 65,),
              // Image.network(
              //   "https://randomuser.me/api/portraits/men/60.jpg",
              //   height: 65,
              // ),
            ),
          ),
        ),
      ),
      Positioned(
          bottom: 0,
          left: 55,
          child: Container(
            height: 23,
            width: 23,
            decoration: BoxDecoration(
                color: Colors.blue.shade700,
                borderRadius: BorderRadius.circular(50)
            ),
            child: Center(
              child: Icon(
                CupertinoIcons.checkmark_seal_fill,
                color: Color(0xffffd500),
                size: 20,
              ),
            ),
          )),
    ],
  );
}
