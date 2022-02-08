import 'package:get/get.dart';
import 'package:meu_delivery/app/core/mixins/loader_mixin.dart';
import 'package:meu_delivery/app/repositories/auth/auth_repository.dart';

class RegisterController extends GetxController with LoaderMixin {
  final AuthRepository _authRepository;

  final loading = false.obs;

  RegisterController({
    required AuthRepository authRepository,
  }) : _authRepository = authRepository;

  @override
  void onInit() {
    loaderListener(loading);
    super.onInit();
  }

  void qualquer() {
    loading.toggle();
    Future.delayed(const Duration(seconds: 2), () => loading.toggle());
  }
}
