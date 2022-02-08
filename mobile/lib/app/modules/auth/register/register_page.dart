import 'package:flutter/material.dart';
import 'package:meu_delivery/app/core/ui/meu_delivery_ui.dart';
import 'package:meu_delivery/app/core/ui/widgets/delivery_appbar.dart';
import 'package:get/get.dart';
import 'package:meu_delivery/app/core/ui/widgets/delivery_button.dart';
import 'package:meu_delivery/app/core/ui/widgets/delivery_textformfield.dart';
import 'package:meu_delivery/app/modules/auth/register/register_controller.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DeliveryAppbar(elevation: 0),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: IntrinsicHeight(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Cadastro',
                    style: context.textTheme.headline6?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: context.theme.primaryColorDark),
                  ),
                  Text(
                    'Preencha os campos abaixo para criar o seu cadastro.',
                    style: context.textTheme.bodyText1,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  DeliveryTextformfield(label: 'Nome'),
                  const SizedBox(
                    height: 30,
                  ),
                  DeliveryTextformfield(label: 'E-mail'),
                  const SizedBox(
                    height: 30,
                  ),
                  DeliveryTextformfield(label: 'Senha'),
                  const SizedBox(
                    height: 30,
                  ),
                  DeliveryTextformfield(label: 'Confirma senha'),
                  const SizedBox(
                    height: 50,
                  ),
                  Center(
                    child: DeliveryButton(
                        width: double.infinity,
                        onPressed: () {
                          Get.find<RegisterController>().qualquer();
                        },
                        label: 'CADASTRAR'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
