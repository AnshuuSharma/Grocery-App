import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../repository/productService.dart';
SizedBox buildButton(double h, double w, BuildContext context,String title) {
  return SizedBox(
    width: 110,
    child: Row(
      children: [
        Container(
          height: h*0.05,
          width: w*0.08,
          decoration: const BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(2),
                  bottomRight: Radius.circular(2)
              )
          ),
          child:IconButton(onPressed: (){
            Provider.of<ProductService>(context,listen: false).decreaseQty2(title);

          },icon:Icon(Icons.remove,color: Colors.white,size: 20,)),),
        Container(
          height: h*0.05,
          width: w*0.08,
          decoration: const BoxDecoration(
              border:Border.symmetric(horizontal: BorderSide(width: 1,color: Colors.black38))
          ),child:Center(child: Text(Provider.of<ProductService>(context).isQty(title).toString())),),
        Container(
          height: h*0.05,
          width: w*0.08,
          decoration: const BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(2),
                  bottomRight: Radius.circular(2)
              )
          ),
          child:IconButton(onPressed: (){
            Provider.of<ProductService>(context,listen: false).increaseQty2(title);
          },icon:Icon(Icons.add,color: Colors.white,size: 20,),
            style:ButtonStyle(),
          ),),
      ],
    ),
  );
}