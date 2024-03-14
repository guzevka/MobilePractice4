import 'package:flutter/material.dart';
import 'form_2.dart';
import 'package:flutter/services.dart';  // Import the services library for TextInputFormatter

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
            Text(
              'Представьтесь',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
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
                controller: _nameController,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'[а-яА-Я]+')),  // русский
                ],
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Елена',
                  labelText: 'Ваше имя',
                  suffixIcon: IconButton(
                    icon: Icon(Icons.clear),
                    onPressed: () => _nameController.clear(),
                  ),
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