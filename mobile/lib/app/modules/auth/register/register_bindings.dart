import 'package:get/get.dart';
import 'package:meu_delivery/app/modules/auth/register/register_controller.dart';
import 'package:meu_delivery/app/repositories/auth/auth_repository.dart';
import 'package:meu_delivery/app/repositories/auth/auth_repository_impl.dart';

class RegisterBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthRepository>(() => AuthRepositoryImpl(
          restClient: Get.find(),
        ));

    Get.lazyPut(
      () => RegisterController(authRepository: Get.find()),
    );
  }
}
