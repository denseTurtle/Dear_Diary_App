import 'package:flutter/material.dart';
import 'view/diary_entry_view.dart'; // Import the DiaryEntryView widget

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DiaryEntryView(), // Use DiaryEntryView as the home screen
    );
  }
}
