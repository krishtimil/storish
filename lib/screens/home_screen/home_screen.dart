import 'package:flutter/material.dart';
import 'package:storish/utils/constant.dart';
import 'package:storish/utils/size_config.dart';

class Home extends StatelessWidget {
  const Home({super.key});
  static String routeName = "/home";

  Widget singalProducts(String text, String image) {
    return Container(
      margin: EdgeInsets.all(10),
      height: 300,
      width: 200,
      decoration: BoxDecoration(
        color: Color.fromARGB(31, 207, 15, 15),
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
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
              Text(
                'Rs.120',
                style: TextStyle(color: Colors.grey),
              ),
              ElevatedButton(
                onPressed: () {},
                child: Row(
                  children: [
                    Text('Buy Now'),
                    Icon(Icons.shopping_cart),
                  ],
                ),
                style: ElevatedButton.styleFrom(
                  primary: kPrimaryColor,
                ),
              )
            ],
          ),
        )
      ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSecondaryColor,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          'Home',
          style: TextStyle(color: Colors.black, fontSize: 17),
        ),
        actions: [
          CircleAvatar(
            radius: 12,
            backgroundColor: Color.fromARGB(255, 163, 208, 218),
            child: Icon(Icons.search, size: 17, color: Colors.black),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: CircleAvatar(
              child: Icon(Icons.shop, size: 17, color: Colors.black),
              radius: 12,
              backgroundColor: Color.fromARGB(255, 163, 208, 218),
            ),
          )
        ],
        backgroundColor: kPrimaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        child: Column(
          children: [
            Container(
              height: 250,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        'https://hips.hearstapps.com/hmg-prod/images/healthy-groceries-1525213305.jpg?crop=1.00xw:0.728xh;0,0.173xh&resize=640:*')),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
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
                  singalProducts('chocolate', 'assets/images/chocolate.jpg'),
                  singalProducts('vegetable oil', 'assets/images/oil.png'),
                  singalProducts('tea', 'assets/images/tea.jpg'),
                ],
              ),
            ),
            Text(
              'Past Transactions',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Table(
              border: TableBorder.all(color: Colors.black, width: 2.5),
              children: const [
                TableRow(children: [
                  Text(
                    "purchased goods",
                    style: TextStyle(fontSize: 15.0),
                  ),
                  Text(
                    "price(Rs)",
                    style: TextStyle(fontSize: 15.0),
                  ),
                  Text(
                    "Category",
                    style: TextStyle(fontSize: 15.0),
                  ),
                ]),
                TableRow(children: [
                  Text(
                    "Tea",
                    style: TextStyle(fontSize: 15.0),
                  ),
                  Text(
                    "Rs.150",
                    style: TextStyle(fontSize: 15.0),
                  ),
                  Text(
                    "Basic",
                    style: TextStyle(fontSize: 15.0),
                  ),
                ]),
                TableRow(
                  children: [
                    Text(
                      "Vegetable oil",
                      style: TextStyle(fontSize: 15.0),
                    ),
                    Text(
                      "Rs.270",
                      style: TextStyle(fontSize: 15.0),
                    ),
                    Text(
                      "Basic",
                      style: TextStyle(fontSize: 15.0),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
