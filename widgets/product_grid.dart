import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/products.dart';
import '../widget/product_Items.dart';
import '../provider/product.dart';

class ProductGrid extends StatefulWidget {
  final bool showFv;
  ProductGrid(this.showFv);

  @override
  State<ProductGrid> createState() => _ProductGridState();
}

class _ProductGridState extends State<ProductGrid> {
  @override
  Widget build(BuildContext context) {
    final products = Provider.of<Products>(context);
    final prd = widget.showFv ? products.favorieItems : products.items;
    return GridView.builder(
        itemBuilder: (ctx, i) {
          return ChangeNotifierProvider.value(
              value: prd[i], child: ProductItems());
        },
        itemCount: prd.length,
        padding: const EdgeInsets.all(15),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          childAspectRatio: 1.2,
          crossAxisSpacing: 10,
        ));
  }
}
