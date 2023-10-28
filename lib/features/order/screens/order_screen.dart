import 'package:maison_service/common/widgets/loader.dart';
import 'package:maison_service/constants/global_variables.dart';
import 'package:maison_service/features/home/services/home_services.dart';
import 'package:maison_service/features/service_details/screens/service_details_screen.dart';
import 'package:maison_service/models/service.dart';
import 'package:flutter/material.dart';
import '../../../models/order.dart';
import '../../order_details/screens/order_details.dart';
import '../services/order_service.dart';
import '../widgets/order_widget.dart';

class Orderss extends StatefulWidget {
  static const String routeName = '/order-screen';
  const Orderss({Key? key}) : super(key: key);

  @override
  State<Orderss> createState() => _OrdersState();
}

class _OrdersState extends State<Orderss> {
  List<Order>? orders;
  final OrderServices accountServices = OrderServices();

  @override
  void initState() {
    super.initState();
    fetchOrders();
  }

  void fetchOrders() async {
    orders =
        (await accountServices.fetchMyOrders(context: context)).cast<Order>();
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
          title: const Text(
            'Ordres',
            style: TextStyle(
                color: Color.fromARGB(255, 0, 0, 0),
                fontSize: 25,
                fontWeight: FontWeight.normal),
          ),
        ),
      ),
      body: orders == null
          ? const Loader()
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: orders!.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            OrderDetailScreen.routeName,
                            arguments: orders![index],
                          );
                        },
                        child: OrderWidget(
                          order: orders![index],
                          image: orders![index].services[0].images[0],
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
