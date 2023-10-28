import 'package:maison_service/common/widgets/loader.dart';
import 'package:maison_service/features/account/widgets/single_service.dart';
import 'package:maison_service/features/admin/screens/add_service_screen.dart';
import 'package:maison_service/features/admin/services/admin_services.dart';
import 'package:maison_service/models/service.dart';
import 'package:flutter/material.dart';

class PostsScreen extends StatefulWidget {
  const PostsScreen({Key? key}) : super(key: key);

  @override
  State<PostsScreen> createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {
  List<Service>? services;
  final AdminServices adminServices = AdminServices();

  @override
  void initState() {
    super.initState();
    fetchAllServices();
  }

  fetchAllServices() async {
    services = await adminServices.fetchAllServices(context);
    setState(() {});
  }

  void deleteService(Service service, int index) {
    adminServices.deleteService(
      context: context,
      service: service,
      onSuccess: () {
        services!.removeAt(index);
        setState(() {});
      },
    );
  }

  void navigateToAddService() {
    Navigator.pushNamed(context, AddServiceScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return services == null
        ? const Loader()
        : Scaffold(
            body: GridView.builder(
              itemCount: services!.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
              itemBuilder: (context, index) {
                final serviceData = services![index];
                return Column(
                  children: [
                    SizedBox(
                      height: 140,
                      child: SingleService(
                        image: serviceData.images[0],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 4),
                          child: Text(
                            serviceData.name,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                        ),
                        IconButton(
                          onPressed: () => deleteService(serviceData, index),
                          icon: const Icon(Icons.delete_forever,
                              color: Color.fromARGB(255, 255, 0, 0)),
                        ),
                      ],
                    ),
                  ],
                );
              },
            ),
            floatingActionButton: FloatingActionButton(
              child: const Icon(Icons.add),
              onPressed: navigateToAddService,
              tooltip: 'Ajouter le service',
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
          );
  }
}
