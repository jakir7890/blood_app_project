import 'package:blood_app/src/hive_model.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

class HiveManageController extends GetxController {
  final bloodBox = Hive.box<Blood>("bloodBox");
  manageBlood({required Map<String, dynamic> blood}) async {
    if (bloodBox.containsKey(blood["id"])) {
      bloodBox.delete(blood["id"]);
    } else {
      final data = Blood(
          id: blood["id"],
          group: blood["group"],
          district: blood["district"],
          email: blood["email"],
          name: blood["name"],
          number: blood["number"],
          type: blood["type"],
          upazila: blood["upazila"]);
          
    }
  }
}
