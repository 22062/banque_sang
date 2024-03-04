// next_button.dart

import 'package:flutter/material.dart';

class NextButton extends StatelessWidget {
  final VoidCallback onPressed;

  NextButton({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text('Suivant', style: TextStyle(color: Colors.white, fontSize: 22)),
      ),
    );
  }
}
