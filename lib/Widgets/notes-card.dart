
import 'dart:math';

import 'package:brainshare/Style/notes-style.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget noteCard(Function() ? onTap, QueryDocumentSnapshot doc) {
  String string = doc["creation_date"]; //substring

  return InkWell(
    onTap: onTap,
    child: Container(

      padding: EdgeInsets.all(8.0),
      margin: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: NotesStyle.cardsColor[doc['color_id']],
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            doc["note_title"],
            style: NotesStyle.mainTitle,
          ),
          SizedBox(height: 4.0,),
          Row(
            children: [
              Text(
                doc["creation_date"].substring(0, 10),
                style: NotesStyle.dateTitle,
              ),
              Text(
                "  |  ",
                style: NotesStyle.dateTitle,
              ),
              Text(
                doc["creation_date"].substring(11, 16),
                style: NotesStyle.dateTitle,
              ),
            ],
          ),
          SizedBox(height: 12.0,),
          Text(
            doc["note_content"],
            style: NotesStyle.mainContent,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    ),
  );
}