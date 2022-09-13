import 'package:brainshare/Auth/forget-password-auth.dart';
import 'package:brainshare/Auth/sign-up-page-auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:brainshare/Widgets/bottom-bar-widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';



class loginPage extends StatefulWidget {
  loginPage({Key? key}) : super(key: key);

  // //For Stay login
  // static Future<void> storeTokenAndData(UserCredential userCredential) async{
  //
  //   final storage = new FlutterSecureStorage();
  //
  //   await storage.write(key: "token", value: userCredential.credential?.token.toString());
  //   await storage.write(key: "userCredential", value: userCredential.toString());
  // }
  //
  // static Future<String?> getToken() async{
  //   //For Stay login
  //   final storage = new FlutterSecureStorage();
  //
  //   return await storage.read(key: "token");
  // }

  @override
  _loginPageState createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {

  TextEditingController collegeEmailID = TextEditingController();
  TextEditingController password = TextEditingController();

  int buttonColor = 0xff26A9FF;
  String passwordError = "";
  String emailIdError = "";

  var _formKey = GlobalKey<FormState>();

  bool inputTextNotNull = false;
  bool secureText = true;

  @override
  Widget build(BuildContext context) {

    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    double deviseWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 70.0),
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
            Text("Login Now", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),),
            SizedBox(height: 5,),
            Text("Please fill the details to login account", style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal, color: Colors.black38),),
            SizedBox(height: 50,),
            Form(
                key: _formKey,
                child: Column(
                  children: [
                    Container(
                      width: deviseWidth * .79,
                      // height: deviseWidth * .10,
                      child: TextFormField(
                        validator: (value){
                          if(value!.isEmpty || value.length <= 10)
                            return "Enter valid email ID";
                          else
                            return null;
                        },
                        controller: collegeEmailID,
                        onChanged: (text){
                          setState(() {
                            if(collegeEmailID.text.length >= 10 &&
                                password.text.length >= 8 ){
                              inputTextNotNull = true;
                            }else{
                              inputTextNotNull = false;
                            }
                          });
                        },
                        decoration: InputDecoration(
                          // hintText: "Email ID",
                          labelText: "Email ID",
                          labelStyle: TextStyle(
                            fontSize: 15,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(color: Colors.transparent),
                          ),
                          fillColor: Colors.grey.shade200,
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),

                      ),
                    ),
                    SizedBox(height: 20,),
                    Container(
                      width: deviseWidth * .79,
                      // height: deviseWidth * .10,
                      child: TextFormField(
                        validator: (value){
                          if(value!.isEmpty || value.length <= 8)
                            return "Enter valid password";
                          else
                            return null;
                        },
                        controller: password,
                        obscureText: secureText,
                        onChanged: (text){
                          setState(() {
                            if(collegeEmailID.text.length >= 10 &&
                                password.text.length >= 8 ){
                              inputTextNotNull = true;
                            }else{
                              inputTextNotNull = false;
                            }
                          });
                        },
                        decoration: InputDecoration(
                          // hintText: "Email ID",
                          labelText: "Password",
                          labelStyle: TextStyle(
                            fontSize: 15,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(color: Colors.transparent),
                          ),
                          fillColor: Colors.grey.shade200,
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          suffixIcon: InkWell(
                            onTap: () {
                              setState(() {
                                secureText = !secureText;
                              });
                            },
                            child: secureText
                                ? Icon(
                                  CupertinoIcons.eye_solid,
                                )
                                : Icon(
                                  CupertinoIcons.eye_slash_fill,
                                ),
                          ),
                        ),

                      ),
                    ),

                  ],
                ),
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50.0),
              child: Row(
                children: [
                  TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) {
                              return SignUp();
                            }));},
                  child: Text(
                    "Create an account",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Colors.blueAccent,
                    ),
                  ),
                ),
                  Spacer(),
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) {
                                return forgetPassword();
                              }));},
                    child: Text(
                      "Forget password?",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Colors.blueAccent,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ]),
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.only(left: 145.0),
              child: Container(
                width: deviseWidth * .30,
                height: deviseWidth * .09,
                decoration: BoxDecoration(
                  // color: Color(0xff78C9FF),
                  color: inputTextNotNull ? Color(buttonColor) : Color(0xff78C9FF),
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
                child: Center(
                  child: TextButton(
                    onPressed: () async{
                      print("Email ID: " + collegeEmailID.text);
                      print("Password: " + password.text);
                      if(_formKey.currentState!.validate()){
                        UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(email: collegeEmailID.text, password: password.text);
                        // print("userCredential is ======================== : "+userCredential.toString());
                        // loginPage.storeTokenAndData(userCredential);
                        final snackBar = SnackBar(content: Text('Logging in'));
                        // _scaffoldKey.currentState!.showSnackBar(snackBar);
                        // UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) {
                                  return BottomBar();
                                }));
                        }
                      },
                    child: Text(
                      'Login',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: deviseWidth * .040,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20,),
          ],
        ),
      ),
    );
  }




}
