import 'package:flutter/material.dart';
import 'wilaya_api.dart'; // Importez le fichier contenant la classe WilayaApi

class Page1 extends StatefulWidget {
  final TextEditingController nomController;
  final TextEditingController prenomController;
  final VoidCallback onNext;

  Page1({
    required this.nomController,
    required this.prenomController,
    required this.onNext,
  });

  @override
  _Page1State createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  List<String> wilayas = [];
  String selectedWilaya = '';

  @override
  void initState() {
    super.initState();
    _loadWilayas();
  }

  Future<void> _loadWilayas() async {
    try {
      List<String> loadedWilayas = await WilayaApi.fetchWilayas();

      setState(() {
        wilayas = loadedWilayas;
        selectedWilaya = wilayas.isNotEmpty ? wilayas[0] : '';
      });
    } catch (error) {
      print('Erreur lors du chargement des wilayas: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: widget.nomController,
                decoration: InputDecoration(labelText: 'Nom',
                 border: OutlineInputBorder(
                 borderRadius: BorderRadius.circular(10.0),
                     ),
                ),
              ),
              SizedBox(height: 10,),
              TextField(
                controller: widget.prenomController,
                decoration: InputDecoration(labelText: 'Prénom',
                 border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
                ),
              ),
              DropdownButton<String>(
                value: selectedWilaya,
                items: wilayas.map((String wilaya) {
                  return DropdownMenuItem<String>(
                    value: wilaya,
                    child: Text(wilaya),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    selectedWilaya = newValue!;
                  });
                },
              ),
            InkWell(
              onTap: widget.onNext,
              child: Container(
                width: 350, 
                height: 50,
                decoration: BoxDecoration( 
                color: Colors.red,
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Center(child: Text("Suivant",  
                style: TextStyle( 
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
                )),
              ),
            )
            ],
          ),
        ),
      ),
    );
  }
}
