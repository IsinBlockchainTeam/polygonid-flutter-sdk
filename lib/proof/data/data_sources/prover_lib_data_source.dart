import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:polygonid_flutter_sdk/proof/data/dtos/prove_param.dart';
import 'package:polygonid_flutter_sdk/proof/libs/prover/prover.dart';

@injectable
class ProverLibWrapper {
  Future<Map<String, dynamic>?> prover({
    required String circuitId,
    required String zKeyPath,
    required Uint8List wtnsBytes,
  }) {
    return compute(
      _computeProve,
      ProveParam(
        circuitId: circuitId,
        zKeyPath: zKeyPath,
        wtns: wtnsBytes,
      ),
    );
  }
}

///
Future<Map<String, dynamic>?> _computeProve(ProveParam param) {
  ProverLib proverLib = ProverLib();
  return proverLib.prove(
    circuitId: param.circuitId,
    zkeyPath: param.zKeyPath,
    wtnsBytes: param.wtns,
  );
}

class ProverLibDataSource {
  final ProverLibWrapper _proverLibWrapper;

  ProverLibDataSource(this._proverLibWrapper);

  ///
  Future<Map<String, dynamic>?> prove({
    required String circuitId,
    required String zKeyPath,
    required Uint8List wtnsBytes,
  }) async {
    return _proverLibWrapper.prover(
      circuitId: circuitId,
      zKeyPath: zKeyPath,
      wtnsBytes: wtnsBytes,
    );
  }
}
