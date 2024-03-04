import 'package:flutter/material.dart';
class BloodGroupPage extends StatelessWidget {
  final TextEditingController groupeSanguinController;
  final VoidCallback onNext;

  BloodGroupPage({
    required this.groupeSanguinController,
    required this.onNext,
  });

  @override
  Widget build(BuildContext context) {
    List<String> bloodGroups = ["A+", "A-", "B+", "B-", "AB+", "AB-", "O+", "O-"];
    String selectedBloodGroup = "";

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Sélectionnez votre groupe sanguin',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Container(
              height: 200, // Ajustez la hauteur selon vos besoins
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: bloodGroups.length,
                itemBuilder: (context, index) {
                  String bloodGroup = bloodGroups[index];
                  return _buildBloodGroupItem(bloodGroup, selectedBloodGroup);
                },
              ),
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
    );
  }

  Widget _buildBloodGroupItem(String bloodGroup, String selectedBloodGroup) {
    return GestureDetector(
      onTap: () {
        groupeSanguinController.text = bloodGroup;
      },
      child: Container(
        width: 30,
        height: 30,
        margin: EdgeInsets.symmetric(horizontal: 8.0),
        decoration: BoxDecoration(
          color: selectedBloodGroup == bloodGroup ? Colors.red : Colors.white,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 2,
              offset: Offset(0, 1),
            ),
          ],
        ),
        child: Center(
          child: Text(
            bloodGroup,
            style: TextStyle(fontSize: 10, color: selectedBloodGroup == bloodGroup ? Colors.white : Colors.black),
          ),
        ),
        
      ),
      
    );
  }
}
