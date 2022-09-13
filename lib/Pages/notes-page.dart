import 'dart:math';

import 'package:brainshare/Screens/notes-editor-screen.dart';
import 'package:brainshare/Screens/notes-reader-screen.dart';
import 'package:brainshare/Style/notes-style.dart';
import 'package:brainshare/Widgets/bottom-bar-widget.dart';
import 'package:brainshare/Widgets/notes-card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NotesPage extends StatefulWidget {
  const NotesPage({Key? key}) : super(key: key);

  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {

  @override
  Widget build(BuildContext context) {



    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 2.0,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) {
                          return BottomBar();
                        },
                    ),
                );
              },
              icon: Icon(CupertinoIcons.arrow_left,
                color: Colors.black87,
              ),
            );
          },
        ),
        title: Text("Brain Notes", style: TextStyle(color: Colors.black87),),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Your recent Notes",
              style: GoogleFonts.roboto(
                color: Colors.black87,
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
            Divider(
              color: Colors.black26,
            ),
            SizedBox(height: 20,),
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream:
                  FirebaseFirestore.instance.collection("Notes").snapshots(),
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if(snapshot.hasData) {
                    return
                    

                    GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            mainAxisExtent: 120,
                            crossAxisCount: 2),
                        itemCount: snapshot.data.docs.length,
                        itemBuilder: (_, int index) {
                          String id = snapshot.data.docs[index].id;

                          return noteCard(() {
                            Navigator.push(
                                context,
                                CupertinoPageRoute(
                                  builder: (context) => NoteReaderScreen( snapshot.data!.docs[index],id),
                                )
                            );
                          }, snapshot.data!.docs[index]);
                        });
                  }
                  return Text(
                    "there's no Notes",
                    style: GoogleFonts.nunito(
                      color: Colors.black87,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => NoteEditorScreen()
            ),
          );
        },
        label: Text(
          "Add Note",
        ),
        icon: Icon(
          CupertinoIcons.add,
        ),
      ),
    );
  }
}
