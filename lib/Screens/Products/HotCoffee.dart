import 'package:flutter/material.dart';

class HotCoffee extends StatelessWidget{
 
  
  const HotCoffee({super.key});
  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> Coffee = [
  {
    "image": "assets/images/Coffee6.jpg",
    "name": "Choco Coffee",
    "price": "\$5.20",
    "type": "Desserts",
    "description": "Soft chocolate dessert coffee."
  },
  {
    "image": "assets/images/Coffee5.jpg",
    "name": "New Coffee",
    "price": "\$2.90",
    "type": "Snacks",
    "description": "Smooth coffee brewed with cold water."
  },
  {
    "image": "assets/images/Coffee4.jpg",
    "name": "Cold Brew",
    "price": "\$3.80",
    "type": "Cold Coffee",
    "description": "Smooth coffee brewed with cold water."
  },
  {
    "image": "assets/images/Coffee3.jpg",
    "name": "Iced Latte",
    "price": "\$4.50",
    "type": "Cold Coffee",
    "description": "Cold milk with espresso and ice."
  },
  {
    "image": "assets/images/Coffee2.jpg",
    "name": "Cappuccino",
    "price": "\$4.20",
    "type": "Hot Coffee",
    "description": "Espresso with steamed milk and foam."
  },
  {
    "image": "assets/images/Coffee1.jpg",
    "name": "Espresso",
    "price": "\$3.50",
    "type": "Hot Coffee",
    "description": "Strong and bold espresso shot."
  }
];
    return GridView.builder(
      
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
    crossAxisSpacing: 10,
    mainAxisSpacing: 10,
    childAspectRatio: 0.75
    
    ), 
    
    
    itemCount: Coffee.length,
    itemBuilder: (context,index){
      final  Coffe =Coffee[index];
      return Card(
        elevation: 10,
        
        color: const Color.fromARGB(31, 237, 226, 226),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(Coffe['image'],height: 130,width: 180,fit: BoxFit.cover,),
            ),
            Text(Coffe['name'],style: TextStyle(
              color: Colors.white,
              fontSize: 25,
              fontWeight: FontWeight.bold,

            ),),
            SizedBox(height: 5,),
            Text(Coffe['type'],style: TextStyle(
              color: Colors.white60,
              fontSize: 16
            ),),
            Padding(
              padding: const EdgeInsets.all(3.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(Coffe['price'].toString(),style: TextStyle(
                    color: Colors.white,
                    fontSize: 27,
                    fontWeight: FontWeight.w500
                  ),),
                  Container(
                    height: 38,
                    width: 38,
                    decoration: BoxDecoration(
                      color: Colors.deepOrangeAccent,
                      borderRadius: BorderRadius.circular(30)
                    ),
                    child: Icon(Icons.add,color: Colors.white,size: 26,),
                  )
                ],
              ),
            )
          ],
        ),
        
      );


    });
  }
}