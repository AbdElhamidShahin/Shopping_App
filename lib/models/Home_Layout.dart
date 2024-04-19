import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quran/widgets/SearchApp.dart';
import 'package:quran/widgets/CostomCard.dart';
import '../Serveis/All_ProductServis.dart';
import '../widgets/catogry.dart';
import '../Serveis/Product_modile.dart';

class HomeLayout extends StatelessWidget {
  HomeLayout({Key? key, required this.products}) : super(key: key);
  final List<ProductModile> products;
  final List<String> imgList = [
    'assets/images/download.jpg',
    'assets/images/images.jpg',
    'assets/images/download (1).jpg',
    'assets/images/download (2).jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.keyboard_arrow_left,
            color: Colors.black,
          ),
          onPressed: () {
            // Implement navigation logic if needed
          },
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'New Trend',
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
            onPressed: () {
              // Pass the list of products to the SearchBarDelegate
              showSearch(
                context: context,
                delegate: SearchBarDelegate(products: products),
              );
            },
            icon: Icon(Icons.search_rounded),
          ),
        ],
      ),
      body: Column(
        children: [
          ImageUpperItem(),SizedBox(height: 5,),
     Expanded(
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: CarouselSlider(
                    items: imgList
                        .map((item) => Center(
                          child: Image.asset(
                            item,
                            fit: BoxFit.cover,
                            width: double.infinity,
                            height: 180,
                          ),
                        ))
                        .toList(),
                    options: CarouselOptions(
                      autoPlay: true,
                      aspectRatio: 2.0,
                      enlargeCenterPage: true,
                      enableInfiniteScroll: true,
                      scrollDirection: Axis.horizontal,
                      onPageChanged: (index, reason) {
                        // Callback function when the page changes
                      },
                    ),
                  ),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                        (context, index) {
                      return SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        // Add other fixed items here if needed
                      );
                    },
                    childCount: 1,
                  ),
                ),
                FutureBuilder<List<ProductModile>>(
                  future: ALLBroductService().getAllProducts(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return SliverToBoxAdapter(
                        child: Center(child: CircularProgressIndicator()),
                      );
                    }
                    if (snapshot.hasError) {
                      return SliverToBoxAdapter(
                        child: Center(child: Text('Error: ${snapshot.error}')),
                      );
                    }
                    List<ProductModile>? products = snapshot.data;
                    if (products != null) {
                      return SliverGrid(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 1,
                          crossAxisSpacing: 15,
                          mainAxisSpacing: 50,
                        ),
                        delegate: SliverChildBuilderDelegate(
                              (context, index) {
                            return CustomCard(
                              product: products[index],
                            );
                          },
                          childCount: products.length,
                        ),
                      );
                    } else {
                      return SliverToBoxAdapter(
                        child: Center(child: Text('No data available')),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
