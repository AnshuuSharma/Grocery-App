import 'package:flutter/material.dart';
import 'package:shopping_app/Component/appbar.dart';
import 'package:shopping_app/data/productData.dart';
import 'homePage.dart';
import 'items.dart';
class Categories extends StatefulWidget {
  Categories({super.key});

  @override

  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  List imgCat=['https://img.pikbest.com/origin/09/29/80/34HpIkbEsT7Uc.png!sw800','https://us.123rf.com/450wm/svetlanab/svetlanab2305/svetlanab230500008/204110020-bag-of-flour-and-ears-of-wheat-vector-illustration.jpg?ver=6',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRhGXpzer5zQo7SK49I7lUvS1nGcW9Z5pnIXd7gOaclDpULrkxJlTQ8WXt4PFbV4X-o78I&usqp=CAU',
    'https://us.123rf.com/450wm/jemastock/jemastock2305/jemastock230503083/205701015-organic-beans-heap-fresh-and-healthy.jpg?ver=6',
    'https://media.istockphoto.com/id/1322991699/vector/vector-illustration-of-craft-package-with-coffee-a-cup-of-coffee-and-coffee-beans-isolated.jpg?s=612x612&w=0&k=20&c=6eIT8y2XkyJvqnENlkAmk2qBOSdV5T08faYOlFPWkSs=',
    'https://us.123rf.com/450wm/djvstock/djvstock1801/djvstock180101005/92591413-tea-bag-and-cup-icon-vector-illustration-graphic-design.jpg?ver=6','https://i.pinimg.com/736x/f2/6b/3a/f26b3acc69bc7ef0796d8aaaf709b24e.jpg',
    'https://static.vecteezy.com/system/resources/previews/026/826/261/non_2x/instant-coffee-soluble-cartoon-illustration-vector.jpg',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT_Mv2cNnjbUyXmwuOto2sCFlUH8gWsnFVaLmPtkYuI1TSggz8X2kPTBQctL_y0s5wgywY&usqp=CAU',

    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRclLYnrUYSWOGvyeWOr5kuEnyFrNAppuWuwGWPcg8TIHvDYMcriunktp-HS3ZYA0UiEeU&usqp=CAU'];
  var productCat={};
  @override
  void initState() {
  productCat=product;
  }
  void extractData(int index){
    List data=productCat.values.elementAt(index);
    Navigator.push(context, MaterialPageRoute(builder: (context)=>Items(data)));
  }
  @override
  Widget build(BuildContext context) {
    var h=MediaQuery.of(context).size.height;
    var w=MediaQuery.of(context).size.width;
    return Scaffold(
    backgroundColor: Colors.deepPurple[50],
    appBar:buildAppBar(context, 'Categories'),
    body:GridView.builder(
      scrollDirection: Axis.vertical,
      itemCount:productCat.length,
      itemBuilder: (context,index)=>InkWell(
          onTap:()=> extractData(index),
          child: category(h, w,index,imgCat[index])), gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
    ),),
    );
  }

  Widget category(double h, double w,int index,String img) {
    return Container(
      margin: EdgeInsets.only(left: 5,right: 5,bottom: 10,top: 5),
      height: h*0.4,
      decoration: BoxDecoration(
        color: Colors.white,
          border: Border.all(
              width: 1,color: Colors.black12
          ),
          borderRadius: BorderRadius.circular(6)
      ),
      child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 5),
                height: h*0.23,
                width: w*0.4,
                decoration: BoxDecoration(
                    border: Border(
                      bottom:BorderSide(width: 1,color: Colors.black12)
                    ),
                    borderRadius: BorderRadius.circular(6)
                ),
                child: SizedBox(
                    width: w*2,height: h*0.07,
                    child: Image.network(img,fit: BoxFit.cover,)),
              ),
              Text(productCat.keys.elementAt(index),style: TextStyle(
                  fontWeight: FontWeight.bold
              ),)
            ],
          )),
    );
  }


}
