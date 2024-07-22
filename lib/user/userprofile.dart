
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:convert';
import '../Component/appbar.dart';
class UpdateProfile extends StatefulWidget{
  UpdateProfile({super.key});

  @override
  State<UpdateProfile> createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  var name,email,password,contact;

  TextEditingController t1=new TextEditingController();

  TextEditingController t2=new TextEditingController();

  TextEditingController t3=new TextEditingController();

  TextEditingController t4=new TextEditingController();


  var user,src;

  @override
  void initState()  {
    user=FirebaseAuth.instance.currentUser;
    t1.text=user.displayName!=null?user.displayName:"";
    t2.text=user.email!=null?user.email:"";
  }
  void update(){
    FirebaseAuth.instance.currentUser!.updateDisplayName(t1.text);
    if(t3.text==t4.text)
    {
      FirebaseAuth.instance.currentUser!.updatePassword(t4.text);
    }
    else
    {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Password Mismatched")));
      t3.text='';
      t4.text='';
    }
    // FirebaseAuth.instance.currentUser!.updatePhoneNumber(t2.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context,'Update Profile'),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [

            buildContainer(name,'Name',t1),
            buildContainer(email,'Email',t2),
            buildContainer(context,'New Password',t3),
            buildContainer(context,'Confirm Password',t4),
            ElevatedButton(onPressed: (){update();}, child:Text('Save',style:
            TextStyle(color: Colors.white),),
               style:ElevatedButton.styleFrom(backgroundColor: Colors.green),
            )
          ],
        ),
      ),
    );
  }

  Container buildContainer(var v,String l,var t) {
    return Container(
        margin: EdgeInsets.only(top: 20,left: 20,right: 20),
        child: TextField(
          controller: t,
          onChanged:(value){v=value;} ,
          decoration: InputDecoration(
              label: Text(l,style: TextStyle(color: Colors.grey),)
          ),
        ));
  }
}
