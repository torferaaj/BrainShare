import 'package:brainshare/Pages/notes-page.dart';
import 'package:brainshare/Style/notes-style.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NoteReaderScreen extends StatefulWidget {
  NoteReaderScreen(this.doc,this.id);
  QueryDocumentSnapshot doc;
  String id;




  @override
  State<NoteReaderScreen> createState() => _NoteReaderScreenState();
}

class _NoteReaderScreenState extends State<NoteReaderScreen> {

  @override
  Widget build(BuildContext context) {
    int color_id = widget.doc['color_id'];

    return Scaffold(
      backgroundColor: NotesStyle.cardsColor[color_id],
      appBar: AppBar(

        backgroundColor: NotesStyle.cardsColor[color_id],
        elevation: 0.0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(CupertinoIcons.arrow_left,
            color: Colors.black87,
          ),
        ),
        actions: [Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: IconButton(
            splashRadius: 25,
            splashColor: Colors.redAccent,
            onPressed: () async {
              // widget.doc.d
              FirebaseFirestore.instance.collection("Notes").doc(widget.id.toString()).delete();
              Navigator.pop(context);
            },
            icon: Icon(Icons.delete, color: Colors.black54, size: 25,),
          ),
        ),],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.doc["note_title"],
              style: NotesStyle.mainTitle,
            ),
            SizedBox(height: 4.0,),
            Row(
              children: [
                Text(
                  widget.doc["creation_date"].substring(0, 10),
                  style: NotesStyle.dateTitle,
                ),
                Text(
                  "  |  ",
                  style: NotesStyle.dateTitle,
                ),
                Text(
                  widget.doc["creation_date"].substring(11, 16),
                  style: NotesStyle.dateTitle,
                ),
              ],
            ),
            SizedBox(height: 8.0,),
            Divider(
              color: Colors.black26,
            ),
            SizedBox(height: 20.0,),
            Text(
              widget.doc["note_content"],
              style: NotesStyle.mainContent,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
