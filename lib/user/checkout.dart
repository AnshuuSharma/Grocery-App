import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/repository/productService.dart';
import 'package:shopping_app/user/addressBook.dart';
import 'package:shopping_app/user/placeOrder.dart';
import 'package:shopping_app/user/userAddress.dart';
import 'package:shopping_app/user/userprofile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'orderplaced.dart';
class Checkout extends StatelessWidget {
  const Checkout({super.key});

  @override
  Widget build(BuildContext context) {
    var w=MediaQuery.of(context).size.width;
    var h=MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text('checkout'),
        actions: [
          IconButton(onPressed: (){
            Navigator.pushNamed(context, '/homepage');
          },icon:Icon(Icons.home,color: Colors.green,))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          FirebaseAuth.instance.signOut();
        },
        child: Text("Logout",style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.green,
        shape: CircleBorder(side:BorderSide(width: 1,color: Colors.green)),
      ),
      body: Container(
        height: h*1,
        width: w,
        margin: EdgeInsets.only(left: 30),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Delivery Mode',style: TextStyle(color: Colors.grey,fontSize: 16),),
              Container(
                margin: EdgeInsets.only(top: 10,bottom: 40),
                height: h*0.22,
                width: w*0.4,
                decoration:BoxDecoration(
                  border: Border.all(width: 4,color: Colors.green),
                    borderRadius: BorderRadius.circular(10),
                ) ,
                child: Image.network('https://d1csarkz8obe9u.cloudfront.net/posterpreviews/food-delivery-logo-design-template-a342a3b7515a10c800c6885bce8b3ae9_screen.jpg?ts=1619678752',fit: BoxFit.fill,
          
                ),
              ),
              Text('Delivery Address',style: TextStyle(color: Colors.grey,fontSize: 16),),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: DottedBorder(
                  color: Colors.blueGrey,
                  strokeWidth: 2,
                  child: InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Address()));
                    },
                    child: Container(
                      height:h*0.07,
                      width:w*0.8,
                      color: Colors.grey[100],
                      child: const Center(child: Text('Add Address')),
                    ),
                  )

              ),
            ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: DottedBorder(
                color: Colors.blueGrey,
                strokeWidth: 2,
                child: InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>PlaceOrder()));
                  },
                  child: Container(
                    height:h*0.07,
                    width:w*0.8,
                    color: Colors.grey[100],
                    child: Center(child: Text('Place Order')),
                  ),
                )

            ),
          )
            ],
          ),
        ),
      ),
    );
  }

  Padding buildBox(BuildContext context, double h, double w,String text) {
    return Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: DottedBorder(
                color: Colors.blueGrey,
                strokeWidth: 2,
                child: InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Address()));
                    },
                    child: Container(
                      height:h*0.07,
                      width:w*0.8,
                      color: Colors.grey[100],
                      child: Center(child: Text(text)),
                    ),
                  )

                ),
              );
  }
}
