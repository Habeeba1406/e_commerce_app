import 'package:e_commerce_app/models/myProduct.dart';
import 'package:e_commerce_app/pages/detailed_screen.dart';
import 'package:e_commerce_app/widgets/productCard.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int isSelected = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Our Products',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              productCategory(index: 0, name: 'All products'),
              productCategory(index: 1, name: 'Mens'),
              productCategory(index: 2, name: 'Womens'),
              productCategory(index: 3, name: 'Electronics'),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
              child: isSelected == 0
                  ? _buildAllProducts()
                  : isSelected == 1
                      ? _buildMensCategory()
                      : isSelected == 2
                          ? _buildWomensCategory()
                          : _buildElectronicsCategory()),
        ],
      ),
    );
  }

  productCategory({required int index, required String name}) =>
      GestureDetector(
        onTap: () => setState(() => isSelected = index),
        child: Container(
          width: 100,
          height: 40,
          margin: EdgeInsets.only(top: 10, right: 10),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: isSelected == index ? Colors.red : Colors.red.shade300,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            name,
            style: TextStyle(color: Colors.white),
          ),
        ),
      );

  _buildAllProducts() => GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: (100 / 140),
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
      ),
      scrollDirection: Axis.vertical,
      itemCount: myproducts.allproducts.length,
      itemBuilder: (context, index) {
        final allproducts = myproducts.allproducts[index];
        return GestureDetector(
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailsScreen(product: allproducts),
              )),
          child: ProductCard(
            product: allproducts,
          ),
        );
      });

  _buildMensCategory() => GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: (100 / 140),
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
      ),
      scrollDirection: Axis.vertical,
      itemCount: myproducts.menslist.length,
      itemBuilder: (context, index) {
        final menslist = myproducts.menslist[index];
        return GestureDetector(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DetailsScreen(product: menslist))),
            child: ProductCard(product: menslist));
      });

  _buildWomensCategory() => GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: (100 / 140),
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
      ),
      scrollDirection: Axis.vertical,
      itemCount: myproducts.womenslist.length,
      itemBuilder: (context, index) {
        final womenslist = myproducts.womenslist[index];
        return GestureDetector(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DetailsScreen(product: womenslist))),
            child: ProductCard(product: womenslist));
      });
  _buildElectronicsCategory() => GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: (100 / 140),
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
      ),
      scrollDirection: Axis.vertical,
      itemCount: myproducts.electronics.length,
      itemBuilder: (context, index) {
        final electronics = myproducts.electronics[index];
        return GestureDetector(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DetailsScreen(product: electronics))),
            child: ProductCard(product: electronics));
      });
}
