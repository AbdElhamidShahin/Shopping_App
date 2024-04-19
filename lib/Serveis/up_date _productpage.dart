import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:quran/Serveis/upDate_prouduct.dart';
import 'package:quran/Serveis/Product_modile.dart';

import '../widgets/Bottom_custom.dart';
import '../widgets/widget.dart';

class UpdateProductPage extends StatefulWidget {
  const UpdateProductPage({Key? key}) : super(key: key);

  static String id = 'update product';

  @override
  State<UpdateProductPage> createState() => _UpdateProductPageState();
}

class _UpdateProductPageState extends State<UpdateProductPage> {
  late ProductModile product;
  String? productName, description, image;
  String? price;
  bool isLoding = false;

  @override
  Widget build(BuildContext context) {
    product = ModalRoute.of(context)!.settings.arguments as ProductModile;

    return ModalProgressHUD(
      inAsyncCall: isLoding,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Update Product'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 100,
              ),
              TextFormFeld(
                onChanged: (data) {
                  productName = data;
                },
                inputType: null,
                hintext: 'Product Name',
              ),
              SizedBox(
                height: 5,
              ),
              TextFormFeld(
                onChanged: (data) {
                  description = data;
                },
                inputType: null,
                hintext: 'Description',
              ),
              SizedBox(
                height: 5,
              ),
              TextFormFeld(
                onChanged: (data) {
                  price = data;
                },
                inputType: TextInputType.number,
                hintext: 'Price',
              ),
              SizedBox(
                height: 5,
              ),
              TextFormFeld(
                onChanged: (data) {
                  image = data;
                },
                inputType: null,
                hintext: 'Image',
              ),
              SizedBox(
                height: 40,
              ),
              CustomButton(
                onTap: () async {
                  isLoding = true;
                  setState(() {
                    // Set loading state to true
                  });

                  try {
                    await updateProduct(product);
                    print('success');
                    // Handle success here if needed
                  } catch (e) {
                    print(e.toString());
                    // Handle error here
                  }
                  isLoding = false;
                  setState(() {
                    // Set loading state to false
                  });
                },
                text: "Update",
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> updateProduct(ProductModile product) async {
    await UpdateProductServis().updateProduct(
      id: product.id,
      title: productName == null ? product.title : productName!,
      price: price == null ? product.price.toString() : price!,
      description: description == null ? product.description : description!,
      image: image == null ? product.image : image!,
      category: product.category,
    );
  }
}
