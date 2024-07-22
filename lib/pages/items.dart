import 'package:hive/hive.dart';

import '../Component/appbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/Component/description.dart';
import 'package:shopping_app/entity/product.dart';
import 'package:shopping_app/pages/cart.dart';
import 'package:shopping_app/repository/productService.dart';
import '../Component/button.dart';
import '/data/productData.dart';
import 'homePage.dart';

class Items extends StatelessWidget {
  List data = [];
  var box;

  Items(List l) {
    data = l;
    box = Hive.openBox('CartBox');
  }
  late final _newBox = Hive.box('CartBox');

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: buildAppBar(context, ' '),
        body: ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Description(
                              data[index].values.elementAt(1),
                              data[index].values.elementAt(2),
                              data[index].values.elementAt(5),
                              data[index].values.elementAt(6),
                              data[index].values.elementAt(3),
                              data[index].values.elementAt(4))));
                },
                child: Container(
                  decoration: const BoxDecoration(
                      border: Border(
                          bottom: BorderSide(width: 2, color: Colors.black12))),
                  height: h * 0.22,
                  width: w,
                  child: Row(
                    children: [
                      Image.network(
                        data[index].values.elementAt(2),
                        width: w * 0.4,
                        height: h * 0.17,
                      ),
                      SizedBox(
                        width: w * 0.6,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              data[index].values.elementAt(1),
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                                'Quantity: ${data[index].values.elementAt(5).toString()}'),
                            Text(
                              'Rs. ' +
                                  data[index].values.elementAt(3).toString(),
                              style: TextStyle(
                                  color: Colors.deepOrange[800],
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            ),
                            Provider.of<ProductService>(context)
                                    .isAdded(data[index].values.elementAt(1))
                                ? buildButton(h, w, context,
                                    data[index].values.elementAt(1))
                                : ElevatedButton(
                                    onPressed: () {
                                      Provider.of<ProductService>(context,
                                              listen: false)
                                          .addItem(new Product(
                                              data[index].values.elementAt(1),
                                              data[index].values.elementAt(2),
                                              data[index]
                                                  .values
                                                  .elementAt(3)
                                                  .toString(),
                                              1,
                                              data[index].values.elementAt(5)));
                                      // _newBox.put(index,{
                                      //   "title":data[index].values.elementAt(1),
                                      //   "image":data[index].values.elementAt(2),
                                      //   "Price":data[index].values.elementAt(3),
                                      //   "quantity":data[index].values.elementAt(5),
                                      // });

                                      // Navigator.push(context, MaterialPageRoute(builder: (context)=>Cart()));
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                              content: Text(
                                                  "Product Added Successfully!")));
                                    },
                                    style: TextButton.styleFrom(
                                        backgroundColor: Colors.green,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(6))),
                                    child: SizedBox(
                                      width: w * 0.17,
                                      child: const Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Icon(
                                            Icons.shopping_cart_outlined,
                                            color: Colors.white,
                                          ),
                                          Text(
                                            'Add',
                                            style:
                                                TextStyle(color: Colors.white),
                                          )
                                        ],
                                      ),
                                    ),
                                  )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                // child: SingleProduct(data,index),
              );
            }
            // Text(data[index].toString())
            ));
  }

  // SizedBox buildButton(double h, double w, BuildContext context, int index) {
  //   return SizedBox(
  //                           width: 110,
  //                           child: Row(
  //                             children: [
  //                               Container(
  //                                 height: h*0.05,
  //                                 width: w*0.08,
  //                                 decoration: const BoxDecoration(
  //                                     color: Colors.green,
  //                                     borderRadius: BorderRadius.only(
  //                                         topRight: Radius.circular(2),
  //                                         bottomRight: Radius.circular(2)
  //                                     )
  //                                 ),
  //                                 child:IconButton(onPressed: (){
  //                                 Provider.of<ProductService>(context,listen: false).decreaseQty2(data[index].values.elementAt(1));
  //
  //                               },icon:Icon(Icons.remove,color: Colors.white,size: 20,)),),
  //                               Container(
  //                                 height: h*0.05,
  //                                 width: w*0.08,
  //                                 decoration: const BoxDecoration(
  //                                     border:Border.symmetric(horizontal: BorderSide(width: 1,color: Colors.black38))
  //                                 ),child:Center(child: Text(Provider.of<ProductService>(context).isQty(data[index].values.elementAt(1)).toString())),),
  //                               Container(
  //                                 height: h*0.05,
  //                                 width: w*0.08,
  //                                 decoration: const BoxDecoration(
  //                                     color: Colors.green,
  //                                     borderRadius: BorderRadius.only(
  //                                         topRight: Radius.circular(2),
  //                                         bottomRight: Radius.circular(2)
  //                                     )
  //                                 ),
  //                                 child:IconButton(onPressed: (){
  //                                 Provider.of<ProductService>(context,listen: false).increaseQty2(data[index].values.elementAt(1));
  //                               },icon:Icon(Icons.add,color: Colors.white,size: 20,),
  //                                 style:ButtonStyle(),
  //                               ),),
  //                             ],
  //                           ),
  //                         );
  // }
  Row buildRow(int index, BuildContext context, double h, double w) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: () {
            var q = Provider.of<ProductService>(context, listen: false)
                .getQty(index);
            if (q <= 1) {
              Provider.of<ProductService>(context).removeItem(index);
            }
            if (q > 0) {
              Provider.of<ProductService>(context, listen: false)
                  .decreaseQty(index);
            }
          },
          child: Container(
            height: h * 0.05,
            width: w * 0.1,
            decoration: const BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(2),
                    bottomLeft: Radius.circular(2))),
            child: const Center(
                child: Text(
              '-',
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            )),
          ),
        ),
        Container(
            height: h * 0.05,
            width: w * 0.1,
            decoration: const BoxDecoration(
                border: Border.symmetric(
                    horizontal: BorderSide(width: 1, color: Colors.black38))),
            child: Center(
                child: Text(Provider.of<ProductService>(context, listen: false)
                    .getQty(index)
                    .toString()))),
        InkWell(
          onTap: () {
            Provider.of<ProductService>(context, listen: false)
                .increaseQty(index);
          },
          child: Container(
            height: h * 0.05,
            width: w * 0.1,
            decoration: const BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(2),
                    bottomRight: Radius.circular(2))),
            child: Center(
                child: Text('+',
                    style: TextStyle(fontSize: 20, color: Colors.white))),
          ),
        ),
      ],
    );
  }
}
