import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/user/orderplaced.dart';
import '../repository/productService.dart';
class PlaceOrder extends StatefulWidget {
  PlaceOrder();
  @override
  State<PlaceOrder> createState() => _AddressState();
}

class _AddressState extends State<PlaceOrder> {
  var data={};
  TextEditingController t1=new TextEditingController();

  TextEditingController t2=new TextEditingController();

  TextEditingController t3=new TextEditingController();

  TextEditingController t4=new TextEditingController();

  TextEditingController t5=new TextEditingController();

  TextEditingController t6=new TextEditingController();

  TextEditingController t7=new TextEditingController();

  final _mybox=Hive.box('addressBox');

  @override
  void initState() {
    super.initState();
    if(_mybox.isNotEmpty){
      t1.text=_mybox.get(1).values.elementAt(0);
      t2.text=_mybox.get(1).values.elementAt(1);
      t3.text=_mybox.get(1).values.elementAt(2);
      t4.text=_mybox.get(1).values.elementAt(3);
      t5.text=_mybox.get(1).values.elementAt(4);
      t6.text=_mybox.get(1).values.elementAt(5);
      t7.text=_mybox.get(1).values.elementAt(6);
    }

  }

  @override
  Widget build(BuildContext context) {
    var w=MediaQuery.of(context).size.width;
    var h=MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.green,
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        },icon: Icon(Icons.arrow_back_ios,color: Colors.white,),),
        title: Text('Place Order',style: TextStyle(color: Colors.white),),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            buildTextField('Name',t1),
            buildTextField('Pincode',t2),
            buildTextField('Locality/Street Name/Apartment',t3),
            buildTextField('Wing/Floor/Flat/House No.',t4),
            buildTextField('Area',t5),
            buildTextField('City',t6),
            buildTextField('Contact Number for Order Delivery',t7),
            // Center(
            //   child: ElevatedButton(
            //     onPressed: initiateTransaction,
            //     child: Text('Pay with UPI'),
            //   ),
            // ),
            Container(
                height: h*0.09,
                width: w*0.85,
                margin: EdgeInsets.all(20),

                child:Consumer<ProductService>(

                    builder: ( context, service, _)=> ElevatedButton(onPressed: (){
                      var db=FirebaseFirestore.instance.collection(DateTime.now().toString());

                       for(int i=0;i<service.getLength();i++){
                       db.add(service.getItem(i).getProduct());
                      }
                      db.doc("delivery").set({
                        "pin":t2.text,
                        "locality":t3.text,
                        "flat/house no.":t4.text,
                        "Area":t5.text,
                        "city":t6.text,
                        "contact":t7.text
                      });
                      Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>OrderPlaced()));
                    }, child: Text('Buy Now',style: TextStyle(color: Colors.white,
                        fontSize: 20
                    ),),
                      style: TextButton.styleFrom(backgroundColor: Colors.green,shape: RoundedRectangleBorder()),
                    )
                )
            )
          ],

        ),
      ),
    );
  }

  Widget buildTextField(String l,var t) {
    return Container(
        margin: EdgeInsets.only(top: 30,left: 20,right: 20),
        child:TextField(
          controller: t,
          decoration: InputDecoration(
              label: Text(l,style: TextStyle(color: Colors.grey),),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),

              )
          ),
        )
    );
  }
}
