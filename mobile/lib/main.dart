import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meu_delivery/app/routes/splash_routers.dart';

void main() {
  runApp(const MeuDeliveryMainApp());
}

class MeuDeliveryMainApp extends StatelessWidget {
  const MeuDeliveryMainApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Meu Delivery",
      getPages: [
        ...SplashRouters.routers,
      ],
    );
  }
}
