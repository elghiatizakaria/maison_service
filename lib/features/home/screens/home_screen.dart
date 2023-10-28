import 'package:maison_service/constants/global_variables.dart';
import 'package:maison_service/features/home/widgets/address_box.dart';
import 'package:maison_service/features/home/widgets/carousel_image.dart';
import 'package:maison_service/features/home/widgets/deal_of_day.dart';
import 'package:maison_service/features/home/widgets/suggestion.dart';
import 'package:maison_service/features/home/widgets/top.dart';
import 'package:maison_service/features/home/widgets/top_categories.dart';
import 'package:maison_service/features/search/screens/search_screen.dart';
import 'package:flutter/material.dart';

import '../../../common/widgets/bottom_navbar.dart';
import '../../../models/service.dart';
import '../../service_details/screens/service_details_screen.dart';
import '../../search/widget/searched_service.dart';
import '../services/list_services.dart';
import '../widgets/categories.dart';
import '../widgets/discount_banner.dart';
import '../widgets/home_header.dart';
import '../widgets/special_offers.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/home';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Service>? services;
  void navigateToSearchScreen(String query) {
    Navigator.pushNamed(context, SearchScreen.routeName, arguments: query);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              color: Colors.blue,
              //gradient: GlobalVariables.appBarGradient,
            ),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Icon(
                Icons.house_rounded,
                color: Color.fromARGB(255, 0, 0, 0),
                size: 23,
              ),
              const Text(
                ' Maison Service    ',
                style: TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(width: 50),
              InkWell(
                onTap: () {},
                borderRadius: BorderRadius.circular(50),
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      //padding: EdgeInsets.all(22),
                      height: 45,
                      width: 45,
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.1),
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        icon: const Icon(
                            IconData(0xe59c, fontFamily: 'MaterialIcons')),
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 10),
            HomeHeader(),
            SizedBox(height: 10),
            DiscountBanner(),
            Categories(),
            SizedBox(height: 10),
            SpecialOffers(),
            ListServices(
              searchQuery: 'a',
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavbar(),
    );
  }
}
