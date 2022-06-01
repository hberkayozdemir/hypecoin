// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_config.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AppConfigAdapter extends TypeAdapter<AppConfig> {
  @override
  final int typeId = 0;

  @override
  AppConfig read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AppConfig(
      clientId: fields[0] as String?,
      redirectUrl: fields[1] as String?,
      authLink: fields[2] as String?,
      tokenLink: fields[3] as String?,
      tenantId: fields[4] as String?,
      hypeCoinEndPoint: fields[5] as String?,
      registrationLink: fields[6] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, AppConfig obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.clientId)
      ..writeByte(1)
      ..write(obj.redirectUrl)
      ..writeByte(2)
      ..write(obj.authLink)
      ..writeByte(3)
      ..write(obj.tokenLink)
      ..writeByte(4)
      ..write(obj.tenantId)
      ..writeByte(5)
      ..write(obj.hypeCoinEndPoint)
      ..writeByte(6)
      ..write(obj.registrationLink);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppConfigAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
