import 'package:flutter/material.dart';

class NoConnectionBanner extends StatelessWidget {
  const NoConnectionBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.red,
      padding: const EdgeInsets.all(6),
      child: const Text(
        'No Internet Connection',
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
      ),
    );
  }
}
