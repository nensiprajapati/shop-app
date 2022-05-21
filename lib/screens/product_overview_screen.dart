import 'package:demp_app/screens/cart_screen.dart';
import 'package:flutter/material.dart';
import '../widgets/product_grid.dart';
import '../widgets/badge.dart';
import 'package:provider/provider.dart';
import '../provider/cart.provider.dart';
import '../screens/cart_screen.dart';

enum FilterOptions {
  favourite,
  all,
}

class ProductOverviewScreen extends StatefulWidget {
  const ProductOverviewScreen({Key? key}) : super(key: key);

  @override
  _ProductOverviewScreenState createState() => _ProductOverviewScreenState();
}

class _ProductOverviewScreenState extends State<ProductOverviewScreen> {
  var _showOnlyFavourites = false;
  @override
  Widget build(BuildContext context) {
    // final productContainer= Provider.of<Products>(context,listen: false);

    return Scaffold(
      appBar: AppBar(
        title: const Text('MyShop'),
        actions: <Widget>[
          PopupMenuButton(
            onSelected: (FilterOptions selectdValue) {
              setState(() {
                if (selectdValue == FilterOptions.favourite) {
                  _showOnlyFavourites = true;
                } else {
                  _showOnlyFavourites = false;
                }
              });
              // // print(selectdValue);
              // if(selectdValue==FilterOptions.favourite){
              //   // productContainer.showFavouriteOnly();
              //   _showOnlyFavourites=true;
              // }else{
              //   // productContainer.showAll();
              //   _showOnlyFavourites=false;

              // }
            },
            icon: const Icon(Icons.more_vert),
            itemBuilder: (_) => [
              const PopupMenuItem(
                child: Text('Only Favourite'),
                value: FilterOptions.favourite,
              ),
              const PopupMenuItem(
                child: Text(' AllItem'),
                value: FilterOptions.all,
              )
            ],
          ),
          Consumer<Cart>(
            builder: (_, cart, ch) => Badge(
              child: ch!,
              color: Colors.red,
              value: cart.itemCount.toString(),
            ),
            child: IconButton(
              icon: const Icon(
                Icons.shopping_cart,
              ),
              onPressed: () {
                Navigator.of(context).pushNamed(CartScreen.routeName);
              },
            ),
          )
        ],
      ),
      body: ProductGrid(
        showFavs: _showOnlyFavourites,
      ),
    );
  }
}
