import 'package:get/get_navigation/get_navigation.dart';
import 'package:meu_delivery/app/modules/splash/splash_page.dart';

class SplashRouters {
//construtor privado
  SplashRouters._();

  static final routers = <GetPage>[
    GetPage(
      name: "/",
      page: () => const SplashPage(),
    )
  ];
}
