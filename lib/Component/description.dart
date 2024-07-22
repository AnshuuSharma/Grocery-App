import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/Component/button.dart';
import 'package:shopping_app/entity/product.dart';
import 'package:shopping_app/pages/cart.dart';
import 'package:shopping_app/repository/productService.dart';
class Description extends StatelessWidget {
  var t,i,q,d,p,c;
   Description(var title,var image,var quantity,var disc,var price,var category){
     t=title;
     i=image;
     q=quantity;
     d=disc;
     p=price;
     c=category;
   }

  @override
  Widget build(BuildContext context) {
   var w=MediaQuery.of(context).size.width;
   var h=MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.square(40),
        child: AppBar(
          shape:RoundedRectangleBorder(),
          actions: [
            IconButton(onPressed: (){
              Navigator.pushNamed(context, '/cart');
            }, icon: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Icon(Icons.shopping_cart_outlined,size: 30,color: Colors.green,),
            ))
            ,],
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
            boxShadow: [BoxShadow(color: Colors.black54,blurRadius: 10)]
        ),
        child: BottomAppBar(
          child: Provider.of<ProductService>(context).isAdded(t)?
          buildButton(h, w, context,t):ElevatedButton(
              onPressed: (){
                Provider.of<ProductService>(context,listen: false).addItem(new Product(t, i, p.toString(), 1, q));
                // Navigator.push(context, MaterialPageRoute(builder: (context)=>Cart()));
              },
            style: TextButton.styleFrom(shape: RoundedRectangleBorder(),backgroundColor: Colors.green),
              child: Text('Add to Cart',style: TextStyle(color: Colors.white,fontSize: 22),),
            )
          ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(c,style: TextStyle(color: Colors.blue[800],fontWeight: FontWeight.bold),),
              Text(t+' : '+q,style: TextStyle(fontSize: 26,fontWeight: FontWeight.bold),),
              Image.network(i,width:w ,height: h*0.46),
              Text('Rs.${p.toString()}',style: TextStyle(fontSize: 21,color: Colors.deepOrange,fontWeight: FontWeight.bold),),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('(MRP inclusive of all taxes)'),
                  Container(
                    height: 40,
                    width: 100,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.green,width: 2)
                    ),
                    child: Center(child: Text(q,style: TextStyle(color: Colors.green[800],fontSize: 16),)),
                  )
                ],
              ),
              Divider(thickness: 2,),
              Text(d,style: TextStyle(fontSize: 15),)
            ],
          ),
        ),
      ),
    );
  }
}
