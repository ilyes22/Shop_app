import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/provider/products.dart';

class ProudectDetails extends StatefulWidget {
  static const routName = '//';

  @override
  State<ProudectDetails> createState() => _ProudectDetailsState();
}

class _ProudectDetailsState extends State<ProudectDetails> {
//   final String title;

  void isfavorable(bool click) {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context)?.settings.arguments as String;
    final prds =
        Provider.of<Products>(context, listen: false).findById(productId);

    return Scaffold(
        appBar: AppBar(
          title: Text(prds.title),
        ),
        body: ListView(children: [
          ClipRRect(
            // borderRadius: BorderRadius.circular(15),
            child: Container(
              // decoration: BoxDecoration(
              //     border: Border.all(color: Colors.green, width: 5)),
              // margin: const EdgeInsets.all(10),
              height: 500,
              width: double.infinity,
              child: Stack(
                children: [
                  Container(
                    height: 500,
                    width: double.infinity,
                    child: Image.network(
                      prds.imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    right: 10,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(10)),
                      //  color: Colors.amber,
                      height: 35,
                      width: 200,
                      alignment: Alignment.center,
                      child: Text(
                        prds.title,
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 10,
                    child: IconButton(
                      iconSize: 40,
                      icon: Icon(
                        prds.isFavorite
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color: Colors.red,
                      ),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
          ),
        ]));
  }
}
