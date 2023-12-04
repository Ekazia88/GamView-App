import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

class Numpick extends StatefulWidget {
  final int value;
  final void Function(int) onChanged;

  const Numpick({Key? key,required this.value, required this.onChanged}) : super(key: key);

  @override
  State<Numpick> createState() => _NumpickState();
}

class _NumpickState extends State<Numpick> {
  late int _currentValue;

  @override
  void initState() {
    super.initState();
    _currentValue = widget.value; // Use rating as the initial value
  }

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
            border: Border.all(color: Colors.white, width: 2),
          ),
        ),
        NumberPicker(
          axis: Axis.horizontal,
          value: _currentValue,
          itemCount: 11, // Adjusted to include 0 to 10
          minValue: 0,
          maxValue: 10,
          itemHeight: 40,
          itemWidth: 35,
          onChanged: (value) {
            setState(() {
              _currentValue = value;
              widget.onChanged(value);
            });
          },
        ),
      ],
    );
  }
}
