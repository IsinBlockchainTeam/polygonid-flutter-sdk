import 'dart:typed_data';

class ProveParam {
  final String circuitId;
  final String zKeyPath;
  final Uint8List wtns;

  ProveParam({
    required this.circuitId,
    required this.zKeyPath,
    required this.wtns,
  });
}
