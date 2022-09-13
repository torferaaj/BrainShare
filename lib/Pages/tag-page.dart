import 'package:flutter/material.dart';

class TagPage extends StatelessWidget {
  const TagPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blue,
        child: Center(
          child: Text(
            "HashTag Page"
          ),
        ),
      ),
    );
  }
}
