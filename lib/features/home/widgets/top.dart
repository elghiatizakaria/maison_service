import 'package:maison_service/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Top extends StatelessWidget {
  const Top({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;

    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(0, 20, 105, 223),
            Color.fromARGB(0, 20, 105, 223),
          ],
          // stops: [0.5, 1.0],
        ),
      ),
      // padding: const EdgeInsets.only(left: 0),
      child: Row(
        children: [
          Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.only(left: 10),
              child: Text("Top Catégories  ————————————",
                  style: const TextStyle(
                      fontWeight: FontWeight.w500, fontSize: 20),
                  overflow: TextOverflow.ellipsis),
            ),
          ),
          /*const Padding(
            padding: EdgeInsets.only(
              left: 5,
              top: 2,
            ),
            child: Icon(
              Icons.arrow_drop_down_outlined,
              size: 30,
            ),
          )*/
        ],
      ),
    );
  }
}
