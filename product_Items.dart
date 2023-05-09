// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/provider/cart.dart';
import 'package:shop_app/provider/product.dart';
import '../screen/product_details.dart';

class ProductItems extends StatefulWidget {
  @override
  State<ProductItems> createState() => _ProductItemsState();
}

class _ProductItemsState extends State<ProductItems> {
  @override
  Widget build(BuildContext context) {
    final prd = Provider.of<Product>(context);
    final cart = Provider.of<Cart>(context, listen: false);
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: GestureDetector(
          onTap: () => Navigator.of(context).pushNamed(
            ProudectDetails.routName,
            arguments: prd.id,
          ),
          child: Image.network(
            prd.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
        footer: GridTileBar(
            backgroundColor: Colors.black54,
            title: Text(prd.title),
            leading: IconButton(
                icon: Icon(
                  prd.isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: Colors.red,
                ),
                onPressed: () => prd.toggleFavorite()),
            trailing: IconButton(
              onPressed: () {
                cart.addItems(prd.id, prd.title, prd.price);
              },
              icon: const Icon(Icons.shopping_cart, color: Colors.red),
            )),
      ),
    );
  }
}
