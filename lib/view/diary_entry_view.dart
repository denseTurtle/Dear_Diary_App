import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DiaryEntryView extends StatefulWidget {
  @override
  _DiaryEntryViewState createState() => _DiaryEntryViewState();
}

class _DiaryEntryViewState extends State<DiaryEntryView> {
  DateTime selectedDate = DateTime.now();
  TextEditingController diaryEntryController = TextEditingController();
  int rating = 3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Diary Entry'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Date: ${DateFormat('MMMM dd, yyyy').format(selectedDate)}',
              style: TextStyle(fontSize: 18),
            ),
            ElevatedButton(
              onPressed: () {
                _selectDate(context);
              },
              child: Text('Select Date'),
            ),
            TextFormField(
              controller: diaryEntryController,
              decoration: InputDecoration(
                labelText: 'Diary Entry (max 140 characters)',
              ),
              maxLength: 140,
              maxLines: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Rating: '),
                Slider(
                  value: rating.toDouble(),
                  onChanged: (newRating) {
                    setState(() {
                      rating = newRating.round();
                    });
                  },
                  min: 1,
                  max: 5,
                ),
                Text('$rating/5'),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                // Save the diary entry and associated data
                // Implement your logic to save the entry
              },
              child: Text('Save Entry'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime.now(),
    );

    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }
}
