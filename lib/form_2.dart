import 'package:flutter/material.dart';
import 'form_3.dart';

class form_2 extends StatefulWidget {
  final String name;

  form_2({required this.name});

  @override
  _form_2State createState() => _form_2State();
}

class _form_2State extends State<form_2> {
  TextEditingController _dobController = TextEditingController();
  DateTime? _selectedDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Форма 2'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text('Добро пожаловать, ${widget.name}!'),
            ElevatedButton(
              child: Text('Выбрать дату'),
              onPressed: () {
                showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(1900),
                  lastDate: DateTime.now(),
                ).then((selectedDate) {
                  if (selectedDate != null) {
                    setState(() {
                      _selectedDate = selectedDate;
                    });
                  }
                });
              },
            ),
            if (_selectedDate != null) Text('Выбранная дата: $_selectedDate'),
            ElevatedButton(
              child: Text('Рассчитать возраст'),
              onPressed: () {
                String dob = _dobController.text;
                if (_selectedDate != null) {
                  Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => form_3(name: widget.name, dob: _selectedDate!),
                  ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Пожалуйста, выберите дату рождения'),
                    ),
                  );
                }
                
              },
            ),
          ],
        ),
      ),
    );
  }
}