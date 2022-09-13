import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Pages/user-profile-page.dart';
import '../utils/user-preferences.dart';

Stack NormalProfilePhotoWidget(BuildContext context) {
  final user = UserPreferences.getUser();

  return Stack(
    children: [
      Container(
        padding: EdgeInsets.all(3),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: Colors.white,
        ),
        child: Container(
          padding: EdgeInsets.all(2),

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
            padding: EdgeInsets.all(2),
            decoration: BoxDecoration(
                color: Colors.white,
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
                child: Image.asset("images/MyPhoto.jpeg", height: 40,),
                // Image.network(
                //   "https://randomuser.me/api/portraits/men/60.jpg",
                //   // user.imagePath,
                //   height: 40,
                // ),
              ),
            ),
          ),
        ),
      ),
      Positioned(
          bottom: 0,
          left: 32,
          child: Container(
            height: 17,
            width: 17,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50)
            ),
            child: Center(
              child: Icon(
                CupertinoIcons.checkmark_seal_fill,
                // color: Color(0xffffd500),
                size: 14,
                color: Colors.green,
              ),
            ),
          )),
    ],
  );
}
