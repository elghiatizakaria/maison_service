import 'package:maison_service/common/widgets/loader.dart';
import 'package:maison_service/features/home/services/home_services.dart';
import 'package:maison_service/features/service_details/screens/service_details_screen.dart';
import 'package:maison_service/models/service.dart';
import 'package:flutter/material.dart';

class DealOfDay extends StatefulWidget {
  const DealOfDay({Key? key}) : super(key: key);

  @override
  State<DealOfDay> createState() => _DealOfDayState();
}

class _DealOfDayState extends State<DealOfDay> {
  Service? service;
  final HomeServices homeServices = HomeServices();

  @override
  void initState() {
    super.initState();
    fetchDealOfDay();
  }

  void fetchDealOfDay() async {
    service = await homeServices.fetchDealOfDay(context: context);
    setState(() {});
  }

  void navigateToDetailScreen() {
    Navigator.pushNamed(
      context,
      ServiceDetailScreen.routeName,
      arguments: service,
    );
  }

  @override
  Widget build(BuildContext context) {
    return service == null
        ? const Loader()
        : service!.name.isEmpty
            ? const SizedBox()
            : GestureDetector(
                onTap: navigateToDetailScreen,
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.topLeft,
                      padding: const EdgeInsets.only(left: 10, top: 15),
                      /*child: const Text(
                        'Suggestion pour vous',
                        style: TextStyle(fontSize: 20),
                      ),*/
                    ),
                    /* Image.network(
                      service!.images[0],
                      height: 235,
                      fit: BoxFit.fitHeight,
                    ),*/

                    /*Container(
                      padding: const EdgeInsets.only(left: 15),
                      alignment: Alignment.topLeft,
                      child: const Text(
                        '100 Dhs',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),*/
                    /*Container(
                      alignment: Alignment.topLeft,
                      padding:
                          const EdgeInsets.only(left: 15, top: 5, right: 40),
                      child: const Text(
                        'plus',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),*/
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: service!.images
                            .map(
                              (e) => Image.network(
                                e,
                                fit: BoxFit.fitWidth,
                                width: 100,
                                height: 100,
                              ),
                            )
                            .toList(),
                      ),
                    ),
                    /*Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 15,
                      ).copyWith(left: 15),
                      alignment: Alignment.topLeft,
                      /*child: Text(
                        'Voir tous',
                        style: TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),*/
                    ),*/
                  ],
                ),
              );
  }
}
