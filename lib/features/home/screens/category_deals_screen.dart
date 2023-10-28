import 'package:maison_service/common/widgets/loader.dart';
import 'package:maison_service/constants/global_variables.dart';
import 'package:maison_service/features/home/services/home_services.dart';
import 'package:maison_service/features/service_details/screens/service_details_screen.dart';
import 'package:maison_service/models/service.dart';
import 'package:flutter/material.dart';

import '../../search/widget/searched_service.dart';

class CategoryDealsScreen extends StatefulWidget {
  static const String routeName = '/category-deals';
  final String category;
  const CategoryDealsScreen({
    Key? key,
    required this.category,
  }) : super(key: key);

  @override
  State<CategoryDealsScreen> createState() => _CategoryDealsScreenState();
}

class _CategoryDealsScreenState extends State<CategoryDealsScreen> {
  List<Service>? serviceList;
  final HomeServices homeServices = HomeServices();

  @override
  void initState() {
    super.initState();
    fetchCategoryServices();
  }

  fetchCategoryServices() async {
    serviceList = await homeServices.fetchCategoryServices(
      context: context,
      category: widget.category,
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: GlobalVariables.appBarGradient,
            ),
          ),
          title: Text(
            widget.category,
            style: const TextStyle(
                color: Color.fromARGB(255, 0, 0, 0),
                fontSize: 25,
                fontWeight: FontWeight.normal),
          ),
        ),
      ),
      body: serviceList == null
          ? const Loader()
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: serviceList!.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            ServiceDetailScreen.routeName,
                            arguments: serviceList![index],
                          );
                        },
                        child: SearchedService(
                          service: serviceList![index],
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
