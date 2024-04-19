import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quran/Serveis/Product_modile.dart';


import '../Serveis/up_date _productpage.dart';
import '../models/cart.dart';

class CustomCard extends StatefulWidget {
  final ProductModile product;

  CustomCard({
    required this.product,
    Key? key,
  }) : super(key: key);

  @override
  _CustomCardState createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  bool _isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, UpdateProductPage.id,
                arguments: widget.product);
          },
          child: Column(
            children: [
              SizedBox(
                height: 60,
              ),
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    height: 120,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 10,
                          spreadRadius: 2,
                          color: Colors.grey.withOpacity(0.5),
                          offset: Offset(1, 1),
                        ),
                      ],
                    ),
                    child: Card(
                      elevation: 0,
                      color: Colors.transparent,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10, bottom: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.product.title.substring(0, 10),
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey[600],
                              ),
                            ),
                            SizedBox(height: 3),
                            Row(
                              children: [
                                Text(
                                  '\$${widget.product.price.toString()}',
                                  style: TextStyle(fontSize: 17),
                                ),
                                IconButton(
                                  onPressed: () {
                                    Provider.of<Cart>(context, listen: false)
                                        .add(widget.product);
                                  },
                                  icon: Icon(
                                    Icons.shopping_cart,
                                    size: 25,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      widget.product.isFavorite =
                                          !widget.product.isFavorite;
                                    });
                                    if (widget.product.isFavorite) {
                                      // إذا كان المنتج مفضلًا، أضفه إلى المفضلة
                                      Provider.of<Like>(context, listen: false)
                                          .add(widget.product);
                                    } else {
                                      // إلا، قم بإزالته من المفضلة
                                      Provider.of<Like>(context, listen: false)
                                          .remove(widget.product);
                                    }
                                  },
                                  icon: Icon(
                                    widget.product.isFavorite
                                        ? Icons.favorite
                                        : Icons.favorite_border,
                                    size: 25,
                                    color: widget.product.isFavorite
                                        ? Colors.red
                                        : null,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 25,
                    top: -45,
                    child: Image.network(
                      widget.product.image,
                      height: 100,
                      width: 100,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
