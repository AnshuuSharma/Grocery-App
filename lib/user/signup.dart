import '/user/login.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
class Signup extends StatelessWidget {
  Signup({super.key});
  var email,password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: PreferredSize(
        preferredSize: Size.square(170),
        child: AppBar(
          backgroundColor: Colors.green,
          bottom: PreferredSize(
            preferredSize: Size.square(50),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 50.0),
              child: Column(
                children: [
                  Text('Create Account!',style: TextStyle(fontSize: 32,color: Colors.white,fontWeight: FontWeight.bold),),
                ],
              ),
            ),
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        height: double.infinity,
        decoration: BoxDecoration(
            color: Colors.deepPurple[50],
            borderRadius: BorderRadius.only(topLeft: Radius.elliptical(60,50),topRight: Radius.elliptical(60,50))
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
              children:[
                Center(
                  child: Container(

                    width: 360,
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.only(top: 70,bottom: 10),
                    child: TextField(
                      onChanged: (value)=>email=value,
                      decoration: InputDecoration(hintText: 'Email'),),
                  ),
                ),
                Container(
                  width: 360,
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.only(bottom: 50,top: 10),
                  child: Center(
                    child: TextField(
                        obscureText: true,
                        onChanged: (value)=>password=value,
                        decoration: InputDecoration(hintText: 'Password')),
                  ),
                ),
                Container(
                  width: 360,
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.only(bottom: 50,top: 10),
                  child: Center(
                    child: TextField(
                        obscureText: true,
                        decoration: InputDecoration(hintText: 'Confirm Password')),
                  ),
                ),
                ElevatedButton(onPressed: (){
                  FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
                  Navigator.pushNamed(context, '/verify');
                  print("Account Created...");
                }, child: Text('SignUp',style: TextStyle(color: Colors.white,fontSize: 18),),
                  style: TextButton.styleFrom(backgroundColor: Colors.green[800],
                    padding: EdgeInsets.symmetric(horizontal: 50),
                  ),
                ),
              ]

          ),
        ),
      ),
    );
  }
}
