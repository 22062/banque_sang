import 'package:flutter/material.dart';
import 'page1.dart';
import 'page2.dart';
import 'blood_group_page.dart';
import 'gender_page.dart';
import 'password_page.dart';
import 'next_button.dart'; // Importer le bouton NextButton
import 'package:http/http.dart' as http; // Importer le package http

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AjouterD(),
    );
  }
}

class AjouterD extends StatefulWidget {
  @override
  _AjouterDState createState() => _AjouterDState();
}

class _AjouterDState extends State<AjouterD> with AutomaticKeepAliveClientMixin {
  final PageController _pageController = PageController();
  final TextEditingController _nomController = TextEditingController();
  final TextEditingController _prenomController = TextEditingController();
  final TextEditingController _dateNaissanceController = TextEditingController();
  final TextEditingController _numTelController = TextEditingController();
  final TextEditingController _groupeSanguinController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();
  final TextEditingController _wilayaController = TextEditingController(); // Ajout du contrôleur pour la wilaya

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Inscription Donneur'),
      ),
      body: PageView(
        controller: _pageController,
        children: [
          Page1(
            nomController: _nomController,
            prenomController: _prenomController,
            onNext: () {
              _pageController.nextPage(duration: Duration(milliseconds: 500), curve: Curves.ease);
            },
          ),
          Page2(
            dateNaissanceController: _dateNaissanceController,
            numTelController: _numTelController,
            onNext: () {
              _pageController.nextPage(duration: Duration(milliseconds: 500), curve: Curves.ease);
            },
          ),
          BloodGroupPage(
            groupeSanguinController: _groupeSanguinController,
            onNext: () {
              _pageController.nextPage(duration: Duration(milliseconds: 500), curve: Curves.ease);
            },
          ),
          GenderPage(
            genderController: _genderController,
            onNext: () {
              _pageController.nextPage(duration: Duration(milliseconds: 500), curve: Curves.ease);
            },
          ),
          PasswordPage(
            passwordController: _passwordController,
            confirmPasswordController: _confirmPasswordController,
            onNext: () {
              _pageController.nextPage(duration: Duration(milliseconds: 500), curve: Curves.ease);
            },
          ),
        ],
      ),
      floatingActionButton: _currentPageIndex() == 4
          ? FloatingActionButton(
              onPressed: _enregistrerDonneur,
              child: Icon(Icons.save),
            )
          : null,
    );
  }

  int _currentPageIndex() {
    if (_pageController.hasClients) {
      return (_pageController.page ?? 0).round();
    } else {
      return 0;
    }
  }

  void _enregistrerDonneur() async {
    // Récupérez les valeurs des contrôleurs pour les détails du donneur
    final String nom = _nomController.text;
    final String prenom = _prenomController.text;
    final String dateNaissance = _dateNaissanceController.text;
    final String numTel = _numTelController.text;
    final String groupeSanguin = _groupeSanguinController.text;
    final String gender = _genderController.text;
    final String password = _passwordController.text;
    final String confirmPassword = _confirmPasswordController.text;
    final String wilaya = _wilayaController.text; // Récupérez également la valeur de la wilaya

    // Vérifiez si le mot de passe correspond au mot de passe de confirmation
    if (password != confirmPassword) {
      // Les mots de passe ne correspondent pas, affichez une erreur ou prenez une autre action
      print('Les mots de passe ne correspondent pas');
      return;
    }

    // Votre logique pour enregistrer le donneur avec toutes les informations
    // Assurez-vous de vérifier la validité des données avant l'enregistrement

    // Exemple de requête d'API (à adapter à votre API réelle)
    final response = await http.post(
      Uri.parse('http://172.20.10.14/php/Api/Ajouter_donneur.php'),
      body: {
        'nom': nom,
        'prenom': prenom,
        'date_naissance': dateNaissance,
        'num_tel': numTel,
        'gender': gender,
        'groupe_sanguin': groupeSanguin,
        'wilaya': wilaya,
        'password': password,
        
      },
    );

    if (response.statusCode == 200) {
      // Succès
      // Traitez la réponse si nécessaire
      print('Enregistrement réussi');
    } else {
      // Échec
      // Traitez l'erreur si nécessaire
      print('Erreur lors de l\'enregistrement : ${response.body}');
    }
  }
}
