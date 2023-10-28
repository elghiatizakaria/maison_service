import 'package:maison_service/constants/global_variables.dart';
import 'package:maison_service/features/account/screens/account_screen.dart';
import 'package:maison_service/features/cart/screens/cart_screen.dart';
import 'package:maison_service/features/home/screens/home_screen.dart';
import 'package:maison_service/providers/user_provider.dart';
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'bottom_navbar.dart';

class BottomBar extends StatefulWidget {
  static const String routeName = '/actual-home';
  const BottomBar({Key? key}) : super(key: key);

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _page = 0;
  double bottomBarWidth = 42;
  double bottomBarBorderWidth = 5;

  List<Widget> pages = [
    const HomeScreen(),
    const AccountScreen(),
    const CartScreen(),
  ];

  void updatePage(int page) {
    setState(() {
      _page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    final userCartLen = context.watch<UserProvider>().user.cart.length;

    return Scaffold(
      body: pages[_page],

      // bottomNavigationBar: BottomNavigationBar(
      //   currentIndex: _page,
      //   selectedItemColor: GlobalVariables.selectedNavBarColor,
      //   unselectedItemColor: GlobalVariables.unselectedNavBarColor,
      //   backgroundColor: Color.fromARGB(255, 132, 188, 221),
      //   iconSize: 28,
      //   onTap: updatePage,
      //   items: [
      //     // HOME
      //     BottomNavigationBarItem(
      //       icon: Container(
      //         width: bottomBarWidth,
      //         decoration: BoxDecoration(
      //           border: Border(
      //             top: BorderSide(
      //               color: _page == 0
      //                   ? GlobalVariables.selectedNavBarColor
      //                   : Color.fromARGB(255, 0, 0, 0),
      //               width: bottomBarBorderWidth,
      //             ),
      //           ),
      //         ),
      //         child: const Icon(
      //           Icons.house_outlined,
      //         ),
      //       ),
      //       label: 'Accueil',
      //     ),
      //     // ACCOUNT
      //     BottomNavigationBarItem(
      //       icon: Container(
      //         width: bottomBarWidth,
      //         decoration: BoxDecoration(
      //           border: Border(
      //             top: BorderSide(
      //               color: _page == 1
      //                   ? GlobalVariables.selectedNavBarColor
      //                   : Color.fromARGB(255, 0, 0, 0),
      //               width: bottomBarBorderWidth,
      //             ),
      //           ),
      //         ),
      //         child: const Icon(
      //           Icons.person,
      //         ),
      //       ),
      //       label: 'Profile',
      //     ),
      //     // CART
      //     BottomNavigationBarItem(
      //       icon: Container(
      //         width: bottomBarWidth,
      //         decoration: BoxDecoration(
      //           border: Border(
      //             top: BorderSide(
      //               color: _page == 2
      //                   ? GlobalVariables.selectedNavBarColor
      //                   : Color.fromARGB(255, 0, 0, 0),
      //               width: bottomBarBorderWidth,
      //             ),
      //           ),
      //         ),
      //         child: Badge(
      //           elevation: 0,
      //           badgeContent: Text(userCartLen.toString()),
      //           badgeColor: Colors.white,
      //           child: const Icon(
      //             Icons.shopping_basket,
      //           ),
      //         ),
      //       ),
      //       label: 'Ordre',
      //     ),
      //   ],
      // ),
    );
  }
}
