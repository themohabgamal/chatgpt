// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class SuggetionBox extends StatelessWidget {
  final String header;
  final String body;
  final Color color;
  const SuggetionBox({
    super.key,
    required this.header,
    required this.body,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
          color: color,
          borderRadius: const BorderRadius.all(Radius.circular(15))),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(header,
              style: const TextStyle(
                  fontFamily: "Cera Pro",
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white)),
          const SizedBox(
            height: 5,
          ),
          Text(body,
              style: const TextStyle(
                  fontFamily: "Cera Pro", fontSize: 18, color: Colors.white)),
        ],
      ),
    );
  }
}
