import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

class Numpick extends StatefulWidget {
  const Numpick({super.key});

  @override
  State<Numpick> createState() => _NumpickState();
}

class _NumpickState extends State<Numpick> {
  int _curentValue = 0;
  @override
  Widget build(BuildContext context) {
    return
    Stack(
      alignment: Alignment.center,
      children: [
      Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.transparent,
          border: Border.all(color: Colors.white, width: 2)
        ),
      ),
    NumberPicker(
      axis: Axis.horizontal,
      value: _curentValue,
      itemCount: 9,
      minValue: 0,
      maxValue: 10,
      itemHeight: 40,
      itemWidth: 40,
      onChanged: (value) {
        setState(() {
          _curentValue = value;
        });
        
      },)]
      );
  }
}