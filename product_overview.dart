// ignore_for_file: sort_child_properties_last
import '../widget/badge.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widget/product_grid.dart';
import '../provider/cart.dart';
import '../screen/cart_screen.dart';
import '../widget/drawes.dart';

class ProductHome extends StatefulWidget {
  static const routName = 'home';
  @override
  State<ProductHome> createState() => _ProductHomeState();
}

enum Filters { favortieSlection, allSlection }

class _ProductHomeState extends State<ProductHome> {
  var showFavorite = false;

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Shop_App'),
          actions: [
            PopupMenuButton(
              onSelected: (slectedValue) {
                setState(() {
                  if (slectedValue == Filters.favortieSlection) {
                    showFavorite = true;
                  } else if (slectedValue == Filters.allSlection) {
                    showFavorite = false;
                  }
                });
              },
              itemBuilder: (_) => [
                const PopupMenuItem(
                  child: Text('Show favorite'),
                  value: Filters.favortieSlection,
                ),
                const PopupMenuItem(
                  child: Text('Show All'),
                  value: Filters.allSlection,
                ),
              ],
            ),
            Consumer<Cart>(
              builder: (_, cart, Widget? ch) => Badges(
                child: ch!,
                value: cart.itemsCount.toString(),
                color: Colors.deepOrange,
              ),
              child: IconButton(
                  icon: const Icon(Icons.shopping_cart),
                  onPressed: () {
                    Navigator.of(context).pushNamed(CartScreen.routName);
                  }),
            ),
          ],
        ),
        drawer: MyDrawers(),
        body: ProductGrid(showFavorite));
  }
}
