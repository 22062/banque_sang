// gender_page.dart

import 'package:flutter/material.dart';
import 'next_button.dart';

class GenderPage extends StatelessWidget {
  final TextEditingController genderController;
  final VoidCallback onNext;

  GenderPage({required this.genderController, required this.onNext});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Spécifier le Sexe",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {
                  genderController.text = "Homme";
                },
                child: Column(
                  children: [
                    Image.asset('assets/images/man.png', width: 50, height: 50),
                    SizedBox(height: 10),
                    Text("Homme"),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  genderController.text = "Femme";
                },
                child: Column(
                  children: [
                    Image.asset('assets/images/woman.png', width: 50, height: 50),
                    SizedBox(height: 10),
                    Text("Femme"),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          NextButton(onPressed: onNext),
        ],
      ),
    );
  }
}
