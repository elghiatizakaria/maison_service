import 'package:maison_service/common/widgets/loader.dart';
import 'package:maison_service/constants/global_variables.dart';
import 'package:maison_service/features/List_Service/widget/searched_service.dart';
import 'package:maison_service/features/home/widgets/address_box.dart';
import 'package:maison_service/features/service_details/screens/service_details_screen.dart';
import 'package:maison_service/features/search/services/search_services.dart';
import 'package:maison_service/features/search/widget/searched_service.dart';
import 'package:maison_service/models/service.dart';
import 'package:flutter/material.dart';

import '../services/search_services.dart';

class Liste extends StatefulWidget {
  static const String routeName = '/List-screen';
  const Liste({
    Key? key,
  }) : super(key: key);

  @override
  State<Liste> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<Liste> {
  List<Service>? services;
  final ListeServices searchServices = ListeServices();

  @override
  void initState() {
    super.initState();
    fetchSearchedService();
  }

  fetchSearchedService() async {
    services = await searchServices.fetchServices(context: context);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: services == null
          ? const Loader()
          : Column(
              children: [
                const AddressBox(),
                const SizedBox(height: 10),
                Expanded(
                  child: ListView.builder(
                    itemCount: services!.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            ServiceDetailScreen.routeName,
                            arguments: services![index],
                          );
                        },
                        child: ListService(
                          service: services![index],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
    );
  }
}
