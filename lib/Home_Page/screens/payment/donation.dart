import 'package:flutter/material.dart';
// import 'package:stripe_payment/stripe_payment.dart';

import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:register/Home_Page/screens/payment/Pay_home_page.dart';

class DonationPage extends StatefulWidget {
  @override
  _DonationPageState createState() => _DonationPageState();
}

class _DonationPageState extends State<DonationPage> {
  @override
  Widget build(BuildContext context) {
    Stripe.publishableKey =
        'pk_test_51LGrTmIhZd85V5mFtrGJ0G6GWwscO3mtJFdMk8OFODFhjfKTWplRJfFWEvYvvwb3cqjFyeutqmKXSDjKlU1Kj2RT009FOjPIwb'; // Replace with your publishable key

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color.fromARGB(255, 1, 39, 97),
      ),
      home: PayHomePage(),
    );
  }
}

// void main() {
//   WidgetsFlutterBinding.ensureInitialized();
//   Stripe.publishableKey =
//       'pk_test_51LGrTmIhZd85V5mFtrGJ0G6GWwscO3mtJFdMk8OFODFhjfKTWplRJfFWEvYvvwb3cqjFyeutqmKXSDjKlU1Kj2RT009FOjPIwb'; // Replace with your publishable key
//   runApp(GetMaterialApp(
//     initialRoute: '/',
//     //fade in transition
//     transitionDuration: const Duration(milliseconds: 500),
//     defaultTransition: Transition.fadeIn,
//     getPages: [
//       GetPage(
//         name: '/',
//         page: () => PayHomePage(),
//       ),
//     ],
//   ));
// }
