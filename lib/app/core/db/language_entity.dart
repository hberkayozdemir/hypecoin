import 'package:hive_flutter/hive_flutter.dart';

part 'language_entity.g.dart';

@HiveType(typeId: 0)
class LanguageEntity {
  LanguageEntity({required this.locale});

  @HiveField(0)
  final String locale;
}
