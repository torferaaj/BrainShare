import 'dart:math';

import 'package:brainshare/Pages/notes-page.dart';
import 'package:brainshare/Style/notes-style.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NoteEditorScreen extends StatefulWidget {
  const NoteEditorScreen({Key? key}) : super(key: key);

  @override
  State<NoteEditorScreen> createState() => _NoteEditorScreenState();
}

class _NoteEditorScreenState extends State<NoteEditorScreen> {

  int color_id = Random().nextInt(NotesStyle.cardsColor.length);
  String date = DateTime.now().toString();
  TextEditingController _titleController = TextEditingController();
  TextEditingController _mainController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: NotesStyle.cardsColor[color_id],
      appBar: AppBar(
        backgroundColor: NotesStyle.cardsColor[color_id],
        elevation: 2.0,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return NotesPage();
                    },
                  ),
                );
              },
              icon: Icon(CupertinoIcons.xmark,
                color: Colors.black87,
              ),
            );
          },
        ),
        iconTheme: IconThemeData(color: Colors.black87),
        title: Text(
          "Add a new Note",
          style: TextStyle(
            color: Colors.black87
          ),
        ),
        actions: [
          Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: IconButton(
                onPressed: () async {
                  FirebaseFirestore.instance.collection("Notes").add({
                    "note_title": _titleController.text,
                    "creation_date": date,
                    "note_content": _mainController.text,
                    "color_id": color_id
                  }).then((value) {
                    print(value.id);
                    Navigator.pop(context);
                  }).catchError(
                      (error) => print("Failed to add new Note due to $error")
                  );
                },
                icon: Icon(
                  CupertinoIcons.checkmark_alt,
                  size: 30,
                  color: Colors.blue,),)
          ),

        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Note Title'
              ),
              style: NotesStyle.mainTitle,
            ),
            SizedBox(height: 8.0,),
            Row(
              children: [
                Text(
                  date.substring(0, 10),
                  style: NotesStyle.dateTitle,
                ),
                Text(
                  "  |  ",
                  style: NotesStyle.dateTitle,
                ),
                Text(
                  date.substring(11, 16),
                  style: NotesStyle.dateTitle,
                ),
              ],
            ),
            SizedBox(height: 20.0,),
            TextField(
              controller: _mainController,
              keyboardType: TextInputType.multiline,
              maxLines: null,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Note content'
              ),
              style: NotesStyle.mainContent,
            ),
          ],
        ),
      ),
    );
  }
}
