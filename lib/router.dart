import 'package:maison_service/common/widgets/bottom_bar.dart';
import 'package:maison_service/features/address/screens/address_screen.dart';
import 'package:maison_service/features/admin/screens/add_service_screen.dart';
import 'package:maison_service/features/order/screens/order_screen.dart';
import 'package:maison_service/features/auth/screens/auth_screen.dart';
import 'package:maison_service/features/home/screens/category_deals_screen.dart';
import 'package:maison_service/features/home/screens/home_screen.dart';
import 'package:maison_service/features/order_details/screens/order_details.dart';
import 'package:maison_service/features/service_details/screens/service_details_screen.dart';
import 'package:maison_service/features/search/screens/search_screen.dart';
import 'package:maison_service/models/order.dart';
import 'package:maison_service/models/service.dart';
import 'package:flutter/material.dart';

import 'features/account/widgets/orders.dart';
import 'features/cart/screens/cart_screen.dart';
import 'features/paiement/screens/paiement_screen.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case AuthScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const AuthScreen(),
      );
    case PayScreen.routeName:
      var totalAmount = routeSettings.arguments as String;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => PayScreen(
          totalAmount: totalAmount,
        ),
      );
    case Orderss.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const Orderss(),
      );
    case HomeScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const HomeScreen(),
      );
    case CartScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const CartScreen(),
      );
    case BottomBar.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const BottomBar(),
      );
    case AddServiceScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const AddServiceScreen(),
      );

    case CategoryDealsScreen.routeName:
      var category = routeSettings.arguments as String;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => CategoryDealsScreen(
          category: category,
        ),
      );
    case SearchScreen.routeName:
      var searchQuery = routeSettings.arguments as String;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => SearchScreen(
          searchQuery: searchQuery,
        ),
      );
    case ServiceDetailScreen.routeName:
      var service = routeSettings.arguments as Service;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => ServiceDetailScreen(
          service: service,
        ),
      );
    case AddressScreen.routeName:
      var totalAmount = routeSettings.arguments as String;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => AddressScreen(
          totalAmount: totalAmount,
        ),
      );
    case OrderDetailScreen.routeName:
      var order = routeSettings.arguments as Order;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => OrderDetailScreen(
          order: order,
        ),
      );
    default:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const Scaffold(
          body: Center(
            child: Text('Screen does not exist!'),
          ),
        ),
      );
  }
}
