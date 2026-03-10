import 'package:coffee_shop/Screens/Home.dart';
import 'package:flutter/material.dart';


class Welcome extends StatelessWidget{
  const Welcome({super.key});
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage('assets/images/Welcomecoffee.jpg'),fit: BoxFit.cover,opacity: 0.87),
              
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height/4,
            left: MediaQuery.of(context).size.width/4.3,
            child: Text('CoffeeShop',style: TextStyle(
            fontSize: 50,
            fontFamily: 'welcome',
            shadows: [
              Shadow(
                offset: Offset(0.2, 1),
                color: Colors.grey,
              )
            ],
            
            fontWeight: FontWeight.bold,
            color: Colors.white
          ),)),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 0, 15, 30),
                child: Text('Explore delicious coffee, snacks, and special offers',style: TextStyle(
                  color: Colors.white,
                  shadows: [
              Shadow(
                offset: Offset(0.2, 1),
                color: Colors.black,
                blurRadius: 3
              )
            ],
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 28),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepOrange,
                    foregroundColor: Colors.white
                  ),
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Home()));
                  }, child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Get Started',style: TextStyle(
                      fontSize: 20
                    ),),
                  )),
              )
            ],
          )
        ],
        
        
      ),
    );
  }
}