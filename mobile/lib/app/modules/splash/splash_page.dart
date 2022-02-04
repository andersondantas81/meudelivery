import 'package:flutter/material.dart';
import 'package:meu_delivery/app/core/ui/widgets/delivery_appbar.dart';
import 'package:meu_delivery/app/core/ui/widgets/delivery_button.dart';

import '../../core/ui/widgets/delivery_textformfield.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DeliveryAppbar(),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          const Padding(
              padding: EdgeInsets.all(8.0),
              child: DeliveryTextformfield(label: 'Texto')),
          const SizedBox(
            height: 20,
          ),
          DeliveryButton(onPressed: () {}, label: "Entrar")
        ],
      ),
    );
  }
}
