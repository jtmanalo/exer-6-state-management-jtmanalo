// import 'package:flutter/material.dart';
// import 'package:manalo_exer6/screen/MyCart.dart';
// import 'package:manalo_exer6/screen/MyCatalog.dart';
// import 'package:provider/provider.dart';
// import 'provider/shoppingcart_provider.dart';

// void main() {
//   runApp(MultiProvider(providers: [
//     ChangeNotifierProvider(create: (context) => ShoppingCart()),
//   ], child: const MyApp()));
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       initialRoute: "/",
//       routes: {
//         "/cart": (context) => const MyCart(),
//         "/products": (context) => const MyCatalog(),
//       },
//       home: const MyCatalog(),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:manalo_exer6/screen/MyCart.dart';
import 'package:manalo_exer6/screen/MyCatalog.dart';
import 'package:manalo_exer6/screen/Checkout.dart'; // Import CheckoutPage
import 'package:provider/provider.dart';
import 'provider/shoppingcart_provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => ShoppingCart()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: "/",
      routes: {
        "/": (context) => const MyCatalog(),
        "/cart": (context) => const MyCart(),
        "/checkout": (context) => const Checkout(), // Add CheckoutPage route
      },
    );
  }
}