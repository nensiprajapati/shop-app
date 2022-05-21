import 'package:demp_app/provider/product_providers.dart';
import 'package:demp_app/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/product_providers.dart';

class ProductGrid extends StatelessWidget {
  final bool showFavs;

  const ProductGrid({Key? key, required this.showFavs}) : super(key: key);


  // final List<Product> loadedProducts;

  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<Products>(context);
    //  final product=productData.items;
    final product = showFavs ? productData.favoriteItems : productData.items;
    return GridView.builder(
      itemCount: product.length,
      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
        value: product[i],
        child: const ProductItem(
            // id: product[i].id,

            ),
      ),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 2 / 3,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
    );
  }
}
