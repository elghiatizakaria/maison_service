import 'package:maison_service/features/cart/services/cart_services.dart';
import 'package:maison_service/features/service_details/services/service_details_services.dart';
import 'package:maison_service/models/service.dart';
import 'package:maison_service/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartService extends StatefulWidget {
  final int index;
  const CartService({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  State<CartService> createState() => _CartServiceState();
}

class _CartServiceState extends State<CartService> {
  final ServiceDetailsServices serviceDetailsServices =
      ServiceDetailsServices();
  final CartServices cartServices = CartServices();

  void increaseQuantity(Service service) {
    serviceDetailsServices.addToCart(
      context: context,
      service: service,
    );
  }

  void decreaseQuantity(Service service) {
    cartServices.removeFromCart(
      context: context,
      service: service,
    );
  }

  @override
  Widget build(BuildContext context) {
    final serviceCart = context.watch<UserProvider>().user.cart[widget.index];
    final service = Service.fromMap(serviceCart['service']);
    final quantity = serviceCart['quantity'];

    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 10,
          ),
          child: Row(
            children: [
              Image.network(
                service.images[0],
                fit: BoxFit.contain,
                height: 135,
                width: 135,
              ),
              Column(
                children: [
                  Container(
                    width: 235,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      service.name,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 2,
                    ),
                  ),
                  Container(
                    width: 235,
                    padding: const EdgeInsets.only(left: 10, top: 5),
                    child: Text(
                      '${service.price}\ Dhs',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 2,
                    ),
                  ),
                  Container(
                    width: 235,
                    padding: const EdgeInsets.only(left: 10),
                    child: Text('${service.category}'),
                  ),
                  Container(
                    width: 235,
                    padding: const EdgeInsets.only(left: 10, top: 5),
                    child: const Text(
                      'En service',
                      style: TextStyle(
                        color: Color.fromARGB(255, 118, 196, 233),
                      ),
                      maxLines: 2,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black12,
                    width: 1.5,
                  ),
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.black12,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
