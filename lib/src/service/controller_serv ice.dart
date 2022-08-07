import 'package:blood_app/src/controller/config_controller.dart';
import 'package:get/get.dart';


class BaseController {
  final configC = Get.put(ConfigController());
}
