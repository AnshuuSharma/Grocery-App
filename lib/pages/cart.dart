import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/repository/productService.dart';

import '../Component/appbar.dart';
class Cart extends StatefulWidget {
   Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}


class _CartState extends State<Cart> {
  get index => 0;
  var p;
  totalPrice(var price){
    return p=p+price;
  }
  @override
  Widget build(BuildContext context) {
    var w=MediaQuery.of(context).size.width;
    var h=MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: buildAppBar(context,'Cart'),
      bottomNavigationBar: (Provider.of<ProductService>(context).getLength()!=0)?Container(
        decoration: BoxDecoration(
          boxShadow: [BoxShadow(color: Colors.black54,blurRadius: 10)]
        ),
        child: BottomAppBar(
          elevation: 20,
          child: InkWell(
            onTap: (){Navigator.pushNamed(context, '/wrapper');},
            child: Container(
              width: w*0.9,
              height: h*0.1,
              color: Colors.green,
              child: Center(child: Text('Proceed To Checkout',style: TextStyle(color: Colors.white,fontSize: 20),)),
            ),
          ),
        ),
      ):Container(
        decoration: BoxDecoration(
            boxShadow: [BoxShadow(color: Colors.black54,blurRadius: 10)]
        ),
        child: BottomAppBar(
          elevation: 20,
          child: InkWell(
            onTap: (){Navigator.pushNamed(context, '/homepage');},
            child: Container(
              width: w*0.9,
              height: h*0.1,
              color: Colors.green,
              child: Center(child: Text('Start Shopping',style: TextStyle(color: Colors.white,fontSize: 20),)),
            ),
          ),
        ),
      ),

      body: (Provider.of<ProductService>(context).getLength()!=0)?Consumer<ProductService>(
        builder: (context,service,_)=>Column(
          children: [
            Container(
              height: h*0.1,
              width: w,
              decoration: BoxDecoration(
                border: Border(bottom: BorderSide(width: 1,color: Colors.black26))
              ),
              child: Center(child: Text('Cart Total : Rs.${service.getTotal()}',style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),)),
            ),
            Expanded(
              child: ListView.builder(
                itemCount:service.getLength() ,
                itemBuilder:(context,index)=>Container(
                  height: h*0.2,
                  decoration: BoxDecoration(
                    border: Border(bottom: new BorderSide(width: 2,color: Colors.black12))
                  ),
                  child: Row(
                    children:[
                      SizedBox(
                        width: w*0.4,
                        child: Image.network(service.getImage(index),height:h*0.17,width:w*0.3,)
                    ),
                      SizedBox(
                        width: w*0.6,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Flexible(
                                child: Text(Provider.of<ProductService>(context,listen: false).getTitle(index),
                                style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),
                                )),
                            Text('Quantity: ${service.getQuantity(index)}'),
                            Text('Rs.${service.getPrice(index)}',
                              style:TextStyle(color: Colors.deepOrange[800],fontSize: 16) ,),
                        Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                        InkWell(
                        onTap: (){
                        var q=Provider.of<ProductService>(context,listen: false).getQty(index);
                        if(q<=1){
                          Provider.of<ProductService>(context,listen: false).removeItem(index);
                        }
                        else if(q>0) {
                          Provider.of<ProductService>(
                              context, listen: false).decreaseQty(index);
                        }
                      },
                      child: Container(
                        height: h*0.05,
                        width: w*0.1,
                        decoration: const BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(2),
                                bottomLeft: Radius.circular(2)
                            )
                        ),
                        child: const Center(child: Text('-',style: TextStyle(fontSize: 20,
                            color: Colors.white,
                            fontWeight:FontWeight.bold ),)),
                      ),
                    ),
                    Container(
                        height: h*0.05,
                        width: w*0.1,
                        decoration: const BoxDecoration(
                            border:Border.symmetric(horizontal: BorderSide(width: 1,color: Colors.black38))
                        ),
                        child: Center(child: Text(Provider.of<ProductService>(context,listen: false).getQty(index).toString()))
                    ),
                    InkWell(
                      onTap: (){
                        Provider.of<ProductService>(context,listen: false).increaseQty(index);

                      },
                      child: Container(
                        height: h*0.05,
                        width: w*0.1,
                        decoration: const BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(2),
                                bottomRight: Radius.circular(2)
                            )
                        ),
                        child: Center(child: Text('+',style: TextStyle(fontSize: 20,color: Colors.white))),
                      ),
                    ),
                  ],
                )
                          ],
                        ),
                      ) ,]
              
                  ),
                )
              
              
              ),
            ),
          ],
        ),
      ):Container(
        height: h*0.6,
        width: w,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text('Your cart is empty',style: TextStyle(fontSize: 28,color: Colors.green,fontWeight: FontWeight.bold),),
            Image.asset('assets/images/empty-cart.webp')
          ],
        ),
      )
    );
  }




}
