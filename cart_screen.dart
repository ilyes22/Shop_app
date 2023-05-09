import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/provider/order.dart';
import '../provider/cart.dart';
import '../widget/cart_items.dart' as ci;
import '../widget/drawes.dart';

class CartScreen extends StatelessWidget {
  static const routName = '/cart';
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Shop'),
      ),
      drawer: MyDrawers(),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(10),
            // padding: EdgeInsets.all(10),
            child: Card(
              elevation: 2,
              // margin: EdgeInsets.all(10),
              child: Container(
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Padding(padding: EdgeInsets.all(20)),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: const Text(
                        'Total Amount',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),

                    Column(
                      children: [
                        Chip(
                          backgroundColor: Colors.white,
                          label: Text(
                            '\$${cart.totleAmount} px',
                            style: const TextStyle(
                                fontSize: 17, color: Colors.green),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            if (cart.totleAmount == 0) {
                              return;
                            }
                            Provider.of<Orders>(context, listen: false)
                                .addOrder(cart.items.values.toList(),
                                    cart.totleAmount);
                            cart.cardClear();
                          },
                          style:
                              ElevatedButton.styleFrom(onPrimary: Colors.white),
                          child: const Text("Order Now"),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
              child: ListView.builder(
            itemBuilder: (ctx, index) => ci.CartItems(
              cart.items.values.toList()[index].id,
              cart.items.values.toList()[index].price,
              cart.items.values.toList()[index].quantity,
              cart.items.values.toList()[index].title,
              cart.items.keys.toList()[index],
            ),
            itemCount: cart.items.length,
          ))
        ],
      ),
    );
  }
}
