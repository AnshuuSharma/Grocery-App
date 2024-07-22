import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:convert';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:shopping_app/pages/category.dart';
import 'package:shopping_app/pages/contact.dart';
import '../user/userprofile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
class newDrawer extends StatefulWidget {
   newDrawer({
    super.key,
  });

  @override
  State<newDrawer> createState() => _newDrawerState();
}

class _newDrawerState extends State<newDrawer> {
   var user,src;

   XFile?img;
   var imgUrl=null;
   void capture() async{
     ImagePicker imagePicker=new ImagePicker();
     img=await imagePicker.pickImage(source: ImageSource.camera);
     await FirebaseStorage.instance.ref().child(FirebaseAuth.instance.currentUser!.email.toString()).child(img!.name).putFile(File(img!.path));
     if(imgUrl!=null){
       FirebaseStorage.instance.refFromURL(imgUrl).delete();
     }
     getImage();
   }

   void gallery()async{
     ImagePicker imagePicker=new ImagePicker();
     img=await imagePicker.pickImage(source: ImageSource.gallery);
     await FirebaseStorage.instance.ref().child(FirebaseAuth.instance.currentUser!.email.toString()).child(img!.name).putFile(File(img!.path));
     if(imgUrl!=null){
       FirebaseStorage.instance.refFromURL(imgUrl).delete();
     }
     getImage();
   }
   Future<void> getImage() async
   {
     try {
       var data = await FirebaseStorage.instance.ref().child(FirebaseAuth.instance.currentUser!.email.toString());
       final listResult = await data.listAll();
       var temp=listResult.items.last;
       temp.getDownloadURL().then((value){
         setState(() {
           imgUrl=value;
         });
       }
       );
     }
     catch(error)
     {
       print(error);
     }
   }

   @override
  String getName() {
    user=FirebaseAuth.instance.currentUser;
    var t1=user.displayName!=null?user.displayName:"";
    return t1;
  }

   @override
  void initState() {
   getImage();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        padding: const EdgeInsets.only(top: 50,left: 10,right: 10),
        child:  Column(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.only(bottom: 20),
              height: 170,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    onTap: (){
                      showModalBottomSheet(
                          context: context,
                          builder: (builder){
                            return Container(
                              padding: EdgeInsets.all(50),
                              width:MediaQuery.of(context).size.width ,
                              height:MediaQuery.of(context).size.height*0.3,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Row(
                                    children: [
                                      Icon(Icons.camera_alt,),
                                      InkWell(
                                          onTap: (){
                                            capture();
                                            },
                                          child: Text(' Take a photo',style: TextStyle(
                                              fontSize:18 ),))
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Icon(Icons.photo),
                                      InkWell(
                                          onTap:(){gallery();},
                                          child: Text('  Upload from gallery',style: TextStyle(
                                              fontSize:18 )))
                                    ],
                                  ),
                                ],
                              ),
                            );
                          });
                    },
                      child:(imgUrl==null)?CircleAvatar(child:Icon(Icons.account_circle,size: 60,),radius: 60,):CircleAvatar(
                        backgroundImage: NetworkImage(imgUrl),radius: 60,
                      )
                  ),
                  InkWell(
                    onTap: (){
                   Navigator.push(context, MaterialPageRoute(builder: (context)=>UpdateProfile()));
                    },
                    child: Text('Update Profile',style: TextStyle(
                        color: Colors.green[900],
                      fontSize: 16,
                      fontWeight: FontWeight.bold
                    ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                border: Border(bottom:BorderSide(color: Colors.black54))
              ),
              child: ListTile(
                title: (getName().isNotEmpty)? Text(' Hi, ${getName()}',style: TextStyle(
                      fontSize: 18
                  ),):Text('Hi'),
              ),
            ),
            InkWell(
              onTap: (){
                Navigator.push(context,MaterialPageRoute(builder:(context)=>Categories()));
              },
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.green,
                ),
                child: const ListTile(
                  leading: Icon(Icons.category_outlined,color: Colors.white,),
                  title: Text('SHOP BY CATEGORY',style: TextStyle(color: Colors.white),),
                  trailing: Icon(Icons.arrow_forward_ios,color: Colors.white,),
                ),
              ),
            ),
            InkWell(
              onTap: (){Navigator.pushNamed(context,'/pickup');},
              child: buildContainer(Icons.warehouse_outlined,'Pick Up Point List'),
            ),
            InkWell(
                onTap: (){
                  Navigator.push(context,MaterialPageRoute(builder: (context)=>Contact()));
                },
                child: buildContainer(Icons.call, 'Contact us'))
          ],
        ),
      ),
    );
  }

  Container buildContainer(IconData icon,String t) {
    return Container(
              decoration: const BoxDecoration(
                  border: Border(bottom:BorderSide(color: Colors.black54))
              ),
              child: ListTile(
                leading: Icon(icon,color: Colors.green,),
                title: Text(t),
              ),
            );
  }
}
