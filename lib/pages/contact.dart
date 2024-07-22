import 'package:flutter/material.dart';
import 'package:shopping_app/Component/appbar.dart';
class Contact extends StatelessWidget {
  const Contact({super.key});

  @override
  Widget build(BuildContext context) {
    var h=MediaQuery.of(context).size.height;
    return Scaffold(
      appBar:buildAppBar(context,''),
      body:Container(
        color: Colors.grey[200],
        padding: EdgeInsets.all(30),
        width: double.infinity,
        height:h*0.55,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Toll Free Number',style: TextStyle(
                fontSize: 28,
                color: Colors.blue[800],
                fontWeight: FontWeight.bold
            ),),
            Text('18000-75689'),
            Divider(thickness: 1,color: Colors.grey,),
            Text('Box Office',
              style: TextStyle(fontWeight:FontWeight.bold ,
              fontSize: 28,
                color: Colors.red
              ),),
            Text('afsdgbtrnnffgbrbbbr')
          ],
        ),
      )
    );
  }
}
