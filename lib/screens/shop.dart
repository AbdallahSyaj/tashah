import 'package:flutter/material.dart';
import 'package:tasheh/screens/purchasefailed.dart';
import 'package:tasheh/screens/purchasesuccess.dart';
import 'package:tasheh/screens/shophome.dart';

class Shop extends StatefulWidget {
  const Shop({super.key});

  @override
  State<Shop> createState() {
    return _ShopState();
  }
}

class _ShopState extends State<Shop> {
  int activescreen = 1;

  // variables for purchase proccesss , should be replaced with instances from data base

  int currentbalance = 2000;
  int coupon1 = 500;
  int coupon2 = 700;

  void switchScreen() {
    setState(() {
      if (currentbalance - coupon1 >= 0) {
        currentbalance -= coupon1;
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => PurchaseSuccess()));
      } else if (currentbalance - coupon1 < 0) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => PurchaseFailed()));
      }
    });
  }

  @override
  Widget build(context) {
    Widget screenwidget = Shop_Home();

    if (activescreen == 2) {
      screenwidget = const PurchaseSuccess();
    }
    if (activescreen == 3) {
      screenwidget = const PurchaseFailed();
    }

    // Conditions for purchasing copouns

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 141, 23, 14),
                Color.fromARGB(255, 223, 161, 153)
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: screenwidget,
        ),
      ),
    );
  }
}
