import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../../features/account/screens/account_screen.dart';
import '../../features/cart/screens/cart_screen.dart';
import '../../features/home/screens/home_screen.dart';
import '../../features/search/screens/search_screen.dart';




class BottomNavbar extends StatelessWidget {
  const BottomNavbar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal : 12),
        child: GNav(
          //activeColor: Colors.blue,
          backgroundColor: Colors.white,
          padding: EdgeInsets.all(16),
          tabs: [
            GButton(icon: Icons.home_outlined , onPressed: (){Navigator.of(context)
              .push(
                MaterialPageRoute(
                  builder: (context) => HomeScreen()
                )
              );}
            ),
            // GButton(icon: Icons.favorite_border, onPressed: (){Navigator.of(context)
            //   .push(
            //     MaterialPageRoute(
            //       builder: (context) => FavoriteServices()
            //     )
            //   );}
            // ),
            GButton(icon: Icons.search , onPressed: (){Navigator.of(context)
              .push(
                MaterialPageRoute(
                  builder: (context) => SearchScreen(searchQuery: '',)
                )
              );}
            ),
            GButton(icon: Icons.content_paste, onPressed: (){Navigator.of(context)
              .push(
                MaterialPageRoute(
                  builder: (context) => CartScreen()
                )
              );}
            ),
            GButton(icon: Icons.account_circle_outlined , onPressed: (){Navigator.of(context)
              .push(
                MaterialPageRoute(
                  builder: (context) =>  AccountScreen()
                )
              );}),
            
          ]
        ),
      ),
    );
  }
}