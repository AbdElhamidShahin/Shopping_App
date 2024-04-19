import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quran/models/cart.dart';

class CartShopping extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(builder: (context, cart, child) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Total Price                     "
              ' ${cart.totalPrice.toStringAsFixed(2)}'),
        ),
        body: cart.basketItems.isEmpty
            ? Center(
                child: Text('No items in the cart'),
              )
            : ListView.builder(
                itemCount: cart.basketItems.length,
                itemBuilder: (context, index) {
                  final product = cart.basketItems[index];
                  return Card(
                    child: ListTile(
                      title: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  product.title,
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'Price: \$${product.price.toString()}',
                                ),
                                IconButton(
                                    onPressed: () {
                                      cart.remove(cart.basketItems[index]);
                                    },
                                    icon: Icon(Icons.delete))
                              ],
                            ),
                          ),
                          Image.network(
                            product.image,
                            height: 100,
                            width: 100,
                          ),
                          SizedBox(
                            height: 50,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
      );
    });
  }
}
