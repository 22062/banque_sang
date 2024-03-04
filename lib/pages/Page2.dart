import 'package:flutter/material.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:intl/intl.dart';

class Page2 extends StatelessWidget {
  final TextEditingController dateNaissanceController;
  final TextEditingController numTelController;
  final VoidCallback onNext;

  Page2({
    required this.dateNaissanceController,
    required this.numTelController,
    required this.onNext,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DateTimeField(
                format: DateFormat('dd/MM/yyyy'),
                controller: dateNaissanceController,
                decoration: InputDecoration(labelText: 'Date de Naissance'),
                onChanged: (date) {
                  // Vous pouvez également utiliser onChanged pour mettre à jour le contrôleur
                  if (date != null) {
                    dateNaissanceController.text = DateFormat('dd/MM/yyyy').format(date);
                  }
                },
                onShowPicker: (context, currentValue) async {
                  final date = await showDatePicker(
                    context: context,
                    initialDate: currentValue ?? DateTime.now(),
                    firstDate: DateTime(1900),
                    lastDate: DateTime(2100),
                  );
          
                  return date;
                },
              ),
              TextField(
                controller: numTelController,
                decoration: InputDecoration(labelText: 'Numéro de Téléphone'),
              ),
              SizedBox(height: 10,),
              InkWell(
                onTap: onNext,
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
