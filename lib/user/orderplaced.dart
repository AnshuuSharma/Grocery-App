import 'package:flutter/material.dart';
class OrderPlaced extends StatelessWidget {
  const OrderPlaced({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children:[
          Text('Your order is confirmed!',style: TextStyle(fontSize:30,color: Colors.teal),),
          Image.asset("assets/images/order-confirmed.gif")
        ]
      ),
    );
  }
}
