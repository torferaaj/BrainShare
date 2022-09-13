import 'package:brainshare/Auth/google-sign-in.dart';
import 'package:brainshare/Screens/splash-screen.dart';
import 'package:brainshare/utils/user-preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:brainshare/Pages/community-page.dart';
import 'package:brainshare/Pages/bookmark-page.dart';
import 'package:brainshare/Pages/settings-page.dart';
import 'package:brainshare/Pages/tag-page.dart';
import 'package:brainshare/Pages/notes-page.dart';
import 'package:brainshare/Screens/welcome-screem.dart';
import 'package:brainshare/Screens/help-screen.dart';
import 'package:brainshare/Widgets/premium-profile-photo-widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import '../utils/user-preferences.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  await UserPreferences.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
      create: (context) => GoogleSignInProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        // theme: ThemeData(
        //   canvasColor: _kAppColor,
        //   snackBarTheme: const SnackBarThemeData(
        //     backgroundColor: Colors.brown,
        //     contentTextStyle: TextStyle(
        //       fontSize: 20,
        //     ),
        //   ),
        // ),
        home: const Splash(),
      ),
    );

}

SafeArea drawer_list(BuildContext context) {

  final user = UserPreferences.getUser();

  return SafeArea(
    child: Container(
      // color: Colors.red,
      width: 200.0,
      padding: EdgeInsets.all(8.0),
      child: Column(
        children: [
          DrawerHeader(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                PremiumProfilePhotoWidget(context),

                SizedBox(height: 10.0,),
                Text(
                  user.name,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.w200,
                    color: Colors.white,
                    fontSize: 18.0,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10,),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(left: 5),
              child: ListView(
                children: [
                  ListTile(
                    onTap: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => CommunityPage()
                          )
                      );
                    },
                    leading: Icon(
                      CupertinoIcons.bell_fill,
                      color: Colors.white,
                    ),
                    title: Text(
                      "Community",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  ListTile(
                    onTap: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => NotesPage()
                          )
                      );
                    },
                    leading: Icon(
                      CupertinoIcons.square_list,
                      color: Colors.white,
                    ),
                    title: Text(
                      "Brain Notes",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  ListTile(
                    onTap: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => BookmarkPage()
                          )
                      );
                    },
                    leading: Icon(
                      CupertinoIcons.bookmark,
                      color: Colors.white,
                    ),
                    title: Text(
                      "Bookmarks",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  ListTile(
                    onTap: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => TagPage()
                          )
                      );
                    },
                    leading: Icon(
                      Icons.tag,
                      color: Colors.white,
                    ),
                    title: Text(
                      "HashTags",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  ListTile(
                    onTap: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => SettingsPage()
                          )
                      );
                    },
                    leading: Icon(
                      Icons.handyman_rounded,
                      color: Colors.white,
                    ),
                    title: Text(
                      "Settings",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(height: 40,),
                  Divider(thickness: 1, color: Colors.white,),
                  SizedBox(height: 40,),
                  ListTile(
                    onTap: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => HelpScreen()
                          )
                      );
                    },
                    leading: Icon(
                      CupertinoIcons.question_circle,
                      color: Colors.white,
                    ),
                    title: Text(
                      "Help",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  ListTile(
                    onTap: (){
                      // Navigator.pushReplacement(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (BuildContext context) => WelcomePage()
                      //     )
                      // );
                      FirebaseAuth.instance.signOut();
                    },
                    leading: Icon(
                      CupertinoIcons.square_arrow_left,
                      color: Colors.white,
                    ),
                    title: Text(
                      "Sign out",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
