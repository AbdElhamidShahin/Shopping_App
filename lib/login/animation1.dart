import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'animation2.dart';


class HomeLite extends StatelessWidget {
  const HomeLite({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 170,
              ),
              Lottie.asset(
                'assets/Animation - 1712318856646.json', // قم بتحديد المسار الصحيح إلى ملف الرسوم المتحركة
                width: 300,
                height: 400,
                repeat: true, // يمكنك تعيين تكرار الرسوم المتحركة هنا
                reverse: false, // يمكنك تعيين اتجاه الرسوم المتحركة هنا
                animate: true,
              ),
              SizedBox(
                height: 50,
              ),
              InkWell(
                customBorder: CircleBorder(),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => screen_animation()),
                  ); // إضافة أكواد الفعل هنا
                },
                child: Container(
                  padding: EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.black,
                  ),
                  child: Icon(
                    Icons.arrow_back,
                    size: 35.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
