import 'package:flutter/material.dart';
import '../model/Item.dart';
import "package:provider/provider.dart";
import "../provider/shoppingcart_provider.dart";

// class Checkout extends StatelessWidget {
//   const Checkout({super.key});

//   @override
//   Widget build(BuildContext context) {
//     List<Item> products = context.watch<ShoppingCart>().cart;

//     return Scaffold(
//       appBar: AppBar(title: const Text("Checkout")),
//       body: Column(
//         children: [
//           Expanded(
//             child: ListView.builder(
//               itemCount: products.length,
//               itemBuilder: (BuildContext context, int index) {
//                 return ListTile(
//                   leading: const Icon(Icons.food_bank),
//                   title: Text(products[index].name),
//                   trailing: Text("\$${products[index].price.toStringAsFixed(2)}"),
//                 );
//               },
//             ),
//           ),
//           ElevatedButton(
//             onPressed: () {
//               context.read<ShoppingCart>().removeAll();
//               Navigator.pop(context); // Go back to cart page
//             },
//             child: const Text("Pay Now"),
//           ),
//         ],
//       ),
//     );
//   }
// }

class Checkout extends StatelessWidget {
  const Checkout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ShoppingCart cart = context.watch<ShoppingCart>();
    List<Item> products = cart.cart;
    // List<Item> products = context.watch<ShoppingCart>().cart;
    double total = cart.cartTotal;

    return Scaffold(
      appBar: AppBar(title: const Text("Checkout")),
      body: Column(
        children: [
          const Center(
            child: Text('Item Details'),
            ),
          products.isEmpty
          ? const Text('No items to checkout!')
          : Expanded(
            child: ListView.builder(
              itemCount: products.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(products[index].name), // Product name on the left
                      Text(products[index].price.toStringAsFixed(2)), // Price on the right
                    ],
                  ),
                );
              },
            ),
          ),
            if (products.isNotEmpty)
              Column(
                children: [
                  Text("Total: ${total.toStringAsFixed(2)}"),
                  ElevatedButton(
                    onPressed: () {
                      cart.removeAll();
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Payment Successful!"),
                          duration: Duration(seconds: 2),
                        ),
                      );
                    },
                    child: const Text("Pay Now!"),
                  ),
                ],
              ),
        ],
      ),
    );
  }
}