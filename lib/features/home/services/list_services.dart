// ignore_for_file: prefer_const_constructors

import 'package:maison_service/common/widgets/loader.dart';
import 'package:maison_service/constants/global_variables.dart';
import 'package:maison_service/features/home/widgets/address_box.dart';
import 'package:maison_service/features/service_details/screens/service_details_screen.dart';
import 'package:maison_service/features/search/services/search_services.dart';
import 'package:maison_service/features/search/widget/searched_service.dart';
import 'package:maison_service/models/service.dart';
import 'package:flutter/material.dart';

import '../../../common/widgets/bottom_navbar.dart';
import '../widgets/section_title.dart';

class ListServices extends StatefulWidget {
  static const String routeName = '/search-screen';
  final String searchQuery;
  const ListServices({
    Key? key,
    required this.searchQuery,
  }) : super(key: key);

  @override
  State<ListServices> createState() => _ListServicesState();
}

class _ListServicesState extends State<ListServices> {
  List<Service>? services;
  final SearchServices searchServices = SearchServices();

  @override
  void initState() {
    super.initState();
    fetchSearchedService();
  }

  fetchSearchedService() async {
    services = await searchServices.fetchSearchedService(
        context: context, searchQuery: widget.searchQuery);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 15),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: (20)),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Services",
              style: TextStyle(
                fontSize: 18,
                color: Colors.black,
              ),
            ),
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              ...List.generate(
                services!.length,
                (index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        ServiceDetailScreen.routeName,
                        arguments: services![index],
                      );
                    },
                    child: SearchedService(
                      service: services![index],
                    ),
                  );
                },
              ),
              SizedBox(width: (20)),
            ],
          ),
        )
      ],
    );
  }
}
