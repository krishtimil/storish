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
  // String rec = 'Loading...';
  late Future<String> rec;

  Future<String> getRec(String product) async {
    final response = await http.post(
      Uri.parse('http://10.0.2.2:8000/recommend/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({"product": product}),
    );
    print(response.body);
    // setState(() {
    //   rec = jsonDecode(response.body);
    // });
    return jsonDecode(response.body).join(",");
  }

  @override
  void initState() {
    super.initState();
    rec = getRec(widget.product);
  }

  @override
  Widget build(BuildContext context) {
    getRec(widget.product);
    return Column(
      children: [
        Text(
          'We Recommend You',
          style: TextStyle(
              color: kPrimaryColor, fontSize: 28, fontWeight: FontWeight.bold),
        ),
        FutureBuilder(
          future: rec,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Text(snapshot.data!);
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }

            // By default, show a loading spinner.
            return const CircularProgressIndicator();
          },
        ),
      ],
    );
  }
}
