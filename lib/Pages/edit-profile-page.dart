import 'package:brainshare/Pages/user-profile-page.dart';
import 'package:brainshare/Widgets/bottom-bar-widget.dart';
import 'package:brainshare/utils/user-preferences.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Widgets/editpage-profile-photo.dart';
import '../model/user-model.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {

  TextEditingController fullName = TextEditingController();
  TextEditingController collegeEmailID = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController retypePassword = TextEditingController();

  int buttonColor = 0xff26A9FF;

  bool inputTextNotNull = false;

  AppBar UserAppBar(){
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0.5,
      automaticallyImplyLeading: false,
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(
          CupertinoIcons.xmark,
          color: Colors.black87,),),
      actions: [
        Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: IconButton(
              onPressed: () {UserPreferences.setUser(user);
              Navigator.pop(context);
              },
              icon: Icon(
                CupertinoIcons.checkmark_alt,
                size: 30,
                color: Colors.blue,),)
        ),
      ],
    );
  }

  User user = UserPreferences.getUser();
  TextEditingController nameController = TextEditingController();
  TextEditingController aboutController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  @override
  void initState() {
    super.initState();

    nameController = TextEditingController(text: user.name);
    aboutController = TextEditingController(text: user.about);
    emailController = TextEditingController(text: user.email);
  }

  @override
  Widget build(BuildContext context) {

    double deviseWidth = MediaQuery.of(context).size.width;

    return Builder(
      builder: (context) => Scaffold(
        appBar: UserAppBar(),
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 32),
          physics: BouncingScrollPhysics(),
          children: [
            Center(
                child: Column(
                  children: [
                    SizedBox(height: 20,),
                    EditPageProfilePhoto(context),
                    SizedBox(height: 40,),
                    Form(
                      child: TextFormField(
                        onChanged: (name) => user = user.copy(name: name),
                        controller: nameController,
                        decoration: InputDecoration(
                          labelText: 'Name',
                          labelStyle: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        maxLength: 25,
                      ),
                    ),
                    SizedBox(height: 20,),
                    Form(
                      child: TextFormField(
                        onChanged: (email) => user = user.copy(email: email),
                        controller: emailController,
                        decoration: InputDecoration(
                          labelText: 'Email',
                          labelStyle: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        maxLength: 25,
                      ),
                    ),
                    SizedBox(height: 20,),
                    Form(
                      child: TextFormField(
                        onChanged: (about) => user = user.copy(about: about),
                        controller: aboutController,
                        decoration: InputDecoration(
                          labelText: 'About',
                          labelStyle: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        maxLength: 300,
                        minLines: 1,
                        maxLines: 3,
                      ),
                    ),
                  ],
                ),
            ),
          ],

        ),
      ),
    );
  }
}
