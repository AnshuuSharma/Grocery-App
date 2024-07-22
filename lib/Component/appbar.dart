import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/user/userprofile.dart';
import '../repository/productService.dart';
import 'package:badges/badges.dart' as badges;
PreferredSize buildAppBar(BuildContext context,String t) {
  return PreferredSize(
    preferredSize: Size.square(80),
    child: Padding(
      padding: const EdgeInsets.only(bottom:10.0),
      child: AppBar(
        elevation: 5,
        shadowColor: Colors.black,
        backgroundColor: Colors.white,
        title: Text(t),
        actions: [
          badges.Badge(
            badgeStyle: badges.BadgeStyle(badgeColor: Colors.orange,),
            badgeContent:Text(Provider.of<ProductService>(context,listen: false).getTotalLength().toString()),
            position:  badges.BadgePosition.topEnd(top:0,end:5),
            child: IconButton(onPressed: (){
              // Navigator.pushNamed(context,'/cart');
              Navigator.pushReplacementNamed(context, '/cart');
              },icon: Icon(Icons.shopping_cart_outlined,color: Colors.green,),),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: InkWell(
              onTap: (){Navigator.push(context,MaterialPageRoute(builder: (context)=>UpdateProfile()));},
              child: CircleAvatar(child: Icon(Icons.person_2_outlined,
                color: Colors.green,),backgroundColor: Colors.grey[300],radius: 15,),
            ),
          )


        ]),

      ),

  );
}