import 'dart:typed_data';

class CircuitDataEntity {
  final String circuitId;
  final Uint8List datFile;
  final String zKeyPath;

  CircuitDataEntity({
    required this.circuitId,
    required this.datFile,
    required this.zKeyPath,
  });

  factory CircuitDataEntity.fromJson(Map<String, dynamic> json) {
    return CircuitDataEntity(
      circuitId: json['circuitId'] as String,
      datFile: json['datFile'] as Uint8List,
      zKeyPath: json['zKeyPath'] as String,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'circuitId': circuitId,
      'datFile': datFile,
      'zKeyPath': zKeyPath,
    };
  }

  @override
  String toString() {
    return 'CircuitDataEntity{circuitId: $circuitId, datFile: $datFile, zKeyFile: $zKeyPath}';
  }
}
