import 'package:hive/hive.dart';

part 'hive_model.g.dart';

@HiveType(typeId: 1)
class Blood {
  @HiveField(0)
  String id;

  @HiveField(1)
  int group;

  @HiveField(2)
  String type;

  @HiveField(3)
  double name;

  @HiveField(4)
  double number;

  @HiveField(5)
  double email;

  @HiveField(6)
  double upazila;

  @HiveField(7)
  double district;

  Blood({
    required this.id,
    required this.group,
    required this.type,
    required this.name,
    required this.number,
    required this.email,
    required this.upazila,
    required this.district,
  });
}
