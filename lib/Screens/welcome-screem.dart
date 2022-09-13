import 'package:brainshare/Auth/google-sign-in.dart';
import 'package:brainshare/Auth/sign-up-page-auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:animations/animations.dart';
import 'package:provider/provider.dart';
import '../Auth/login-page-auth.dart';
import '../Widgets/bottom-bar-widget.dart';

class WelcomePage extends StatefulWidget {
  WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  int buttonColor = 0xff26A9FF;

  @override
  Widget build(BuildContext context) {
    double deviseWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot){
          if(snapshot.hasData){
            return BottomBar();
          }
          else{
            return Scaffold(
              backgroundColor: Colors.white,
              body: Column(
                children: [
                  Column(
                    children: [
                      SizedBox(
                        height: 90,
                      ),
                      // Padding(
                      //   padding: const EdgeInsets.only(top: 70.0),
                      //   child: Container(
                      //     width: 310,
                      //     child: Center(
                      //       child: Text(
                      //         "Share                                               Your Knowledge",
                      //         textAlign: TextAlign.center,
                      //         style: TextStyle(
                      //           fontSize: 25,
                      //           fontWeight: FontWeight.w600,
                      //           color: Color(0xff5398ed),
                      //         ),
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: Text(
                          "Connect your Brain through BrainShare to acquire better solutions for your error.",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w200),
                        ),
                      ),

                      Center(
                        child: Image.asset(
                          "images/welcome.jpg",
                          height: 350,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: deviseWidth * .80,
                        height: deviseWidth * .13,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.blue,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: TextButton(
                          onPressed: () {
                            Navigator.pushReplacement(context,
                                MaterialPageRoute(builder: (context) {
                                  return SignUp();
                                }));
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.email_outlined,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                'Sign Up with Email',
                                style: TextStyle(
                                  color: Colors.lightBlue,
                                  fontSize: deviseWidth * .045,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      // Text("or", style: TextStyle(fontSize: 16),),
                      // SizedBox(height: 20,),
                      Container(
                        width: deviseWidth * .80,
                        height: deviseWidth * .13,
                        decoration: BoxDecoration(
                          color: Color(0xff78C9FF),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: TextButton(
                          onPressed: () {
                            final provider = Provider.of<GoogleSignInProvider>(context, listen: false);
                            provider.googleLogin();
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                "images/google-icon.png",
                                height: 25,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                'Sign Up with Google',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: deviseWidth * .045,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 100),
                        child: Row(
                          children: [
                            Text("Already have an account?"),
                            TextButton(
                              onPressed: () {
                                Navigator.pushReplacement(context,
                                    MaterialPageRoute(builder: (context) {
                                      return loginPage();
                                    }));
                              },
                              child: Text(
                                'Log in',
                                style: TextStyle(
                                  color: Colors.lightBlue,
                                  fontSize: deviseWidth * .035,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                    ],
                  ),
                ],
              ),
            );
          }
        }
      ),
    );
  }
}
