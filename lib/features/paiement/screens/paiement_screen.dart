import 'package:maison_service/common/widgets/custom_button.dart';
import 'package:maison_service/common/widgets/custom_textfield.dart';
import 'package:maison_service/constants/global_variables.dart';
import 'package:maison_service/features/auth/services/auth_service.dart';
import 'package:maison_service/features/cart/screens/cart_screen.dart';
import 'package:maison_service/features/home/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pay/pay.dart';
import 'package:provider/provider.dart';

import '../../../constants/utils.dart';
import '../../../providers/user_provider.dart';
import '../../address/services/address_services.dart';

enum Auth {
  signin,
  signup,
}

class PayScreen extends StatefulWidget {
  static const String routeName = '/pay-screen';
  final String totalAmount;
  const PayScreen({
    Key? key,
    required this.totalAmount,
  }) : super(key: key);
  @override
  State<PayScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<PayScreen> {
  Auth _auth = Auth.signup;
  final _payFormKey = GlobalKey<FormState>();
  final TextEditingController nom = TextEditingController();
  final TextEditingController prenom = TextEditingController();
  final TextEditingController carte = TextEditingController();
  final TextEditingController mois = TextEditingController();
  final TextEditingController year = TextEditingController();
  final TextEditingController code = TextEditingController();
  TextEditingController dateinput = TextEditingController();
  List<PaymentItem> paymentItems = [];
  final AddressServices addressServices = AddressServices();
  String total = "";
  @override
  void initState() {
    super.initState();
    paymentItems.add(
      PaymentItem(
        amount: widget.totalAmount,
        label: 'Total à payer',
        status: PaymentItemStatus.final_price,
      ),
    );
    total = widget.totalAmount;
  }

  @override
  void dispose() {
    super.dispose();
    nom.dispose();
    prenom.dispose();
    carte.dispose();
    mois.dispose();
    year.dispose();
    code.dispose();
  }

  void onApplePayResult(String addressToBeUsed) {
    addressServices.placeOrder(
      context: context,
      address: addressToBeUsed,
      totalSum: double.parse(widget.totalAmount),
    );
  }

  void navigateToCart() {
    Navigator.pushNamed(
      context,
      HomeScreen.routeName,
    );
  }

  void payPressed(String addressToBeUsed) {
    bool isForm = nom.text.isNotEmpty ||
        prenom.text.isNotEmpty ||
        carte.text.isNotEmpty ||
        code.text.isNotEmpty ||
        year.text.isNotEmpty ||
        mois.text.isNotEmpty;

    if (isForm) {
      if (_payFormKey.currentState!.validate()) {
        addressServices.placeOrder(
          context: context,
          address: addressToBeUsed,
          totalSum: double.parse(widget.totalAmount),
        );
        showSnackBar(context,
            'Le paiement de votre commande a été effectué avec succés, on vous a envoyé un email de validation');
      } else {
        throw Exception('Please enter all the values!');
      }
    } else {
      showSnackBar(context, 'Entrer les informations de paiement');
    }
  }

  @override
  Widget build(BuildContext context) {
    var address = context.watch<UserProvider>().user.address;
    var total = "h";
    var yearp = [2001];
    for (var i = 2002; i < 2024; i++) {
      yearp.add(i);
    }
    var moisp = [1];
    for (var i = 2; i < 13; i++) {
      moisp.add(i);
    }
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
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
                      text: const TextSpan(
                        text: 'Paiement',
                        style: TextStyle(
                          fontSize: 22,
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      backgroundColor: GlobalVariables.greyBackgroundCOlor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /*const Text(
                'Total à payer : ',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),*/
              const SizedBox(height: 10),
              const Text(
                'Comment voulez-vous payer votre service?',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 10),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.person),
                  Text(
                    "  Informations personnelles",
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              ListTile(
                tileColor: _auth == Auth.signup
                    ? GlobalVariables.backgroundColor
                    : GlobalVariables.greyBackgroundCOlor,
                title: const Text(
                  'Paiement à l\'avance',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 0, 102, 255)),
                ),
                leading: Radio(
                  activeColor: GlobalVariables.secondaryColor,
                  value: Auth.signup,
                  groupValue: _auth,
                  onChanged: (Auth? val) {
                    setState(() {
                      _auth = val!;
                    });
                  },
                ),
              ),
              if (_auth == Auth.signup)
                Container(
                  padding: const EdgeInsets.all(8),
                  color: GlobalVariables.backgroundColor,
                  child: Form(
                    key: _payFormKey,
                    child: Column(
                      children: [
                        CustomTextField(
                          controller: nom,
                          hintText: 'Nom',
                          isPassword: true,
                          labelText: '',
                          validator: (value) {},
                        ),
                        const SizedBox(height: 10),
                        CustomTextField(
                          controller: prenom,
                          hintText: 'Prénom',
                          isPassword: true,
                          labelText: '',
                          validator: (value) {},
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.payment),
                            Text(
                              "  Informations de carte bancaire",
                              style: TextStyle(
                                fontSize: 24.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        CustomTextField(
                          controller: carte,
                          hintText: 'Numéro de la carte de crédit',
                          isPassword: true,
                          labelText: '',
                          validator: (value) {},
                        ),
                        const SizedBox(height: 10),
                        CustomTextField(
                          controller: code,
                          hintText: 'Code de sécurité',
                          isPassword: true,
                          labelText: '',
                          validator: (value) {},
                        ),
                        const SizedBox(height: 10),
                        /* CustomTextField(
                          controller: mois,
                          hintText: 'Mois expiration',
                        ),
                        const SizedBox(height: 10),
                        CustomTextField(
                          controller: year,
                          hintText: 'Année expiration',
                        ),*/
                        const SizedBox(height: 10),
                        TextFormField(
                            controller: dateinput,
                            validator: (val) {
                              if (val == null || val.isEmpty) {
                                return 'Entrer La Date d expiration de votre carte';
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                              icon: Icon(
                                  Icons.calendar_today), //icon of text field
                              labelText: "Date expiration",
                              //label text of field
                            ),
                            onTap: () async {
                              DateTime? pickedDate = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(
                                      2000), //DateTime.now() - not to allow to choose before today.
                                  lastDate: DateTime(2024));
                              if (pickedDate != null) {
                                //pickedDate output format => 2021-03-10 00:00:00.000
                                String formattedDate =
                                    DateFormat('yyyy-MM').format(pickedDate);
                                //formatted date output using intl package =>  2021-03-16
                                //you can implement different kind of Date Format here according to your requirement

                                setState(() {
                                  dateinput.text =
                                      formattedDate; //set output date to TextField value.
                                });
                              }
                            }),
                        /* Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            for (var menu in yearp) Text(menu.toString())
                          ],
                        ),*/
                        const SizedBox(height: 10),
                        CustomButton(
                          text: 'Payer',
                          onTap: () {
                            payPressed(address);
                          },
                          onPressed: () {},
                        )
                      ],
                    ),
                  ),
                ),
              ListTile(
                tileColor: _auth == Auth.signin
                    ? GlobalVariables.backgroundColor
                    : GlobalVariables.greyBackgroundCOlor,
                title: const Text(
                  'Paiement à la fin du service',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 0, 102, 255),
                  ),
                ),
                leading: Radio(
                  activeColor: Color.fromARGB(255, 64, 166, 235),
                  value: Auth.signin,
                  groupValue: _auth,
                  onChanged: (Auth? val) {
                    setState(() {
                      _auth = val!;
                    });
                  },
                ),
              ),
              if (_auth == Auth.signin)
                Container(
                    padding: const EdgeInsets.all(8),
                    color: GlobalVariables.backgroundColor,
                    //child: const SizedBox(height: 10),
                    child: CustomButton(
                      text: 'Valider',
                      onTap: () {
                        onApplePayResult(address);
                      },
                      onPressed: () {},
                    )),
            ],
          ),
        ),
      ),
    );
  }
}
