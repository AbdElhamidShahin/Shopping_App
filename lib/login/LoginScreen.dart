



import 'package:flutter/material.dart';
import 'package:quran/models/home_page.dart';


class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SecondRoute(),   debugShowCheckedModeBanner: false,
    );
  }
}

class SecondRoute extends StatefulWidget {
  const SecondRoute({Key? key}) : super(key: key);

  @override
  State<SecondRoute> createState() => _SecondRouteState();
}

class _SecondRouteState extends State<SecondRoute> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  static const emailRegex = "@gmail.com";
// This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Center(
            child: Container(
                constraints: BoxConstraints.expand(),
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            Column(
                              children: [
                                Padding(padding: EdgeInsets.only(top: 70)),
                                Text(
                                  "Login",
                                  style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Icon(Icons.flutter_dash,size: 150,),
                                SizedBox(
                                  height: 30,
                                )
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  bottom: 15, left: 10, right: 10),
                              child: TextFormField(
                                decoration: InputDecoration(  prefixIcon: Icon(
                                  Icons.email,
                                  color: Colors.black,
                                ),
                                    hintText: "Email",
                                    border: OutlineInputBorder()),
                                validator: (value) {
                                  if (RegExp(emailRegex).hasMatch(value!)) {
                                  } else if (value == null || value.isEmpty) {
                                    return "@gmail.com";
                                  } else {
                                    return "@gmail.com";
                                  }
                                },
                              ),
                            ),SizedBox(height: 10,),
                            Padding(
                              padding: const EdgeInsets.only(
                                  bottom: 15, left: 10, right: 10),
                              child: TextFormField(
                                obscureText: true,
                                decoration: InputDecoration(  prefixIcon: Icon(
                                  Icons.lock,
                                  color: Colors.black,
                                ),
                                    hintText: "Password",
                                    border: OutlineInputBorder()),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Field cannot be empty";
                                  } else if (value.length < 5) {
                                    return "Must be at least 6 chars";
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(20),
                              child: Container(
                                padding: EdgeInsets.only(top: 3, left: 3),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(40),
                                    border: Border(
                                        bottom: BorderSide(color: Colors.black),
                                        top: BorderSide(color: Colors.black),
                                        right: BorderSide(color: Colors.black),
                                        left: BorderSide(color: Colors.black))),
                                child: MaterialButton(
                                  minWidth: double.infinity,
                                  height: 60,
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (_) => HomePage(products: [],)));
                                    } else {
                                      return null;
                                    }
                                  },
                                  color: Color.fromARGB(255, 0, 174, 255),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(40)),
                                  child: Text(
                                    "Login",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                TextButton(
                                  child: Text(
                                    "Forgot password?",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 15),
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        new MaterialPageRoute(
                                            builder: (context) => new HomePage(products: [],)));
                                  },
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Not a Member?"),
                                TextButton(
                                    child: Text(
                                      "Register now",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 15),
                                    ),
                                    onPressed: () {
                                      Navigator.pushNamed(context, '/third');
                                    }),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ))));
  }
}
