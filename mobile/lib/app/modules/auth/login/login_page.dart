import 'package:flutter/material.dart';
import 'package:meu_delivery/app/core/ui/delivery_state.dart';
import 'package:meu_delivery/app/core/ui/meu_delivery_ui.dart';
import 'package:meu_delivery/app/core/ui/widgets/delivery_appbar.dart';
import 'package:meu_delivery/app/core/ui/widgets/delivery_button.dart';
import 'package:meu_delivery/app/core/ui/widgets/delivery_textformfield.dart';
import 'package:get/get.dart';
import 'package:meu_delivery/app/modules/auth/login/login_controller.dart';
import 'package:validatorless/validatorless.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends DeliveryState<LoginPage, LoginController> {
  final _formKey = GlobalKey<FormState>();
  final _emailEC = TextEditingController();
  final _passwordEC = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailEC.dispose();
    _passwordEC.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: DeliveryAppbar(elevation: 0),
        backgroundColor: Colors.white,
        body: LayoutBuilder(
          builder: (_, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: IntrinsicHeight(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Login',
                            style: context.textTheme.headline6?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: context.theme.primaryColorDark),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          DeliveryTextformfield(
                            label: 'E-mail',
                            controller: _emailEC,
                            validator: Validatorless.multiple([
                              Validatorless.required('E-mail obrigat??rio'),
                              Validatorless.email('E-mail inv??lido'),
                            ]),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          DeliveryTextformfield(
                            label: 'Senha',
                            obscureText: true,
                            controller: _passwordEC,
                            validator: Validatorless.multiple([
                              Validatorless.required('Senha obrigat??rio'),
                              Validatorless.min(6,
                                  'Senha deve conter pelo menos 6 caracteres.'),
                            ]),
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          Center(
                            child: DeliveryButton(
                                width: double.infinity,
                                onPressed: () {
                                  final formValid =
                                      _formKey.currentState?.validate() ??
                                          false;
                                  if (formValid) {
                                    controller.login(
                                        email: _emailEC.text,
                                        password: _passwordEC.text);
                                  }
                                },
                                label: 'ENTRAR'),
                          ),
                          const Spacer(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text('N??o possui uma conta?'),
                              TextButton(
                                  onPressed: () {
                                    Get.toNamed('/auth/register');
                                  },
                                  child: const Text(
                                    'Cadastre-se',
                                    style: MeuDeliveryUI.textBold,
                                  ))
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ));
  }
}
