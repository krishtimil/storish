import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:storish/ds/transaction.dart';
import 'package:storish/screens/home_screen/rec.dart';
import 'package:storish/utils/constant.dart';

List<Transaction> transactions = [];
String json = '';

class Home extends StatefulWidget {
  Home({super.key});
  static String routeName = "/home";

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Oops'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('You are spending too much!'),
                Text('Are you sure you want to continue?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Approve'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> getData() async {
    final response = await http
        .get(Uri.parse('http://10.0.2.2:8000/api'), headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    });
    json = response.body;
    final parsed = jsonDecode(response.body).cast<Map<String, dynamic>>();
    transactions =
        parsed.map<Transaction>((json) => Transaction.fromJson(json)).toList();
    // print(transactions);
  }

  void onPressed({
    required String product,
    required int price,
    required String category,
    int quantity = 0,
  }) async {
    Transaction task = Transaction(
      user: 1,
      product: product,
      price: price,
      category: category,
      quantity: quantity,
      basic: true,
    );

    if (product == "chocolate") {
      _showMyDialog();
      return;
    } else {
      final response = await http.post(
        Uri.parse("http://10.0.2.2:8000/api/"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(task),
      );
      // print(transactions);
      if (response.statusCode == 201) {
        task.id = jsonDecode(response.body)['id'];
        transactions.add(task);
      }
    }
    setState(() {});
  }

  bool notify(String user_id, String recieved_json, String cur_price) {
    //String recieved_json=[];

    List<dynamic> list = jsonDecode(recieved_json);
    var refdate = DateTime.parse("0000-00-00");
    double totalbudjet = 0,
        s = 0,
        purchasedprice = 0,
        totalremprice,
        totalbasicbudjet =
            0; //s for expense,totalremprice is minimumrequirement

    int k = list.length - 1, t = 0;
    while (k != 0) {
      if (list[k]['id'].compareTo(user_id) != 0) {
        k--;
        continue;
      }
      if (t < 1) {
        var refdate = DateTime.parse(list[k]['timestamp']);
        t++;
      }

      if (DateTime.parse(list[k]['timestamp']).compareTo(
              DateTime(refdate.year, refdate.month - 1, refdate.day)) <
          0) {
        break;
      }
      if (list[k]['basic'].compareTo("true") == 0) {
        totalbasicbudjet += double.parse(list[k]['price']);
      }
      totalbudjet += double.parse(list[k]['price']);
      k--;
    }
    totalremprice = totalbasicbudjet * 0.2333233;
    if (DateTime.parse(list[0]['timestamp']).compareTo(
            DateTime(refdate.year, refdate.month, refdate.day - 30)) <
        0) {
      while (k != 0) {
        if (list[k]['id'].compareTo(user_id) != 0) {
          k--;
          continue;
        }
        if (t < 1) {
          var refdate = DateTime.parse(list[k]['timestamp']);
          t++;
        }

        if (DateTime.parse(list[k]['timestamp']).compareTo(
                DateTime(refdate.year, refdate.month, refdate.day - 7)) <
            0) {
          break;
        }
        if (list[k]['basic'].compareTo("true") == 0) {
          totalremprice -= double.parse(list[k]['price']);
        }
        s += double.parse(list[k]['price']);
        k--;
      }
      if (totalremprice > totalbudjet * 0.233333 - s - int.parse(cur_price)) {
        return true;
      }
    }
    return false;
  }

  Widget singalProducts(
      String text, String image, String money, String category) {
    return Container(
      margin: const EdgeInsets.all(10),
      height: 300,
      width: 200,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 202, 199, 183),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Expanded(
          flex: 2,
          child: Image.asset(
            image,
          ),
        ),
        Expanded(
          child: Column(
            children: [
              Text(
                text,
                style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
              Text(
                money,
                style: const TextStyle(color: Color.fromARGB(255, 51, 16, 16)),
              ),
              ElevatedButton(
                onPressed: () {
                  onPressed(
                    product: text,
                    price: int.parse(money),
                    category: category,
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: kSecondaryColor,
                ),
                child: Row(
                  children: const [
                    Text(
                      'Buy Now',
                      textAlign: TextAlign.end,
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    Icon(
                      Icons.shopping_cart,
                      color: Colors.black,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    getData();
    return Scaffold(
      backgroundColor: const Color(0xFFEAE0DA),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          'Home',
          style: TextStyle(color: Colors.black, fontSize: 17),
        ),
        actions: const [
          CircleAvatar(
            radius: 12,
            backgroundColor: Color.fromARGB(255, 163, 208, 218),
            child: Icon(Icons.search, size: 17, color: Colors.black),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: CircleAvatar(
              radius: 12,
              backgroundColor: Color.fromARGB(255, 163, 208, 218),
              child: Icon(Icons.shop, size: 17, color: Colors.black),
            ),
          )
        ],
        backgroundColor: kPrimaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Container(
                height: 250,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(10),
                  image: const DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                          'https://hips.hearstapps.com/hmg-prod/images/healthy-groceries-1525213305.jpg?crop=1.00xw:0.728xh;0,0.173xh&resize=640:*')),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      'Grocery Items',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      'View all',
                      style: TextStyle(
                        color: Color.fromARGB(255, 73, 68, 68),
                      ),
                    ),
                  ],
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    singalProducts(
                        'yoghurt', 'assets/images/yogurt.jpeg', '80', 'dairy'),
                    singalProducts('chocolate', 'assets/images/chocolate.png',
                        '80', 'added_sugars'),
                    singalProducts(
                        'vegetable oil', 'assets/images/oil.png', '260', 'oil'),
                    singalProducts(
                        'tea', 'assets/images/tea.png', '180', 'drinks'),
                  ],
                ),
              ),
              const Text(
                'Past Transactions',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const PastTransactions(),
              Rec(
                product: "whole milk",
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PastTransactions extends StatefulWidget {
  const PastTransactions({
    super.key,
  });

  @override
  State<PastTransactions> createState() => _PastTransactionsState();
}

class _PastTransactionsState extends State<PastTransactions> {
  @override
  Widget build(BuildContext context) {
    if (transactions.length == 0) {
      return const Text('No transactions yet');
    }
    List<TableRow> all = transactions.map((e) {
      return TableRow(
        children: [
          Text(e.product),
          Text(e.price.toString()),
          Text(e.category),
        ],
      );
    }).toList();
    print(all[0]);
    return Table(
      border: TableBorder.all(color: Colors.black, width: 2.5),
      children: all,
    );
  }
}
