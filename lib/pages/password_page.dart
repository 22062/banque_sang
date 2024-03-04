// password_page.dart

import 'package:flutter/material.dart';

class PasswordPage extends StatelessWidget {
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  final VoidCallback onNext; // Assurez-vous que le type est correct ici

  PasswordPage({
    required this.passwordController,
    required this.confirmPasswordController,
    required this.onNext,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Votre code pour la page de mot de passe ici
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(labelText: 'Mot de passe'),
            ),
            TextField(
              controller: confirmPasswordController,
              obscureText: true,
              decoration: InputDecoration(labelText: 'Confirmer le mot de passe'),
            ),
            ElevatedButton(
              onPressed: onNext,
              child: Text('Suivant'),
            ),
          ],
        ),
      ),
    );
  }
}
