import 'package:flutter/material.dart';

//user screens
// import 'package:jk_jewallary_project/authentication/loginscreen.dart';
// import 'package:jk_jewallary_project/authentication/registerscreen.dart';
// import 'package:jk_jewallary_project/authentication/forgotPasswordScreen.dart';
// import 'package:jk_jewallary_project/authentication/otpscreen.dart';
// import 'package:jk_jewallary_project/screens/tearmscreen.dart';
// import 'package:jk_jewallary_project/screens/homescreen.dart';
// import 'package:jk_jewallary_project/screens/jewelleryscreen.dart';
// import 'package:jk_jewallary_project/screens/searchfilterscreen.dart';
// import 'package:jk_jewallary_project/screens/productdetailsscreen.dart';
// import 'package:jk_jewallary_project/screens/checkoutscreen.dart';
// import 'package:jk_jewallary_project/screens/paymentscreen.dart';
// import 'package:jk_jewallary_project/screens/orderhistoryscreen.dart';
// import 'package:jk_jewallary_project/screens/profilescreen.dart';

// admin screens
// import 'package:jk_jewallary_project/admin_screen/admin_dashboard_screen.dart';
// import 'package:jk_jewallary_project/admin_screen/admin_products_screen.dart';
// import 'package:jk_jewallary_project/admin_screen/add_product_screen.dart';
// import 'package:jk_jewallary_project/admin_screen/edit_product_screen.dart';
import 'package:jk_jewallary_project/admin_screen/delete_product_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const DeleteProductScreen(),
    );
  }
}
