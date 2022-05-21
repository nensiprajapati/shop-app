import 'package:demp_app/widgets/order_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:demp_app/provider/orders.dart' show Orders ;
import 'package:provider/provider.dart';
class OrderScreen extends StatelessWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final orderData= Provider.of<Orders>(context);
    return Scaffold(
      appBar: 
      AppBar(
         title: Text("YOUR ORDER"),),

         body:ListView.builder(
        itemCount: orderData.orders.length,
        itemBuilder: (ctx,i)=> OrderItem( orderData.orders[i])),);
        
       


      
  }}