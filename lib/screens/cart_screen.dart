import 'package:flutter/material.dart';
import '../provider/cart.provider.dart' show Cart;
import 'package:provider/provider.dart';
import 'package:demp_app/widgets/cart_item_widget.dart';
import 'package:demp_app/provider/orders.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);
  static const routeName = '/cart';
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Card'),
      ),
      body: Column(
        children: <Widget>[
          Card(
              margin: const EdgeInsets.all(11),
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    const Text(
                      "Total",
                      style: TextStyle(fontSize: 20),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Spacer(),
                    Chip(
                      label: Text(
                        '\$${cart.totalAmount}',
                        style: TextStyle(
                          color: Theme.of(context)
                              .primaryTextTheme
                              .headline6
                              ?.color,
                        ),
                      ),
                      backgroundColor: Theme.of(context).primaryColor,
                    ),
                    TextButton(
                        child: const Text("ORDER NOW"),
                        onPressed: () {
                          Provider.of<Orders>(context,listen: false).addOrder(cart.items.values.toList(),cart.totalAmount,);
                          cart.clear();
                        
                        },
                        style: TextButton.styleFrom(primary: Colors.green))
                  ],
                ),
              )),
          const SizedBox(
            height: 10,
          ),
          Expanded(
              child: ListView.builder(
                  itemCount: cart.items.length,
                  itemBuilder: (ctx, i) => CartItem(
                        id: cart.items.values.toList()[i].id,
                        productId: cart.items.keys.toList()[i],
                        price: cart.items.values.toList()[i].price,
                        title: cart.items.values.toList()[i].title,
                        quantity: cart.items.values.toList()[i].quantity,
                      )))
        ],
      ),
    );
  }
}
