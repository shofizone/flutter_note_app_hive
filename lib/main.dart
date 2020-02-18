import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';

import 'HomePage.dart';
import 'notes_provider.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

void main() async {
  runApp(MyApp());

  /// init hive
 path_provider.getApplicationDocumentsDirectory().then((documentDirectory){
        Hive.init(documentDirectory.path);
      });





}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => NoteProvider(),
      child: MaterialApp(
        title: 'Notes',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(),
      ),
    );
  }
}
