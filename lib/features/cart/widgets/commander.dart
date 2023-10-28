import 'package:maison_service/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartSubtotal extends StatelessWidget {
  const CartSubtotal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = context.watch<UserProvider>().user;
    int sum = 0;
    user.cart
        .map((e) => sum += e['quantity'] * e['service']['price'] as int)
        .toList();

    return Container(
      color: Color.fromARGB(255, 255, 248, 236),
      margin: const EdgeInsets.all(00),
      child: Row(
        children: [
          const Text(
            'Total à payer :  ',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          Text(
            ' $sum\ Dhs',
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
