import 'package:flutter/material.dart';
import 'product_model.dart';

class Products with ChangeNotifier {
  final List<Product> _items = [
    Product(
      id: 'p1',
      title: 'Red',
      description: "'it's beautiful",
      imageUrl:
          'https://assets.ajio.com/medias/sys_master/root/20220121/DwGv/61ea58afaeb2695cdd2436ee/-473Wx593H-461575169-maroon-MODEL.jpg',
      price: 500,
    ),
    Product(
      id: 'p2',
      title: 'Green',
      description: "'it's beautiful",
      imageUrl:
          'https://rukminim1.flixcart.com/image/332/398/l12h1u80/t-shirt/d/d/t/l-dv24solidmustard-diversify-original-imagcpzzrks39hyd.jpeg?q=50',
      price: 200,
    ),
    Product(
      id: 'p3',
      title: 'Green',
      description: "'it's beautiful",
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR1UMNeEHohpmIpjj1jhCdP7JKQoaJz4OIXHg&usqp=CAU',
      price: 50,
    ),
    Product(
      id: 'p4',
      title: 'Green',
      description: "'a Green Tshirt it is Pretty Good",
      imageUrl:
          'https://5.imimg.com/data5/TS/NG/FG/ANDROID-40591384/product-jpeg-500x500.jpg',
      price: 100,
    )
  ];

  //  var _showFavouriteOnly=false;

  List<Product> get items {
    // if(_showFavouriteOnly){
    //   return _items.where((prodItem)=>prodItem.isFavourite).toList();
    // }
    return [..._items];
  }

  List<Product> get favoriteItems {
    return _items.where((prodItem) => prodItem.isFavourite).toList();
  }

  Product findById(String Id) {
    return _items.firstWhere((prod) => prod.id == Id);
  }

  // List<Product>get favouriteItems{
  //   return _items.where((prodItem) =>prodItem.isFavourite).toList();
  // }

  //  void showAll(){
  //    _showFavouriteOnly=false;
  //    notifyListeners();
  //  }

  // void  showFavouriteOnly(){
  //   _showFavouriteOnly=true;
  //   notifyListeners();
  // }
  void addProduct() {
    // _items.add(value);
    notifyListeners();
  }
}
