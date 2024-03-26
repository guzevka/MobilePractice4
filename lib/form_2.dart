
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
        title: Text('Вторая страница'),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Добро пожаловать, ${widget.name}!'),
              
              if (_selectedDate != null) Text('Выбранная дата: $_selectedDate'),
              SizedBox(height: 10),
              Container(
                width: 200,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                  ),
                ),
                child: TextFormField(
                  controller: _dobController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: '01.01.2000',
                    labelText: 'Дата рождения',
                    suffixIcon: IconButton(
                      icon: Icon(Icons.calendar_today),
                      onPressed: () {
                        showDatePicker( // Выбор даты
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1900),
                          lastDate: DateTime.now(),
                        ).then((selectedDate) {
                          if (selectedDate != null) {
                            setState(() {
                              _selectedDate = selectedDate;
                              _dobController.text = _selectedDate.toString().split(' ')[0];
                            });
                          }
                        });
                      },
                    ),
                  ),
                ),
              ),
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
      ),
    );
  }
}