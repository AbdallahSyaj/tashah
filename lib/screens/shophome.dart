import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tasheh/screens/purchasefailed.dart';
import 'package:tasheh/screens/purchasesuccess.dart';

const startallignment = Alignment.topLeft;
const endallignment = Alignment.bottomRight;

class Shop_Home extends StatefulWidget {
  const Shop_Home({super.key});

  @override
  State<Shop_Home> createState() => _Shop_HomeState();
}

class _Shop_HomeState extends State<Shop_Home> {
  int currentbalance = 2000;
  int coupon1 = 500;
  int coupon2 = 700;
  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          /* Image.asset(
            'assets/images/coupon.jpg',
            width: 300,
          ),*/
          const SizedBox(height: 10),
          Text(
            'Copoun 1',
            style: GoogleFonts.lato(
              color: const Color.fromARGB(255, 226, 205, 255),
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          OutlinedButton.icon(
            onPressed: () {
              if (currentbalance - coupon1 >= 0) {
                currentbalance -= coupon1;
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => PurchaseSuccess()));
              } else if (currentbalance - coupon1 < 0) {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => PurchaseFailed()));
              }
            },
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
            ),
            icon: const Icon(Icons.add_card),
            label: Text(
              'Get Coupon',
              style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 226, 205, 255),
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 50),
          /*Image.asset(
            'assets/images/coupon.jpg',
            width: 300,
          ),*/
          const SizedBox(height: 10),
          Text(
            'Copoun 2',
            style: GoogleFonts.lato(
              color: const Color.fromARGB(255, 226, 205, 255),
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          OutlinedButton.icon(
            onPressed: () {
              if (currentbalance - coupon1 >= 0) {
                currentbalance -= coupon1;
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => PurchaseSuccess()));
              } else if (currentbalance - coupon1 < 0) {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => PurchaseFailed()));
              }
            },
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
            ),
            icon: const Icon(Icons.add_card),
            label: Text(
              'Get Coupon',
              style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 226, 205, 255),
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
