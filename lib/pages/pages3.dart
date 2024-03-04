import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
class pages3 extends StatefulWidget {
  const pages3({super.key});

  @override
  State<pages3> createState() => _pages3State();
}

class _pages3State extends State<pages3> {
  final controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
            color: Colors.white,
            child: Column(
              
              
              children: [
              Container(
                decoration: BoxDecoration(color: const Color.fromARGB(255, 242, 236, 236),
                borderRadius: BorderRadius.circular(50)
                ),
                
                margin: EdgeInsets.only(top: 50),
                
                child: Image.asset("assets/images/blood-donation (1).png",
                width: 200,
                
                ),
              ),
              SizedBox(height: 20,),
              Container(
                width: 300,
                child: Text("banque de sang c'est facile et utile et important", style: TextStyle(
                color: Colors.black,fontSize: 22,fontWeight: FontWeight.bold
                ),),
              ),
              SizedBox(height: 20,),
              Container(
                width: 300,
                child: Text("banque de sang c'est facile et utile et important", style: TextStyle(
                color: Colors.black,fontSize: 19,
                ),),
              ),
            
                Container(
                  margin: EdgeInsets.only(top: 300),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      TextButton(
                          onPressed: () {
                            controller.jumpToPage(2);
                          },
                          child: Text("Skip",
                              style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold))),
                      SmoothPageIndicator(
                        effect: ExpandingDotsEffect(activeDotColor: Colors.red),
                        // Utilisation de SmoothPageIndicator au lieu de SmoothIndicator
                        controller: controller,
                        count: 3,
                        onDotClicked: (index) {
                          controller.animateToPage(index,
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeIn);
                        },
                      ),
                      TextButton(
                          onPressed: () {
                            controller.nextPage(
                                duration: Duration(milliseconds: 500),
                                curve: Curves.easeInOut);
                            // Ajoutez ici le code que vous souhaitez exécuter lorsque le bouton est pressé
                          },
                          child: Text("done",
                              style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold))),
                    ],
                  ),
                ),
              ],
            ),
          ),
        
    );
  }
}