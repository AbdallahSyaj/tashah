import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const startallignment = Alignment.topLeft;
const endallignment = Alignment.bottomRight;

class Shop_Page extends StatelessWidget {
  const Shop_Page(this.startShop, {super.key});
  final void Function() startShop;

  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/copoun.jpg',
            width: 300,
          ),
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
            onPressed: startShop,
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
          Image.asset(
            'assets/images/copoun.jpg',
            width: 300,
          ),
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
            onPressed: startShop,
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
