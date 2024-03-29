
import 'package:flutter/material.dart';
import 'form_1.dart';

class form_3 extends StatelessWidget {
  final String name;
  final DateTime dob;

  form_3({required this.name, required this.dob});

  @override
  Widget build(BuildContext context) {
    int age = DateTime.now().year - dob.year;

    return Scaffold(
      appBar: AppBar(
        title: Text('Третья страница'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '$name, вам $age лет',
              style: TextStyle(
                fontSize: 24,  
                fontWeight: FontWeight.bold,  
              ),
            ),
            ElevatedButton(
              child: Text('Вернуться на главную'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => form_1(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}