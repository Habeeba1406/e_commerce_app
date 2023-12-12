import 'package:e_commerce_app/models/product.dart';
import 'package:e_commerce_app/pages/cartdetails_screen.dart';
import 'package:e_commerce_app/provider/cart_provider.dart';
import 'package:e_commerce_app/widgets/availablesize.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  final Product product;
  const DetailsScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final provider = CartProvider.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text(
          "Details",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 36,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 220,
                height: 220,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.red.shade100,
                ),
                child: Image.asset(
                  product.image,
                  fit: BoxFit.cover,
                ),
              )
            ],
          ),
          const SizedBox(
            height: 28,
          ),
          Container(
            padding: EdgeInsets.all(20),
            width: double.infinity,
            height: 400,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                )),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      product.name.toUpperCase(),
                      style: const TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '\$' '${product.price}',
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  product.description,
                  textAlign: TextAlign.justify,
                  style: const TextStyle(
                    fontSize: 14,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Available Size',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                const Row(
                  children: [
                    AvailableSize(size: "US 6"),
                    AvailableSize(size: "US 7"),
                    AvailableSize(size: "US 8"),
                    AvailableSize(size: "US 9"),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                const Row(
                  children: [
                    CircleAvatar(
                      radius: 16,
                      backgroundColor: Colors.blue,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    CircleAvatar(
                      radius: 16,
                      backgroundColor: Colors.red,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    CircleAvatar(
                      radius: 16,
                      backgroundColor: Colors.amber,
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
      bottomSheet: BottomAppBar(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          alignment: Alignment.center,
          width: double.infinity,
          height: MediaQuery.of(context).size.height / 8,
          decoration: const BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              )),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '\$' '${product.price}',
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              ElevatedButton.icon(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.red)),
                  onPressed: () {
                    provider.toggleProduct(product);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CartDetails(),
                        ));
                  },
                  icon: const Icon(
                    Icons.send,
                    size: 25,
                    color: Colors.white,
                  ),
                  label: const Text(
                    'Add To Cart',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
