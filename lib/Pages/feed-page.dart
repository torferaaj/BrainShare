import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Widgets/post-widget.dart';
import '../utils/user-preferences.dart';

class FeedPage extends StatelessWidget {
  bool isPressed = true;

  @override
  Widget build(BuildContext context) {

    final user = UserPreferences.getUser();
    Offset distance = Offset(20, 20);
    double blur = 30.0;

    return Scaffold(
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          Column(
            children: [
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.only(right: 232.0),
                child: Text(
                  "All Queries",
                  style: TextStyle(
                      fontSize: 21,
                      color: Colors.black87,
                      fontWeight: FontWeight.w700
                  ),
                ),
              ),
              Container(
                child: Divider(
                  thickness: 1,
                  indent: 25,
                  endIndent: 25,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 20,),
              PostWidget(user: user, blur: blur),
              PostWidget(user: user, blur: blur),
              PostWidget(user: user, blur: blur),
              PostWidget(user: user, blur: blur),
              PostWidget(user: user, blur: blur),

            ],
          ),
        ],
      ),
    );
  }
}

