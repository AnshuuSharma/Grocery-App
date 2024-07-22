import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/data/productData.dart';
import 'package:shopping_app/pages/items.dart';
import 'package:shopping_app/pages/pickUp.dart';
import 'package:shopping_app/repository/productService.dart';
import 'package:shopping_app/user/login.dart';
import 'package:shopping_app/user/orderplaced.dart';
import 'package:shopping_app/user/resetPassword.dart';
import 'package:shopping_app/user/userAddress.dart';
import 'package:shopping_app/user/verify.dart';
import 'package:shopping_app/user/wrapper.dart';
import 'pages/homePage.dart';
import '/pages/cart.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import '/user/signup.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(ChangeNotifierProvider(
    create: (_) => ProductService(),
    child: MyApp(),
  ));
  await Hive.initFlutter();
  var box = await Hive.openBox('addressBox');
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(routes: {
      '/cart': (context) => Cart(),
      '/homepage': (context) => HomePage(),
      '/wrapper': (context) => Wrapper(),
      '/signup': (context) => Signup(),
      '/login': (context) => Login(),
      '/useraddress': (context) => Address(),
      '/orderplaced': (context) => OrderPlaced(),
      '/resetpassword': (context) => ResetPassword(),
      '/pickup': (context) => PickUp(),
      '/verify': (context) => Verify()
    }, debugShowCheckedModeBanner: false, home: HomePage());
  }
}
git remote add origin https://github.com/AnshuuSharma/Grocery-App.git
