import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../utils/constant.dart';

class Rec extends StatefulWidget {
  var product;

  Rec({super.key, required this.product});

  @override
  State<Rec> createState() => _RecState();
}

class _RecState extends State<Rec> {
  String rec = 'Loading...';

  Future<void> getRec(String product) async {
    final response = await http.post(
      Uri.parse('http://10.0.2.2:8000/api'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: product,
    );
    print(response.body);
    setState(() {
      rec = jsonDecode(response.body);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'We Recommend You',
          style: TextStyle(
              color: kPrimaryColor, fontSize: 28, fontWeight: FontWeight.bold),
        ),
        Text(rec),
      ],
    );
  }
}
