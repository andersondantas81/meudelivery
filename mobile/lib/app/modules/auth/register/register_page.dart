import 'package:flutter/material.dart';
import 'package:meu_delivery/app/core/ui/delivery_state.dart';
import 'package:meu_delivery/app/core/ui/widgets/delivery_appbar.dart';
import 'package:get/get.dart';
import 'package:meu_delivery/app/core/ui/widgets/delivery_button.dart';
import 'package:meu_delivery/app/core/ui/widgets/delivery_textformfield.dart';
import 'package:meu_delivery/app/modules/auth/register/register_controller.dart';
import 'package:validatorless/validatorless.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState
    extends DeliveryState<RegisterPage, RegisterController> {
  final _formKey = GlobalKey<FormState>();
  final _nameEC = TextEditingController();
  final _emailEC = TextEditingController();
  final _passwordEC = TextEditingController();

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
              key: _formKey,
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
                  DeliveryTextformfield(
                    label: 'Nome',
                    controller: _nameEC,
                    validator: Validatorless.multiple([
                      Validatorless.required("Nome obrigatório"),
                      Validatorless.min(2, 'Nome inválido')
                    ]),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  DeliveryTextformfield(
                      label: 'E-mail',
                      controller: _emailEC,
                      validator: Validatorless.multiple([
                        Validatorless.required('E-mail obrigatório'),
                        Validatorless.email('E-mail inválido')
                      ])),
                  const SizedBox(
                    height: 30,
                  ),
                  DeliveryTextformfield(
                    label: 'Senha',
                    controller: _passwordEC,
                    obscureText: true,
                    validator: Validatorless.multiple([
                      Validatorless.required('Senha obrigatório'),
                      Validatorless.min(
                          6, "Senha deve conter pelo menos 6 caracteres.")
                    ]),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  DeliveryTextformfield(
                    label: 'Confirma senha',
                    obscureText: true,
                    validator: Validatorless.multiple([
                      Validatorless.required('Confirma senha obrigatório'),
                      Validatorless.compare(_passwordEC, 'Senha diferente'),
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
                              _formKey.currentState?.validate() ?? false;
                          if (formValid) {
                            controller.register(
                                name: _nameEC.text,
                                email: _emailEC.text,
                                password: _passwordEC.text);
                          }
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
