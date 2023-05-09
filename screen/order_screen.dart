import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/order.dart' show Orders;
import '../widget/order_items.dart';
import '../widget/drawes.dart';

class OrderScreen extends StatelessWidget {
  static const routName = 'order';

  @override
  Widget build(BuildContext context) {
    final _order = Provider.of<Orders>(context);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Your Orders'),
        ),
        drawer: MyDrawers(),
        body: _order.orders.isEmpty
            ? Center(
                child: Text(
                'No orders added yet.!',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
              ))
            : ListView.builder(
                itemBuilder: (ctx, i) => OrderItems(_order.orders[i]),
                itemCount: _order.orders.length,
              ));
  }
}
