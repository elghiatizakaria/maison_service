import 'dart:convert';

import 'package:maison_service/constants/error_handling.dart';
import 'package:maison_service/constants/global_variables.dart';
import 'package:maison_service/constants/utils.dart';
import 'package:maison_service/models/service.dart';
import 'package:maison_service/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class ListeServices {
  Future<List<Service>> fetchServices({
    required BuildContext context,
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    List<Service> serviceList = [];
    try {
      http.Response res =
          await http.get(Uri.parse('$uri/api/services'), headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'x-auth-token': userProvider.user.token,
      });

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          for (int i = 0; i < jsonDecode(res.body).length; i++) {
            serviceList.add(
              Service.fromJson(
                jsonEncode(
                  jsonDecode(res.body)[i],
                ),
              ),
            );
          }
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
    return serviceList;
  }
}
