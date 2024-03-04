import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Stack(children: [
            Positioned(
                left: 30,
                top: 200,
                right: 30,
                child: Container(
                  width: 400,
                  height: 500,
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 241, 4, 83),
                      borderRadius: BorderRadius.circular(20)),
                  child: Container(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          margin: EdgeInsets.only(bottom: 4),
                          child: Text(
                            "قال تعالى",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.bold),
                          )),
                      Container(
                          margin: EdgeInsets.only(bottom: 30),
                          child: Text(
                            "{وَمَنْ أَحْيَاهَا فَكَأَنَّمَا أَحْيَا النَّاسَ جَمِيعاً}",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.bold),
                          )),
                      Container(
                        width: 300,
                        height: 50,
                        //  margin: EdgeInsets.only(bottom: 250),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          //borderRadius: BorderRadius.circular(22)
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey
                                  .withOpacity(0.5), // Couleur de l'ombre
                              spreadRadius: 5, // Étendue de l'ombre
                              blurRadius: 7, // Flou de l'ombre
                              offset: Offset(0,
                                  3), // Décalage de l'ombre par rapport à la boîte
                            ),
                          ],
                        ),
                        child: InkWell(
                            onTap: () {
                            Navigator.pushNamed(context, '/AjouterD');
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                "Inscrire en tanque donneur",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 241, 4, 83),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                              Icon(
                                Icons.add,
                                size: 40,
                                color: Color.fromARGB(255, 241, 4, 83),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: 300,
                        height: 50,
                        //margin: EdgeInsets.only(bottom: 250),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey
                                  .withOpacity(0.5), // Couleur de l'ombre
                              spreadRadius: 5, // Étendue de l'ombre
                              blurRadius: 7, // Flou de l'ombre
                              offset: Offset(0,
                                  3), // Décalage de l'ombre par rapport à la boîte
                            ),
                          ],
                        ),

                        child: InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, '/listeD');
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                "chercher de donneur",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 241, 4, 83),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                              Icon(
                                Icons.search,
                                size: 40,
                                color: Color.fromARGB(255, 241, 4, 83),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 20,),
                      Container(
                        width: 300,
                        height: 50,
                        //margin: EdgeInsets.only(bottom: 250),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey
                                  .withOpacity(0.5), // Couleur de l'ombre
                              spreadRadius: 5, // Étendue de l'ombre
                              blurRadius: 7, // Flou de l'ombre
                              offset: Offset(0,
                                  3), // Décalage de l'ombre par rapport à la boîte
                            ),
                          ],
                        ),

                        child: InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, '/statistiques');
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                "Les Statistiques",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 241, 4, 83),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                              Icon(
                                Icons.bar_chart,
                                size: 40,
                                color: Color.fromARGB(255, 241, 4, 83),
                              ),
                            ],
                          ),
                        ),
                      ),
                      
                      
                    ],
                  )),
                )),
            Positioned(
              left: 90,
              top: 50,
              child: Image.asset(
                "assets/images/blood-donation (3).png",
                width: 200,
              ),
            )
          ]),
        ),
      ),
    );
  }
}
