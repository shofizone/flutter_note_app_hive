import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:notes/strings.dart';

import 'note.dart';

class NewNoteScreen extends StatefulWidget {
  @override
  _NewNoteScreenState createState() => _NewNoteScreenState();
}

class _NewNoteScreenState extends State<NewNoteScreen> {
  var titleController = TextEditingController();
  var descriptionController = TextEditingController();

  Future<int> addNote(Note note) async {
    return await Hive.box(Strings.note).add(note);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              var note = Note(
                  time: DateTime.now(),
                  title: titleController.text,
                  details: descriptionController.text);
              addNote(note);
            },
          )
        ],
      ),
      body: ListView(
        children: <Widget>[
          TextFormField(
            controller: titleController,
          ),
          TextFormField(
            controller: descriptionController,
          )
        ],
      ),
    );
  }
}
