import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quran/models/cart.dart';

class Favorite extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<Like>(builder: (context, cart, child) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Favorite Item',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
        ),

        body: cart.basketItems.isEmpty
            ? Center(
          child: Text('No items '),
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
