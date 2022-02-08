import 'package:flutter/material.dart';
import 'package:meu_delivery/app/core/ui/meu_delivery_ui.dart';
import 'package:meu_delivery/app/core/ui/widgets/delivery_appbar.dart';
import 'package:meu_delivery/app/core/ui/widgets/delivery_button.dart';
import 'package:meu_delivery/app/core/ui/widgets/delivery_textformfield.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

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
                          DeliveryTextformfield(label: 'E-mail'),
                          const SizedBox(
                            height: 30,
                          ),
                          DeliveryTextformfield(label: 'Senha'),
                          const SizedBox(
                            height: 50,
                          ),
                          Center(
                            child: DeliveryButton(
                                width: double.infinity,
                                onPressed: () {},
                                label: 'ENTRAR'),
                          ),
                          const Spacer(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text('Não possui uma conta?'),
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
