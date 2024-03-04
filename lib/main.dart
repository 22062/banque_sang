import 'package:banque_sang222/pages/AjouterD.dart';
import 'package:banque_sang222/pages/Home.dart';
import 'package:banque_sang222/pages/ListeD.dart';
//import 'package:banque_sang222/pages/statistique.dart';

import 'package:flutter/material.dart';
import 'package:banque_sang222/pages/HomeScreen.dart';
 // Assurez-vous d'importer correctement le fichier HomeScreen.dart

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => Home(),
      
        '/home': (context) => HomeScreen(), 
        '/listeD':(context)=>ListeD(),
        //'/statistiques':(context) => Statistique(),
        '/AjouterD':(context)=>AjouterD(),
      },
    );
  }
}
