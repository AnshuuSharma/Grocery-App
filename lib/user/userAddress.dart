import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/user/addressBook.dart';

import '../repository/productService.dart';
class Address extends StatelessWidget {
   Address({super.key});
  var data={};

TextEditingController t1=new TextEditingController();

TextEditingController t2=new TextEditingController();

TextEditingController t3=new TextEditingController();

TextEditingController t4=new TextEditingController();

TextEditingController t5=new TextEditingController();

TextEditingController t6=new TextEditingController();

TextEditingController t7=new TextEditingController();

final _mybox=Hive.box('addressBox');

void write(){
  data={
    "name":t1.text,
    "pin":t2.text,
    "locality":t3.text,
    "flate":t4.text,
    "Area":t5.text,
    "city":t6.text,
    "no.":t7.text,
  };
_mybox.put(1,data);
}

@override


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
        title: Text('Add Address',style: TextStyle(color: Colors.white),),
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
           Container(
             height: h*0.09,
             width: w*0.85,
             margin: EdgeInsets.all(20),
             child:ElevatedButton(onPressed: (){
               write();
               Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>AddressBook(data)));
                          }, child: Text('Save to Address Book',style: TextStyle(color: Colors.white,
                          fontSize: 20
                          ),),
                          style: TextButton.styleFrom(backgroundColor: Colors.green,shape: RoundedRectangleBorder()),
                          )
           ),
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
