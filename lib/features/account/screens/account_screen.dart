import 'package:maison_service/constants/global_variables.dart';
import 'package:maison_service/features/account/widgets/below_app_bar.dart';
import 'package:maison_service/features/account/widgets/orders.dart';
import 'package:maison_service/features/account/widgets/top_buttons.dart';
import 'package:maison_service/features/admin/screens/orders_screen.dart';
import 'package:maison_service/features/order/screens/order_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../common/widgets/custom_button.dart';
import '../../../providers/user_provider.dart';
import '../widgets/account_button.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  void navigateToOrders() {
    Navigator.pushNamed(
      context,
      Orderss.routeName,
    );
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: GlobalVariables.appBarGradient,
            ),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.only(left: 0, right: 15),
                child: Row(
                  children: [
                    RichText(
                      text: TextSpan(
                        text: 'Salut ',
                        style: const TextStyle(
                          fontSize: 22,
                          color: Color.fromARGB(255, 255, 255, 255),
                        ),
                        children: [
                          TextSpan(
                            text: user.name,
                            style: const TextStyle(
                              fontSize: 22,
                              color: Color.fromARGB(255, 255, 255, 255),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage("assets/images/images.png"),
            backgroundColor: Color.fromARGB(0, 6, 4, 2),
          ),
          SizedBox(width: 5),
          Container(
            width: 13,
            height: 13,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.green,
            ),
          ),
          Text(
            "${user.name}",
            style: TextStyle(
                fontSize: 20,
                fontFamily: "Roboto",
                color: Color.fromARGB(255, 0, 0, 0),
                fontWeight: FontWeight.bold,
                letterSpacing: 2,
                wordSpacing: 4,
                height: 1.5,
                decorationStyle: TextDecorationStyle.wavy),
          ),
          Container(
            width: 200,
            height: 2.0,
            color: Color.fromARGB(255, 90, 87, 87),
          ),
          SizedBox(height: 10),
          Row(
            children: [
              AccountButton(
                text: 'Ordres',
                onTap: () => {
                  navigateToOrders(),
                },
              ),
            ],
          ),
          SizedBox(height: 10),
          TopButtons(),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
