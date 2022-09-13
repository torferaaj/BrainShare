import 'package:brainshare/Widgets/bottom-bar-widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'login-page-auth.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController fullName = TextEditingController();
  TextEditingController collegeEmailID = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController retypePassword = TextEditingController();

  int buttonColor = 0xff26A9FF;
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
            Text("Sign Up Now", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),),
            SizedBox(height: 5,),
            Text("Please fill the details and create account", style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal, color: Colors.black38),),
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
                        if(value!.isEmpty || value.length <= 0)
                          return "Enter the full name";
                        else
                          return null;
                      },
                      controller: fullName,
                      onChanged: (text){
                        setState(() {
                          if(fullName.text.length >= 0 &&
                              collegeEmailID.text.length >= 10 &&
                              password.text.length >= 8 &&
                              retypePassword.text.length >= 8){
                            inputTextNotNull = true;
                          }else{
                            inputTextNotNull = false;
                          }
                        });
                      },
                      decoration: InputDecoration(
                        // hintText: "Email ID",
                        labelText: "Full Name",
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
                        if(value!.isEmpty || value.length <= 10)
                          return "Enter valid email ID";
                        else
                          return null;
                      },
                      controller: collegeEmailID,
                      onChanged: (text){
                        setState(() {
                          if(fullName.text.length >= 0 &&
                              collegeEmailID.text.length >= 10 &&
                              password.text.length >= 8 &&
                              retypePassword.text.length >= 8){
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
                          return "Password is too weak";
                        else
                          return null;
                      },
                      controller: password,
                      obscureText: secureText,
                      onChanged: (text){
                        setState(() {
                          if(fullName.text.length >= 0 &&
                              collegeEmailID.text.length >= 10 &&
                              password.text.length >= 8 &&
                              retypePassword.text.length >= 8){
                            inputTextNotNull = true;
                          }else{
                            inputTextNotNull = false;
                          }
                        });
                      },
                      decoration: InputDecoration(
                        // hintText: "Email ID",
                        labelText: "password",
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
                        // suffixIcon: InkWell(
                        //   onTap: () {
                        //     setState(() {
                        //       secureText = !secureText;
                        //     });
                        //   },
                        //   child: secureText
                        //       ? Icon(
                        //     CupertinoIcons.eye_solid,
                        //   )
                        //       : Icon(
                        //     CupertinoIcons.eye_slash_fill,
                        //   ),
                        // ),
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
                          return "Re-type password does not match";
                        else
                          return null;
                      },
                      controller: retypePassword,
                      obscureText: secureText,
                      onChanged: (text){
                        setState(() {
                          if(fullName.text.length >= 0 &&
                              collegeEmailID.text.length >= 10 &&
                              password.text.length >= 8 &&
                              retypePassword.text.length >= 8){
                            inputTextNotNull = true;
                          }else{
                            inputTextNotNull = false;
                          }
                        });
                      },
                      decoration: InputDecoration(
                        // hintText: "Email ID",
                        labelText: "Re-type password",
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
                        // suffixIcon: InkWell(
                        //   onTap: () {
                        //     setState(() {
                        //       secureText = !secureText;
                        //     });
                        //   },
                        //   child: secureText
                        //       ? Icon(
                        //     CupertinoIcons.eye_solid,
                        //   )
                        //       : Icon(
                        //     CupertinoIcons.eye_slash_fill,
                        //   ),
                        // ),
                      ),

                    ),
                  ),
                  SizedBox(height: 10,),

                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 120.0),
              child: TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) {
                              return loginPage();
                            }));},
                  child: Text(
                    "Already have an account?",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Colors.blueAccent,
                      decoration: TextDecoration.underline,
                    ),
                  ),
              ),
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.only(left: 130.0),
              child: Container(
                width: deviseWidth * .30,
                height: deviseWidth * .09,
                decoration: BoxDecoration(
                  color: inputTextNotNull ? Color(buttonColor) : Color(0xff78C9FF),
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
                child: Center(
                  child: TextButton(
                    onPressed: () async{
                      print("Full Name : " + fullName.text);
                      print("Email ID : " + collegeEmailID.text);
                      print("Password : " + password.text);
                      print("Re-type Password : " + retypePassword.text);
                      if(_formKey.currentState!.validate()){
                        if(password.text != retypePassword.text){
                          final snackBar = SnackBar(content: Text('Incorrect password'));
                          _scaffoldKey.currentState!.showSnackBar(snackBar);
                        }
                        else{
                          await FirebaseAuth.instance.createUserWithEmailAndPassword(email: collegeEmailID.text, password: password.text);
                          final snackBar = SnackBar(content: Text('Logging in'));
                          // _scaffoldKey.currentState!.showSnackBar(snackBar);
                          final name = FirebaseAuth.instance.currentUser;
                          name?.updateDisplayName(fullName.text);

                          // or use this

                          // final user = FirebaseAuth.instance.currentUser;
                          // if (user != null) {
                          //
                          //   user.updateDisplayName(fullName.text);
                          //
                          // }
                          // name.displayName = ran;
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) {
                                    return loginPage();
                                  }));
                        }
                      }
                    },
                    child: Text(
                      'Sign Up',
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
