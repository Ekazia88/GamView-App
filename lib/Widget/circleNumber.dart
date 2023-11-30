import 'package:flutter/material.dart';

class CircleNumber extends StatelessWidget {
    final double number;
    CircleNumber({required this.number});
    @override
    Widget build(BuildContext context) {
      return Container(
        width: 80, // Sesuaikan ukuran sesuai kebutuhan
        height: 80, // Sesuaikan ukuran sesuai kebutuhan
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Theme.of(context).brightness == Brightness.dark
          ? Colors.teal // Ganti warna sesuai tema gelap
          : Colors.blue,
        ),
        child: Center(
          child: Text(
            "$number",
            style: TextStyle(
              color: Colors.white,
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      );
    }
  }