import 'package:brainshare/Screens/help-screen.dart';
import 'login-page-auth.dart';
import 'package:flutter/material.dart';

class forgetPassword extends StatefulWidget {
  const forgetPassword({Key? key}) : super(key: key);

  @override
  _forgetPasswordState createState() => _forgetPasswordState();
}

class _forgetPasswordState extends State<forgetPassword> {

  TextEditingController collegeEmailID = TextEditingController();


  int buttonColor = 0xff26A9FF;
  var _formKey = GlobalKey<FormState>();

  bool inputTextNotNull = false;

  @override
  Widget build(BuildContext context) {

    // final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
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
            Text("Password reset", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),),
            SizedBox(height: 5,),
            Text("Enter the registered mail ID to send reset link", style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal, color: Colors.black38),),
            SizedBox(height: 30,),
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
                          if(collegeEmailID.text.length >= 10){
                            inputTextNotNull = true;
                          }else{
                            inputTextNotNull = false;
                          }
                        });
                      },
                      decoration: InputDecoration(
                        // hintText: "Email ID",
                        labelText: "College email ID",
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
                ],
              ),
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.only(left: 50.0),
              child: Row(
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) {
                                  return HelpScreen();
                                }));},
                      child: Text(
                        "help?",
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
              padding: const EdgeInsets.symmetric(horizontal: 0.0),
              child: Container(
                width: deviseWidth * .40,
                height: deviseWidth * .09,
                decoration: BoxDecoration(
                  color: inputTextNotNull ? Color(buttonColor) : Color(0xff78C9FF),
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
                child: Center(
                  child: TextButton(
                    onPressed: () {
                      print("Email ID: " + collegeEmailID.text);
                      if(_formKey.currentState!.validate()){
                        // final snackBar = SnackBar(content: Text('Logging in'));
                        // _scaffoldKey.currentState!.showSnackBar(snackBar);
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) {
                                  return loginPage();
                                }));
                      }
                    },
                    child: Text(
                      'Send reset link',
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
