import 'package:flutter/material.dart';

import 'package:shop_app/screen/product_overview.dart';
import '../screen/product_overview.dart';

class MyDrawers extends StatelessWidget {
  const MyDrawers({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: Column(
        children: [
          AppBar(
            title: Text('Menue'),
            backgroundColor: Colors.green,
          ),
          Container(
            margin: EdgeInsets.all(5),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushReplacementNamed(
                          'home',
                        );
                      },
                      child: ListTile(
                        title: Text(
                          'Home',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        leading: Icon(Icons.home, color: Colors.black),
                      )),
                ),
                Divider(),
                Container(
                  padding: EdgeInsets.all(10),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushReplacementNamed('order');
                    },
                    child: ListTile(
                        title: Text(
                          'Orders',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        leading: Icon(Icons.shop, color: Colors.black)),
                  ),
                ),
                Divider()
              ],
            ),
          ),
        ],
      ),
    );
  }
}
