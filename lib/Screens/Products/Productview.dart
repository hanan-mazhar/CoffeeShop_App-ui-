import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Productview extends StatelessWidget{
  late Map Product ;
   Productview({super.key, required this.Product});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height/2,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(image: AssetImage(Product['image']),fit: BoxFit.cover)
                ),

              ),
              Positioned(
                top: 20,
                left: 20,
                
                child: Container(
                  alignment: Alignment.center,
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.white
                  ),
                  child: IconButton(onPressed: (){
                  Navigator.pop(context);
                                }, icon: Icon(Icons.arrow_back_ios_new,size: 25,)),
                ))
            ],
          ),
          Text(Product['type'],style: TextStyle(
            color: Colors.white70,
            fontSize: 20,
            letterSpacing: 5
          ),),
          SizedBox(height: 7,),
          Text(Product['name'],style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            
          ),),
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                height: 47,
                width: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.white70
                ),
                child: Row(
                  children: [
                    Icon(CupertinoIcons.minus),
                    
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15,),
                      child: Text('1',style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w800
                      ),),
                    ),
                    Icon(Icons.add)
                  ],
                ),
              ),
              Text(Product['price'],style: TextStyle(
                color: Colors.orange,
                fontSize: 30,
                fontWeight: FontWeight.bold
              ),)
            ],
          ),
          SizedBox(height: 10,),
          Text(Product['description'],style: TextStyle(
            color: Colors.white70,
            fontSize: 18,
            letterSpacing: 3
          ),),
          

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 50,horizontal: 10),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepOrangeAccent
              ),
              onPressed: (){}, child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Add to Cart',style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.white
                          ),),
              )),
          )
          

        ],
      ),
    );
  }
}