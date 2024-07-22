import 'verify.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shopping_app/user/checkout.dart';
import 'package:shopping_app/user/login.dart';
class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context,snapshot){
          if(snapshot.hasData){
            if(snapshot.data!.emailVerified){
              return Login();
            }
            else {
              return Verify();
            }
          }
          else{
            return Login();
          }
        },
      ),
    );
  }
}
