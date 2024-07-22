import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shopping_app/user/checkout.dart';
class Login extends StatelessWidget {
  Login({super.key});
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
                  Text('Welcome Back!',style: TextStyle(fontSize: 32,color: Colors.white,fontWeight: FontWeight.bold),),
                  Text('enter your email and password',style: TextStyle(color: Colors.white),)
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
            borderRadius: BorderRadius.only(topLeft: Radius.elliptical(50,50),topRight: Radius.elliptical(60,50))
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [

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
              SizedBox(
                width: 170,
                height: 50,
                child: ElevatedButton(onPressed: () async{
                  try
                  {
                    UserCredential user = await FirebaseAuth.instance
                        .signInWithEmailAndPassword(
                        email: email, password: password);
                    print(user.user!.email);
                    Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>Checkout()));
                  }
                  catch(error)
                  {
                    print("Incorrect combination of  username and password");
                  }
                }, child: Text('Login',style: TextStyle(color: Colors.white,fontSize: 18),),
                  style: TextButton.styleFrom(backgroundColor: Colors.green[800],
                    padding: EdgeInsets.symmetric(horizontal: 50),
                  ),
                ),
              ),
              InkWell(
                  onTap:(){ Navigator.pushNamed(context, '/signup');},
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text('Do not have an account? signup',style: TextStyle(color: Colors.green[800]),),
                  )),
              InkWell(
                  onTap:(){ Navigator.pushNamed(context, '/resetpassword');},
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text('Forgot password?',style: TextStyle(color: Colors.green[800]),),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
