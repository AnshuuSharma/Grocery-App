import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:shopping_app/Component/drawer.dart';
import 'package:shopping_app/entity/product.dart';
import 'package:shopping_app/pages/items.dart';
import '../Component/button.dart';
import '../Component/description.dart';
import '/data/productData.dart';
import 'dart:math';
import 'package:provider/provider.dart';
import 'package:shopping_app/repository/productService.dart';
class HomePage extends StatefulWidget {
   HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List imgCat=['https://img.pikbest.com/origin/09/29/80/34HpIkbEsT7Uc.png!sw800','https://us.123rf.com/450wm/svetlanab/svetlanab2305/svetlanab230500008/204110020-bag-of-flour-and-ears-of-wheat-vector-illustration.jpg?ver=6',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRhGXpzer5zQo7SK49I7lUvS1nGcW9Z5pnIXd7gOaclDpULrkxJlTQ8WXt4PFbV4X-o78I&usqp=CAU',
    'https://us.123rf.com/450wm/jemastock/jemastock2305/jemastock230503083/205701015-organic-beans-heap-fresh-and-healthy.jpg?ver=6',
    'https://media.istockphoto.com/id/1322991699/vector/vector-illustration-of-craft-package-with-coffee-a-cup-of-coffee-and-coffee-beans-isolated.jpg?s=612x612&w=0&k=20&c=6eIT8y2XkyJvqnENlkAmk2qBOSdV5T08faYOlFPWkSs=',
    'https://us.123rf.com/450wm/djvstock/djvstock1801/djvstock180101005/92591413-tea-bag-and-cup-icon-vector-illustration-graphic-design.jpg?ver=6','https://i.pinimg.com/736x/f2/6b/3a/f26b3acc69bc7ef0796d8aaaf709b24e.jpg',
    'https://static.vecteezy.com/system/resources/previews/026/826/261/non_2x/instant-coffee-soluble-cartoon-illustration-vector.jpg',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT_Mv2cNnjbUyXmwuOto2sCFlUH8gWsnFVaLmPtkYuI1TSggz8X2kPTBQctL_y0s5wgywY&usqp=CAU',

    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRclLYnrUYSWOGvyeWOr5kuEnyFrNAppuWuwGWPcg8TIHvDYMcriunktp-HS3ZYA0UiEeU&usqp=CAU'];
  var obj;
  @override
  void initState() {
    obj={...product};
    super.initState();
  }
  void extractData(int index){
    List data=obj.values.elementAt(index);
    Navigator.push(context, MaterialPageRoute(builder: (context)=>Items(data)));
  }
  var title,img,price,desc,quantity;
   extractItem(){
  int random(int min,int max){
    return min+Random().nextInt(max-min);
  }
  List item=obj.values.elementAt(random(0, 10));
   var rd=random(0, 10);
  title=item[rd].values.elementAt(1);
  img=item[rd].values.elementAt(2);
  price=item[rd].values.elementAt(3);
  desc=item[rd].values.elementAt(6);
  quantity=item[rd].values.elementAt(5);
}

@override
  Widget build(BuildContext context) {
   var w= MediaQuery.of(context).size.width;
   var h=MediaQuery.of(context).size.height;
    return Scaffold(
      drawer: newDrawer(),
      appBar: PreferredSize(
        preferredSize: Size.square(h*0.15),
        child: AppBar(
        elevation: 1,
          shadowColor: Colors.black,
          backgroundColor: Colors.white,
          title: Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcROsRyFSkqMS_Eyf0JmPbt9EFTzqgOBlHhwXyS9CNLBig&s',height: 140,width: 120,),
          actions: [
            IconButton(onPressed: (){
              Navigator.pushNamed(context, '/cart');
            }, icon: Icon(Icons.shopping_cart_outlined,size: 28,color: Colors.green,))
            ,],
          bottom: PreferredSize(
            preferredSize: const Size.square(5),
            child: Container(
              height:h*0.08,
              padding: EdgeInsets.all(10),
              child: const TextField(decoration: InputDecoration(
                labelText: 'Search',
                border: OutlineInputBorder(
                  borderSide: BorderSide(width: 1,color: Colors.black26)
                ),
                prefixIcon: Icon(Icons.search),),

              ),
            ),
          ),
        ),
      ),

      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
           children: [

             Container(
               child: Column(
                 children: [

                   Container(
                     width:w,
                     height:h*0.08,
                     color: Colors.green[50],
                     child: Row(
                       children: [
                         Container(
                           height: h*0.088,
                           width:w*0.3,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topRight:Radius.circular(20)
                            )
                          ),

                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                            Icon(Icons.location_history),Text('Bhopal',
                            )],
                          ),
                                                  ),
                         Flexible(
                           child: Padding(
                             padding: const EdgeInsets.all(10.0),
                             child: Text('Get upto 60% off on orders above Rs.1200 ',style:TextStyle(
                               color: Colors.green.shade800,
                               fontWeight: FontWeight.bold,
                             )
                             ),
                           ),
                         ),
                       ],
                     ),
                   ),

                 ],
               ),
             ),
             CarouselSlider(
                 items: [
             Container(
               width: w,
               height: h*0.24,
               decoration: const BoxDecoration(
                 color: Colors.orange,
               ),
               child: Image.network('https://st2.depositphotos.com/7341970/11081/v/950/depositphotos_110819108-stock-illustration-grocery-shopping-discount-banner.jpg',width:w*1,height: 200,fit: BoxFit.fill,),
             ),
             Container(
              width: w,
              height: h*0.24,
              decoration: const BoxDecoration(
              color: Colors.orange,
                     ),
                     child: Image.network('https://images-eu.ssl-images-amazon.com/images/G/39/grocery/SSW2022/FEB/AE_MH_CN_DailyEssentials_En_1242x450.jpg',width:w*1,height: 200,fit: BoxFit.fill,),
                   ),
             Container(
              width: w,
              height: h*0.24,
              decoration: const BoxDecoration(
              color: Colors.orange,
                     ),
                     child: Image.network('https://st5.depositphotos.com/1258191/62472/i/450/depositphotos_624725180-stock-photo-online-grocery-shopping-app-banner.jpg',width:w*1,height: 200,fit: BoxFit.fill,),
                   ),
                 ],
                 options:  CarouselOptions(
                   height:h*0.24,
                   enlargeCenterPage: false,
                   autoPlay: true,
                   aspectRatio: 16 / 9,
                   autoPlayCurve: Curves.fastOutSlowIn,
                   enableInfiniteScroll: true,
                   autoPlayAnimationDuration: Duration(milliseconds: 800),
                   viewportFraction: 1,

                 ),),
             Container(
               height: h*0.3,
               decoration: const BoxDecoration(
                   border: Border.symmetric(
                       horizontal: BorderSide(
                           color: Colors.black26,
                           width:1,
                           style: BorderStyle.solid
                       )
                   )
               ),
               child: Column(
                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Text('  Popular Categories',style: TextStyle(
                     fontSize: 18
                   ),),
                   SingleChildScrollView(
                     child: Row(
                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                       children: [
                         SizedBox(
                           width: w,
                           height: h*0.18,
                           child: ListView.builder(
                             scrollDirection: Axis.horizontal,
                               itemCount:obj.length,
                               itemBuilder: (context,index)=>InkWell(
                                 onTap:()=> extractData(index),
                                   child: category(h, w,index,imgCat[index])),),
                         )
                       ],
                     ),
                   ),
                 ],
               ),
             ),
             Container(
               width: w,
               height: h*0.25,
               decoration: const BoxDecoration(
                 borderRadius: BorderRadius.all(Radius.circular(20))
               ),
               child: Image.network('https://d39vol41m7feya.cloudfront.net/1629253160-banner1.jfif',width:w*0.9,height:h*0.13,fit: BoxFit.fill,),
             ),
             SingleChildScrollView(
               scrollDirection: Axis.vertical,
               child: Container(
                 padding: EdgeInsets.only(top:20,bottom: 20),
                 child: Column(
                   mainAxisAlignment: MainAxisAlignment.spaceAround,
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     Padding(
                       padding: const EdgeInsets.all(20.0),
                       child: Text(' Basket Must Haves',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                     ),
                     buildRow(h, w),
                     buildRow(h, w),
                     buildRow(h, w),
                     buildRow(h, w),
                     buildRow(h, w),
                     buildRow(h, w),
                   ],
                 ),
               ),
             ),

           ],
        ),
      ),
    );
  }

Row buildRow(double h, double w) {
     extractItem();
  return Row(
                   mainAxisAlignment: MainAxisAlignment.spaceAround,
                   children: [
                     listItems(h, w,img,title,price),
                     listItems(h, w,img,title,price)
                   ],
                 );
}

  Widget listItems(double h, double w,String img,String title,double price) {
     extractItem();
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>Description(title,img,quantity,desc,price,'')));
      },
      child: Container(margin: EdgeInsets.only(bottom: 20),
                         padding: EdgeInsets.all(10),
                         height: h*0.32,
                         width: w*0.42,
                         decoration: BoxDecoration(
                             shape: BoxShape.rectangle,
                             border: Border.all(width: 1,color: Colors.black54),
                             borderRadius: BorderRadius.circular(6),
                         ),
                         child: Column(
                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                           crossAxisAlignment: CrossAxisAlignment.center,
                           children: [
                             Container(
                               height: h*0.12,
                               width: w*2,

                               child: Image.network(img),
                             ),
                              Flexible(child: Text(title,style:TextStyle(fontWeight: FontWeight.w600) ,)),
                              Text('Rs.'+price.toString()),
                             (Provider.of<ProductService>(context,listen: false).isAdded(title))?
                             buildButton(h, w, context, title)
                             :
                             ElevatedButton(onPressed: (){
                             Provider.of<ProductService>(context,listen: false).addItem(
                               new Product(title, img, price.toString(), 1, quantity)
                             );
                             ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text('Product Added suffesfully')));
                             },
                             style: TextButton.styleFrom(backgroundColor: Colors.green,
                                 shape:RoundedRectangleBorder(
                               borderRadius: BorderRadius.circular(6)
                             )), child:SizedBox(
                               width: w*0.17,
                               child: const Row(
                                 mainAxisAlignment: MainAxisAlignment.center,
                                 children: [
                                 Icon(Icons.shopping_cart_outlined,color: Colors.white,),
                                 Text(' Add',style: TextStyle(color: Colors.white),)
                               ],),
                             ),
                             )
                           ],
                         ),
                       ),
    );
  }

  Container category(double h, double w,int index,String img) {
    return Container(
                     margin: EdgeInsets.only(left:5,right:5),
                     height: h*0.12,
                     width: w*0.215,

      child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 5),
                height: h*0.11,
                width: w*0.25,
                decoration: BoxDecoration(
                    border: Border.all(
                      width: 1,
                      color: Colors.black12,
                    ),
                  borderRadius: BorderRadius.circular(6)
                ),
                child: Image.network(img,width: w*2,height: h*0.07,),
              ),
              Text(obj.keys.elementAt(index))
            ],
          )),
                   );
  }
}
