import 'package:brainshare/Pages/edit-profile-page.dart';
import 'package:brainshare/utils/user-preferences.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Widgets/userpage-profile-photo.dart';

class UserProfilePage extends StatefulWidget {
  const UserProfilePage({Key? key}) : super(key: key);

  @override
  State<UserProfilePage> createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  AppBar UserAppBar(){
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0.5,
      automaticallyImplyLeading: false,
      leading: IconButton(
        onPressed: () {},
        icon: Icon(
          CupertinoIcons.chart_bar_alt_fill,
          color: Colors.black,),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 10.0),
          child: IconButton(
              onPressed: () {},
              icon: Icon(
                CupertinoIcons.doc_richtext,
                size: 25,
                color: Colors.black87,),)
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final user = UserPreferences.getUser();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: UserAppBar(),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
            Center(
              child: Column(
                children: [
                  SizedBox(height: 10,),
                  userPageProfilePhoto(context),
                  Text(
                    user.name,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    user.email,
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(height: 20,),
                  Padding(
                    padding: const EdgeInsets.only(left: 127.0),
                    child: Row(
                      children: [
                        OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            shape: StadiumBorder(),
                          ),
                            onPressed: () async {
                              await Navigator.push(
                                  context,
                                  CupertinoPageRoute(
                                      builder: (context) {
                                        return EditProfilePage();
                                      },
                                  ),
                              );
                              setState(() {});
                            },
                            child: Row(
                              children: [
                                Icon(Icons.edit,
                                  size: 19,
                                  color: Colors.blue,
                                ),
                                SizedBox(width: 8,),
                                Text(
                                  "Edit profile",
                                ),
                              ],
                            ),
                        ),
                        // SizedBox(width: 10,),
                        // Icon(Icons.edit,
                        //   size: 20,
                        //   color: Colors.grey,
                        // ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10,),
                  IntrinsicHeight(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 17.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                            onPressed: () {},
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "32",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "Queried",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                      color: Colors.grey
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            // padding: EdgeInsets.only(right: 8, left: 5),
                            height: 28,
                            child: VerticalDivider(
                              width: 20,
                              color: Colors.black,
                            ),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "242",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "Answered",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                      color: Colors.grey
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 28,
                            child: VerticalDivider(
                              width: 20,
                              color: Colors.black,
                            ),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "9.8",
                                  style: TextStyle(
                                    color: Colors.amber.shade700,
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "Trustability",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                      color: Colors.grey
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
                  Container(
                    padding: EdgeInsets.all(20),
                    width: 330,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.blue.shade100, width: 1.0),
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "About",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10,),
                        Text(
                          user.about,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 30,),
                ],
              ),
            ),
          Padding(
            padding: const EdgeInsets.only(left: 30.0),
            child: Text(
              "Recent activities",
              style: TextStyle(
                fontWeight: FontWeight.w200,
                fontSize: 14,
              ),
            ),
          ),
          Divider(
            color: Colors.black,
            indent: 30,
            endIndent: 30,
          ),
          Container(
            height: 200,
          ),
        ],
      ),
    );
  }
}
