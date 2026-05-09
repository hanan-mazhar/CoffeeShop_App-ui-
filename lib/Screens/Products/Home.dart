import 'package:coffee_shop/Screens/Products/HotCoffee.dart';
import 'package:coffee_shop/Screens/Products/home.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget{
  const Home({super.key});
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeaderIcons(),
          HeaderText(),
          SearchBar(context),
          Expanded(child: Headerbar())
          
        ],
      )),
     bottomNavigationBar: bottomNavigationBar()
     );
  }

Widget bottomNavigationBar(){
  return CurvedNavigationBar(
  backgroundColor: Colors.transparent,
  color: Colors.black45, // bar color
  buttonBackgroundColor: const Color.fromARGB(31, 97, 97, 97), // selected button color
  height: 60,
  animationDuration: Duration(milliseconds: 300),
  
  items: [
    Icon(Icons.home, color: Colors.orange, size: 28),
    Icon(Icons.favorite, color: Colors.orange, size: 28),
    Icon(Icons.shopping_cart, color: Colors.orange, size: 28),
    Icon(Icons.person, color: Colors.orange, size: 28),
  ],
);
}
Widget HeaderIcons(){
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(Icons.sort,color: Colors.white60,size: 35,),
               Icon(Icons.notifications,color: Colors.white60,size: 35,),
            ],
          );
}
Widget HeaderText(){
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Welcome Back!',style: TextStyle(
          color: Colors.white,
          fontSize: 33,
    
    
        ),),
        Text('What would you like to drink today?',style: TextStyle(
          color: Colors.white70,
          fontSize: 20,
        ))
      ],
    ),
  );
}

Widget SearchBar(BuildContext context){
  return Padding(
    padding: const EdgeInsets.all(4.0),
    child: Container(
      alignment: Alignment.center,
      height: MediaQuery.of(context).size.height/13,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            offset: Offset(0.3, 1),
            color: Colors.black12,
            spreadRadius: 1,
            blurRadius: 2
          )
        ],
        color: const Color.fromARGB(31, 97, 97, 97),
        borderRadius: BorderRadius.circular(30)
      ),
      child: TextFormField(
        style: TextStyle(
          color: Colors.white70
        ),
        decoration: InputDecoration(
          
          label: Text('Search your favorite coffee...'),
          border: InputBorder.none,
          prefixIcon: Icon(Icons.search,color: Colors.white12,),
          labelStyle: TextStyle(
            color: Colors.white12
          )
        ),
      ),
    ),
  );
}

Widget Headerbar(){
  return DefaultTabController(length: 5, child: Column(
    children: [
      TabBar(
        isScrollable: true,
        dividerColor: Colors.transparent,
        indicatorColor: Colors.deepOrange,
        labelColor: Colors.orange,
        unselectedLabelColor: Colors.grey,
        labelStyle: TextStyle(fontSize: 17),
        indicator: UnderlineTabIndicator(
        borderSide: BorderSide(width: 3.0,color: Colors.orange),
        
        insets: EdgeInsets.symmetric(horizontal: 10.0), // control the indicator width here
      ),
      
        tabAlignment: TabAlignment.start,
        tabs: [
        Tab(
          text: 'Home',
        ),
        Tab(
          text: 'Hot Coffee',
        ),
         Tab(
          text: 'Cold Coffee',
        ),
         Tab(
          text: 'Snacks ',
        ),
         Tab(
          text: 'Desserts',
        ),
      
      ],
      
      ),
      Expanded(
        child: TabBarView(children: [
        home(),
       HotCoffee(),
        home(),
       home(),
        home(),
              ]),
      )
    ],
  ),

  
  );
}
}