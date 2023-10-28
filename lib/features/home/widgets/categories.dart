// ignore_for_file: prefer_const_constructors

import 'package:maison_service/features/home/widgets/section_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../screens/category_deals_screen.dart';

void navigateToCategoryPage(BuildContext context, String category) {
  Navigator.pushNamed(context, CategoryDealsScreen.routeName,
      arguments: category);
}

class Categories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> categories = [
      {"icon": "assets/icons/Flash Icon.svg", "text": "Electricité"},
      {"icon": "assets/icons/Bill Icon.svg", "text": "Ménage"},
      {"icon": "assets/icons/Game Icon.svg", "text": "Menuiserie"},
      {"icon": "assets/icons/Gift Icon.svg", "text": "Peinture"},
      {"icon": "assets/icons/Discover.svg", "text": "Plomberie"},
    ];
    return Padding(
      padding: EdgeInsets.only(bottom: 5),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(15),
            child: SectionTitle(
              title: "Top Catégories",
              press: () {},
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: (15)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(
                categories.length,
                (index) => CategoryCard(
                  icon: categories[index]["icon"],
                  text: categories[index]["text"],
                  press: () {},
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key? key,
    required this.icon,
    required this.text,
    required this.press,
  }) : super(key: key);

  final String? icon, text;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => navigateToCategoryPage(
        context,
        text!,
      ),
      child: SizedBox(
        width: 62,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(15),
              height: 55,
              width: 55,
              decoration: BoxDecoration(
                color: Color(0xFFFFECDF),
                borderRadius: BorderRadius.circular(10),
              ),
              child: SvgPicture.asset(icon!),
            ),
            SizedBox(height: 5),
            Text(
              text!,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 12),
            )
          ],
        ),
      ),
    );
  }
}
