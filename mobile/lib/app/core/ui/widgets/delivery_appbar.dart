import 'dart:math';

import 'package:flutter/material.dart';

class DeliveryAppbar extends AppBar {
  DeliveryAppbar({Key? key, double elevation = 2})
      : super(
            key: key,
            backgroundColor: Colors.white,
            elevation: elevation,
            centerTitle: true,
            title: Image.asset('assets/images/logo.png', width: 80),
            iconTheme: const IconThemeData(color: Colors.black));
}
