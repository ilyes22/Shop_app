import 'package:flutter/material.dart';
import 'package:shop_app/provider/product.dart';
import '../provider/cart.dart';
import 'package:provider/provider.dart';

class CartItems extends StatelessWidget {
  final String title;
  final String productId;
  final String id;
  final double price;
  final int quantity;

  CartItems(this.id, this.price, this.quantity, this.title, this.productId);
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Dismissible(
      key: ValueKey(productId),
      direction: DismissDirection.endToStart,
      onDismissed: (ctx) => cart.itemsRemove(productId),
      background: Card(
        color: Colors.red,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.all(15),
              child: Icon(
                Icons.delete,
                size: 35,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(5),
          child: ListTile(
            leading: CircleAvatar(
              radius: 35,
              backgroundColor: Colors.green,
              child: FittedBox(
                  fit: BoxFit.fill,
                  child: Padding(
                    padding: EdgeInsets.all(12),
                    child: Text('\$$price',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.white)),
                  )),
            ),
            title: Text(
              title,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            subtitle: Text(
              'Total: ${price * quantity}\$',
              style: TextStyle(fontSize: 15, color: Colors.blueGrey),
            ),
            trailing: Chip(
              backgroundColor: Colors.green,
              label: Text(
                '$quantity x',
                style: TextStyle(fontSize: 14, color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
