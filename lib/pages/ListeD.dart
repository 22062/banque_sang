import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ListeD extends StatefulWidget {
  const ListeD({Key? key}) : super(key: key);

  @override
  _ListeDState createState() => _ListeDState();
}

class _ListeDState extends State<ListeD> {
  List<Map<String, dynamic>> dataList = [];
  String selectedLocation = 'Tous'; // Initialiser avec une valeur par défaut
  String selectedBloodType = 'Tous'; // Initialiser avec une valeur par défaut

  // Définir les options pour la localisation (wilaya)
  final List<String> locations = ['Tous', 'Nouakchott', 'Nouadhibou', 'Atar', 'Hodh Chargui'];

  // Définir les options pour le groupe sanguin
  final List<String> bloodTypes = ['Tous', 'A+', 'B+', 'O+', 'AB+', 'A-', 'B-', 'O-', 'AB-'];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final response = await http.get(Uri.parse('http://192.168.21.21/php/Api/Listedonneurs.php'));

    if (response.statusCode == 200) {
      setState(() {
        dataList = List<Map<String, dynamic>>.from(json.decode(response.body));
      });
    } else {
      throw Exception('Failed to load data');
    }
  }

  List<Map<String, dynamic>> filterData() {
    if (selectedLocation == 'Tous' && selectedBloodType == 'Tous') {
      return dataList;
    }

    return dataList.where((item) {
      bool locationMatches = selectedLocation == 'Tous' || item['wilaya'] == selectedLocation;
      bool bloodTypeMatches = selectedBloodType == 'Tous' || item['groupe_sanguin'] == selectedBloodType;

      return locationMatches && bloodTypeMatches;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        
        body: Column(
          children: [
            Container(
  width: double.infinity,
  height: 300,
  child: Stack(
    children: [
      Positioned(
        child: Container(
          height: 200,
          width: 400,
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 244, 94, 144),
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                spreadRadius: 1,
                blurRadius: 5,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Container(
            margin: EdgeInsets.fromLTRB(10, 15, 0, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  Icons.menu,
                  size: 30,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 100,
                ),
                Text(
                  "Banque de sang",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      Positioned(
        left: 50,
        top: 70,
        child: Container(
          width: 300,
          height: 210,
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 244, 94, 144),
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                spreadRadius: 1,
                blurRadius: 5,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(7, 7, 0, 0),
                child: Text(
                  "Cherche un donneur",
                  style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),
                ),
              ),
              Container(
                width: 250,
                margin: EdgeInsets.fromLTRB(15, 10, 0, 0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Color.fromARGB(255, 237, 237, 237),
                ),
                child: DropdownButtonFormField<String>(
                  value: selectedLocation,
                  onChanged: (value) {
                    setState(() {
                      selectedLocation = value!;
                    });
                  },
                  items: locations.map((location) {
                    return DropdownMenuItem<String>(
                      value: location,
                      child: Text(location),
                    );
                  }).toList(),
                  decoration: InputDecoration(
                    hintText: "le nom du wilaya",
                    contentPadding: EdgeInsets.fromLTRB(20, 10, 0, 0),
                    suffixIcon: Icon(Icons.location_on),
                    border: InputBorder.none,
                  ),
                ),
              ),
              Container(
                width: 250,
                margin: EdgeInsets.fromLTRB(15, 10, 0, 0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Color.fromARGB(255, 238, 238, 238),
                ),
                child: DropdownButtonFormField<String>(
                  value: selectedBloodType,
                  onChanged: (value) {
                    setState(() {
                      selectedBloodType = value!;
                    });
                  },
                  items: bloodTypes.map((bloodType) {
                    return DropdownMenuItem<String>(
                      value: bloodType,
                      child: Text(bloodType),
                    );
                  }).toList(),
                  decoration: InputDecoration(
                    hintText: "le groupe du sang",
                    contentPadding: EdgeInsets.fromLTRB(20, 10, 0, 0),
                    suffixIcon: Icon(Icons.bloodtype),
                    border: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: 100,
                height: 50,
                margin: EdgeInsets.fromLTRB(15, 0, 0, 0),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(10),
                   boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.3),
        spreadRadius: 1,
        blurRadius: 5,
        offset: Offset(0, 3),
      ),
    ],
                ),
                child: Center(
                  child: Text(
                    "Search",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ],
  ),
),

            // Deuxième partie
            Expanded(
              child: ListView.builder(
                itemCount: filterData().length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(22),
                    ),
                    child: ListTile(
                      contentPadding: EdgeInsets.all(20),
                      leading: Container(
                        width: 90,
                        height: 60,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 244, 94, 144),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Center(
                          child: Text(
                            filterData()[index]['groupe_sanguin'],
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ), 
                      title: Row(
                        children: [
                          Text(
                            filterData()[index]['nom'],
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          SizedBox(width: 5,),
                          Text(
                            filterData()[index]['prenom'],
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                      subtitle: Row(
                        children: [
                          Text(
                            filterData()[index]['nom_wilaye_fr'],
                            style: TextStyle(color: Colors.black),
                          ),
                          SizedBox(width: 10),
                          Text(
                            filterData()[index]['num_tel'],
                            style: TextStyle(color: Colors.black,fontSize: 20),
                          ),
                        ],
                      ),
                    
                    ),
                  );

                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: ListeD(),
  ));
}
