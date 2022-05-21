import 'package:demp_app/provider/cart.provider.dart';
import 'package:demp_app/provider/orders.dart';
import 'package:demp_app/provider/product_providers.dart';
import 'package:flutter/material.dart';
import '../screens/product_detail_screen.dart';
import '../screens/product_overview_screen.dart';
import 'package:provider/provider.dart';
import './provider/cart.provider.dart';
import '../screens/cart_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create:(ctx) => Products()),
        ChangeNotifierProvider(create:(ctx) =>Cart()),
        ChangeNotifierProvider(create:(ctx)=> Orders()),
      ],
      child: MaterialApp(
        title: 'DemoApp',
        theme: ThemeData(
          primaryColor: Colors.red,
        ),
        home: const ProductOverviewScreen(),
        routes: {
          ProductDetailScreen.routeName: (ctx) => const ProductDetailScreen(),
          CartScreen.routeName: (ctx) => const CartScreen()
        },
      ),
    );
  }
}
