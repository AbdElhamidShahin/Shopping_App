import 'package:flutter/material.dart';
import 'package:quran/screeens/screen%20catogry/electronicsScreen.dart';
import '../Serveis/categoris_servies.dart';
import '../Serveis/Product_modile.dart';
import '../models/ImageUpper.dart';
import '../screeens/screen catogry/jewelery.dart';
import '../screeens/screen catogry/mens clothing.dart';
import '../screeens/screen catogry/women clothing.dart';
import 'CostomCard.dart';

class ImageUpperItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ElectronicsScreen()),
              );
            },
            child: ImageUpper(
              image: 'assets/images/electronic.jpg',
              text: 'Electronics',
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => jewelery()),
              );
            },
            child: ImageUpper(
              image: 'assets/images/jewelery,.jpg',
              text: 'Jewelry',
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MensClothing()),
              );
            },
            child: ImageUpper(
              image: 'assets/images/mens clothing.jpg',
              text: 'MensClothing',
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => WomensClothing()),
              );
            },
            child: ImageUpper(
              image: 'assets/images/women.jpg',
              text: 'WomensClothing',
            ),
          )
          // Add more ImageUpper widgets with corresponding onTap callbacks for other pages
        ],
      ),
    );
  }
}

class Catogaris extends StatefulWidget {
  final String category; // قم بتعيين متغير لتخزين قيمة الفئة

  const Catogaris({Key? key, required this.category}) : super(key: key);

  @override
  State<Catogaris> createState() => _CatogarisState();
}

class _CatogarisState extends State<Catogaris> {
  late String _category; // قم بتعريف متغير داخلي لتخزين قيمة الفئة

  @override
  void initState() {
    super.initState();
    // قم بتعيين قيمة الفئة المستقبلة من معامل الكلاس إلى المتغير الداخلي
    _category = widget.category;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 100),
        child: FutureBuilder<List<ProductModile>>(
          future: CategorisService().getCatogryProducts(
              CatogryName:
                  _category), // استخدم قيمة الفئة المخزنة في المتغير الداخلي
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<ProductModile> products = snapshot.data!;
              return GridView.builder(
                itemCount: products.length,
                clipBehavior: Clip.none,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 50,
                ),
                itemBuilder: (context, index) {
                  return CustomCard(
                    product: products[index],
                  );
                },
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
