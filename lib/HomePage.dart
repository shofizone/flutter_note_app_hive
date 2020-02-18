import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:notes/new_note_screen.dart';
import 'package:notes/note.dart';
import 'package:notes/strings.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void dispose() {
    Hive.box(Strings.note);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => NewNoteScreen()));
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        title: Text("Note"),
      ),
      body: FutureBuilder<Box>(
          future: Hive.openBox(Strings.note),
          builder: (context, AsyncSnapshot<Box> snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: 0,
                  itemBuilder: (context, int index) {
                    return ListTile(
                      leading: CircleAvatar(),
                      title: Text("Title"),
                      subtitle: Text("Date"),
                    );
                  });
            }

//            if (snapshot.hasError) {
//              return Center(
//                child: Text(snapshot.error.toString()),
//              );
//            }

            return Center(
              child: CupertinoActivityIndicator(),
            );
          }),
    );
  }
}
