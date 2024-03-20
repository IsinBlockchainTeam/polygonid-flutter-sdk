import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:polygonid_flutter_sdk/proof/data/data_sources/prover_lib_data_source.dart';

import '../../../common/common_mocks.dart';
import '../../../common/proof_mocks.dart';
import 'prover_lib_data_source_test.mocks.dart';

MockProverLibWrapper proverLibWrapper = MockProverLibWrapper();

ProverLibDataSource dataSource = ProverLibDataSource(proverLibWrapper);

Map<String, dynamic> mockProverRes = {
  'circuitId': 'auth',
  'proof': 'proof',
  'pub_signals': 'pub_signals',
};

@GenerateMocks([ProverLibWrapper])
main() {
  group('Prover', () {
    setUp(() {
      reset(proverLibWrapper);

      when(proverLibWrapper.prover(
        circuitId: any,
        zKeyPath: any,
        wtnsBytes: any,
      )).thenAnswer((realInvocation) => Future.value(mockProverRes));
    });

    test(
      'Given a zkeyBytes and WtnsBytes, when call prover, we expect a Map to be returned',
      () async {
        expect(
            await dataSource.prove(
              circuitId: CommonMocks.circuitId,
              zKeyPath: ProofMocks.zKeyPath,
              wtnsBytes: ProofMocks.datFile,
            ),
            mockProverRes);

        var captured = verify(proverLibWrapper.prover(
          circuitId: captureAny,
          zKeyPath: captureAny,
          wtnsBytes: captureAny,
        )).captured;
        expect(captured[0], CommonMocks.circuitId);
        expect(captured[1], ProofMocks.zKeyPath);
        expect(captured[2], ProofMocks.datFile);
      },
    );
  });
}
