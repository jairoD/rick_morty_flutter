import 'package:flutter/material.dart';

class InfoDetail extends StatelessWidget {
  final String label;
  final String value;
  const InfoDetail({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Row(
        children: [
          Text(
            label.toUpperCase(),
            style: const TextStyle(
                color: Color(0xffa6cccc),
                fontSize: 24,
                fontWeight: FontWeight.bold),
          ),
          Text(
            value,
            style: const TextStyle(
                color: Color(0xffa6cccc),
                fontSize: 20,
                fontWeight: FontWeight.normal),
          )
        ],
      ),
    );
  }
}
