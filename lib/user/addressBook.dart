
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:shopping_app/Component/appbar.dart';
import 'package:shopping_app/user/userAddress.dart';
class AddressBook extends StatelessWidget {
  var data={};
  final _mybox=Hive.box('addressBox');
   AddressBook(var value){
     data=value;
   }

  @override
  Widget build(BuildContext context) {
     var w=MediaQuery.of(context).size.width;
     var h=MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar:buildAppBar(context, ''),
      body: ListView(
        children: [
          (data.isNotEmpty)?
            buildColumn(context,w):
          Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Center(
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
            color: Colors.white,
            child: Center(child: Text('Add New Addresss')),
            ),
            )
            ),
          ),
          )
        ],
      ),
    );
  }

  Column buildColumn(BuildContext context,double w) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  width: w,
                  color: Colors.white,
                  padding: EdgeInsets.only(left: 20,bottom: 10,top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(data.values.elementAtOrNull(0),style: TextStyle(fontSize:20,fontWeight: FontWeight.bold),),
                      IconButton(onPressed: (){
                        _mybox.delete(1);
                      }, icon:Icon(Icons.delete,color: Colors.green,))
                    ],
                  )),
              buildContainer(w,data.values.elementAtOrNull(3)),
              buildContainer(w,data.values.elementAtOrNull(2)),
              buildContainer(w,data.values.elementAtOrNull(4)+', '+data.values.elementAtOrNull(5)+' - '+data.values.elementAtOrNull(1)),
              buildContainer(w,'Mob no: '+data.values.elementAtOrNull(6)),
              Container(
                width: w,
                color: Colors.white,
                padding: EdgeInsets.all(15),
                child: Divider(thickness: 1,color: Colors.black26,),
              ),
              Container(
                width: w,
                color: Colors.white,
                padding: EdgeInsets.only(bottom: 15),
                child: InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Address()));
                    },
                    child: Center(child: Text('Edit',style: TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold
                    ),))),
              ),
            ],
          );
  }

  Container buildContainer(double w,t) {
    return Container(
              width: w,
              color: Colors.white,
              padding: EdgeInsets.only(left: 20),
              child: Text(t,style: TextStyle(fontSize:17),));
  }
}
