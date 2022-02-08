import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

abstract class DeliveryState<S extends StatefulWidget, C extends GetxController>
    extends State<S> {
  C get controller => Get.find();
}
