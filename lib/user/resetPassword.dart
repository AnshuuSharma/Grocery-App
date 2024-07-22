import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shopping_app/user/wrapper.dart';
class ResetPassword extends StatelessWidget {
   ResetPassword({super.key});
var email;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextField(
              onChanged: (value)=>email=value,
              decoration:InputDecoration(
                hintText: "Email"
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: ElevatedButton(onPressed: ()async{
              await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
              Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>Wrapper()));
            }, child: Text('Reset Password',style: TextStyle(color: Colors.white),),
            style: TextButton.styleFrom(backgroundColor: Colors.green),
            ),
          )
        ],
      ),
    );
  }
}
