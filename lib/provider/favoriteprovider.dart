// import 'package:e_commerce_app/models/product.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class FavoriteProvider extends ChangeNotifier {
//   final List<product> _favorite = [];
//   List<product> get favorites => _favorite;

//   void toggleFavorite(product Product) {
//     if (_favorite.contains(Product)) {
//       _favorite.remove(Product);
//     } else {
//       _favorite.add(Product);
//     }
//     notifyListeners();
//   }

//   bool isExist(product Product) {
//     final isExist = _favorite.contains(Product);
//     return isExist;
//   }

//   static FavoriteProvider of(
//     BuildContext context, {
//     bool listen = true,
//   }) {
//     return Provider.of<FavoriteProvider>(
//       context,
//       listen: listen,
//     );
//   }
// }

// import 'package:e_commerce_app/models/product.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class FavoriteProvider extends ChangeNotifier {
//   final List<Product> _favorites = [];
//   List<Product> get favorites => _favorites;

//   void toggleFavorite(Product product) {
//     if (_favorites.contains(product)) {
//       _favorites.remove(product);
//     }

//     notifyListeners();
//   }

//   bool isExist(Product product) {
//     final isExist = _favorites.contains(product);
//     return isExist;
//   }

//   static FavoriteProvider of(
//     BuildContext context, {
//     bool listen = true,
//   }) {
//     return Provider.of<FavoriteProvider>(context, listen: listen);
//   }
// }
import 'package:e_commerce_app/models/product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavorateProvider extends ChangeNotifier {
  final List<Product> _favorates = [];
  List<Product> get favorates => _favorates;

  void toggleFavorate(Product product) {
    if (_favorates.contains(product)) {
      _favorates.remove(product);
    } else {
      _favorates.add(product);
    }
    notifyListeners();
  }

  bool isExist(Product product) {
    final isExist = _favorates.contains(product);
    return isExist;
  }

  static FavorateProvider of(
    BuildContext context, {
    bool listen = true,
  }) {
    return Provider.of<FavorateProvider>(
      context,
      listen: listen,
    );
  }
}
