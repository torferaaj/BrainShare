import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


Container EditPageProfilePhoto(BuildContext context) {
  return Container(
    // color: Colors.green,
    height: 110,
    child: Stack(
      children: [
        Container(
          // color: Colors.red,
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
              child: Image.asset("images/MyPhoto.jpeg", height: 105,),
              // Image.network(
              //   "https://randomuser.me/api/portraits/men/60.jpg",
              //   height: 105,
              // ),
            ),
          ),
        ),

        Positioned(
            bottom: 0,
            left: 70,
            child: Container(
              padding: EdgeInsets.all(2.0),

              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.white
              ),

              child: Container(
                height: 32,
                width: 32,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(50)
                ),
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    CupertinoIcons.camera_fill,
                    // color: Color(0xfff6b500),
                    color: Colors.white,
                    size: 16,
                  ),
                ),
              ),
            )
        ),
      ],
    ),
  );
}
