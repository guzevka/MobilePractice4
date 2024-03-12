import 'package:flutter/material.dart';
import 'form_2.dart';

class form_1 extends StatelessWidget {

  TextEditingController _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Форма 1'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextFormField(
              controller: _nameController,  // Attach the controller to the TextFormField
              decoration: InputDecoration(
                hintText: 'Представьтесь',
                suffixIcon: IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: () => _nameController.clear(),  // Clear the input
                ),
              ),
            ),
            ElevatedButton(
              child: Text('Войти'),
              onPressed: () {
                String name = _nameController.text;  
                if (name.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Пожалуйста, введите ваше имя'),
                    ),
                  );
                } else {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => form_2(name: name),
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
