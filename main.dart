import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/screen/cart_screen.dart';
import './provider/products.dart';
import './screen/product_overview.dart';
import './screen/product_details.dart';
import './provider/cart.dart';
import './provider/order.dart';
import './widget/drawes.dart';
import './screen/order_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => Products(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Cart(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Orders(),
        )
      ],
      child: MaterialApp(
        title: 'Shop_App',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.green)
              .copyWith(secondary: Colors.orange),
          textTheme: const TextTheme(
            bodyLarge: TextStyle(fontFamily: 'Lato', fontSize: 30),
            bodyMedium: TextStyle(fontFamily: 'Anton', fontSize: 20),
          ),
        ),
        home: Scaffold(
          drawer: MyDrawers(),
          body: ProductHome(),
        ),
        routes: {
          ProudectDetails.routName: (context) => ProudectDetails(),
          CartScreen.routName: (context) => CartScreen(),
          OrderScreen.routName: (ctx) => OrderScreen(),
          ProductHome.routName: (ctx) => ProductHome(),
        },
      ),
    );
  }
}
