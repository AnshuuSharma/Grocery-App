import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'wrapper.dart';
class Verify extends StatelessWidget {
  Verify({super.key});

  @override
  Widget build(BuildContext context) {
    void verifyAccount() async {
      await FirebaseAuth.instance.currentUser!.sendEmailVerification().then((
          value) =>
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text("Email Verification mail has been sent"))));
    }
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          FirebaseAuth.instance.currentUser!.reload();
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => Wrapper(),));
        },
        child: Icon(Icons.refresh),
      ),
      body: Column(
        children: [
          Text('verification is pending'),
          ElevatedButton(onPressed: () {
            verifyAccount();
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content:Text('Email verification mail sent successfully ')));
          }, child:Text('verify email'))
        ],
      ),
    );
  }
}
