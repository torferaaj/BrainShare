import 'package:brainshare/Auth/login-page-auth.dart';
import 'package:brainshare/Auth/sign-up-page-auth.dart';
import 'package:brainshare/Screens/welcome-screem.dart';
import 'package:brainshare/Widgets/bottom-bar-widget.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

const double _kSize = 50;
const Color _kAppColor = Colors.white;

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {

  // Widget currentPage = WelcomePage();
  // loginPage LoginPage = loginPage();

  @override
  void initState() {
    super.initState();
    // checkLogin();
    _navigateToHome();
  }

  // void checkLogin() async{
  //   String? token = await loginPage.getToken();
  //   print("Token is =========================== : " + token.toString());
  //   if(token != null){
  //     setState(() {
  //       currentPage = BottomBar();
  //     });
  //   }
  // }

  _navigateToHome()async{
    await Future.delayed(Duration(milliseconds: 2000), () {});
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => WelcomePage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 300.0),
              child: Container(
                // color: Colors.red,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(image: AssetImage('images/brainshare_logo.png'),height: 170,),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 200.0),
              child: Container(
                // color: Colors.green,
                child: Center(
                    child: Column(
                      children: [
                        LoadingAnimationWidget.discreteCircle(color: Colors.black54, size: 30),
                      ],
                    )
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

}


