import 'package:flutter/material.dart';
import 'package:demp_app/provider/orders.dart' as ord;
import 'package:intl/intl.dart';

class OrderItem extends StatelessWidget {
 
   final ord.OrderItem order;

   OrderItem(this.order);

  @override
  Widget build(BuildContext context) {
    return Card 
    (
      margin: EdgeInsets.all(10),
      child: Column(children:<Widget> [
        ListTile
        (
          title: Text(
            '\$${order.amount}'
          ),
          subtitle: Text(DateFormat('dd mm yyyy hh: mm').format(order.datetime)),
          trailing:IconButton(icon: Icon(Icons.expand_less),
          onPressed: (){},
          
          
          )
          ),
          
        
      ],),
    );
  }
}