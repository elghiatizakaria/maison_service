import 'package:maison_service/common/widgets/custom_button.dart';
import 'package:maison_service/constants/global_variables.dart';
import 'package:maison_service/features/address/screens/address_screen.dart';
import 'package:maison_service/features/cart/widgets/cart_service.dart';
import 'package:maison_service/features/cart/widgets/cart_subtotal.dart';
import 'package:maison_service/features/home/widgets/address_box.dart';
import 'package:maison_service/features/search/screens/search_screen.dart';
import 'package:maison_service/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../common/widgets/bottom_navbar.dart';

class CartScreen extends StatefulWidget {
  static const String routeName = '/cart';
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  void navigateToSearchScreen(String query) {
    Navigator.pushNamed(context, SearchScreen.routeName, arguments: query);
  }

  void navigateToAddress(int sum) {
    Navigator.pushNamed(
      context,
      AddressScreen.routeName,
      arguments: sum.toString(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final user = context.watch<UserProvider>().user;
    int sum = 0;
    user.cart
        .map((e) => sum += e['quantity'] * e['service']['price'] as int)
        .toList();

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: GlobalVariables.appBarGradient,
            ),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Icon(
                Icons.house_rounded,
                color: Color.fromARGB(255, 32, 36, 94),
                size: 23,
              ),
              const Text(
                ' Maison Service',
                style: TextStyle(
                  color: Color.fromARGB(255, 32, 36, 94),
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Expanded(
                child: Container(),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const AddressBox(),
            const SizedBox(height: 15),
            Container(
              color: Colors.black12.withOpacity(0.08),
              height: 1,
            ),
            const SizedBox(height: 5),
            ListView.builder(
              itemCount: user.cart.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return CartService(
                  index: index,
                );
              },
            ),
            Container(
              color: Colors.black12.withOpacity(0.08),
              height: 1,
            ),
            //const SizedBox(height: 15),
            const CartSubtotal(),
            Container(
              color: Colors.black12.withOpacity(0.08),
              height: 1,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomButton(
                text: 'Passer l\'ordre',
                onTap: () => navigateToAddress(sum),
                color: Color.fromARGB(255, 135, 206, 250),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavbar(),
    );
  }
}
