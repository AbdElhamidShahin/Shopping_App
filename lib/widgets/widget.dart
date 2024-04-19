import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quran/models/home_page.dart';

class TextFormFeld extends StatelessWidget {
  TextFormFeld(
      {required this.hintext,
      required this.inputType,
      required this.onChanged,
      Key? key})
      : super(key: key);

  static String id = 'update product';
  final String hintext;
  final Function(String) onChanged;
  TextInputType? inputType;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15, left: 10, right: 10),
      child: TextField(
        keyboardType: inputType,
        onChanged: onChanged,
        decoration: InputDecoration(
          hintText: hintext,
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}


class Settings_Text extends StatelessWidget {
  Settings_Text(
      {Key? key,
      required this.text,
      required this.icon1,
      required this.icon2,
      required this.onPressed})
      : super(key: key);

  final String text;
  final IconData icon1;
  final IconData icon2;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            SizedBox(
              width: 15,
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Icon(icon1),
            ),
            Text(
              text,
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            Spacer(),
            IconButton(onPressed: onPressed, icon: Icon(icon2)),
            SizedBox(
              width: 15,
            ),
          ],
        ),
        Divider(
            height: 0.1,
            color: Colors.grey,
            thickness: 1,
            indent: 30,
            endIndent: 30)
      ],
    );
  }
}


class IconArrowBack extends StatelessWidget {
  const IconArrowBack({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: (){

      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (_) => HomePage(products: [],)));
    },
      icon: Icon(
        Icons.arrow_back,
        size: 25,
      ),
    );
  }
}
