import 'package:flutter/material.dart';

import '../Component/appbar.dart';
class PickUp extends StatelessWidget {
   PickUp({super.key});
// List place={''}
  @override
  Widget build(BuildContext context) {
    var h=MediaQuery.of(context).size.height;
    var w=MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.deepPurple[50],
      appBar: buildAppBar(context,'Pick Up Point List'),
      body: ListView(
        children: [
          for(int i=0;i<10;i++)
            buildRow(w,h),
        ],
      ),
    );
  }

  Widget buildRow(var w,var h) {
    return  Row(
      children: [
        buildContainer(h, w),
        buildContainer(h, w),
      ],
       );
  }

  Container buildContainer(h, w) {
    return Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.all(10),
        height: h*0.25,
        width: w*0.43,
        decoration: BoxDecoration(
          color: Colors.white,
            border: Border.all(width:1,color: Colors.black12),
          borderRadius: BorderRadius.all(Radius.circular(6))
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(backgroundColor: Colors.green,radius: 25,child: Icon(Icons.location_on,
              color: Colors.white,size: 30,),),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text('Bhopal , Madhya Pradesh',style: TextStyle(
                fontSize: 16,
              ),),
            )
          ],
        ),
      );
  }
}
