import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:polygonid_flutter_sdk/common/infrastructure/stacktrace_stream_manager.dart';
import 'package:polygonid_flutter_sdk/proof/domain/repositories/proof_repository.dart';
import 'package:polygonid_flutter_sdk/proof/domain/use_cases/prove_use_case.dart';

import '../../../common/common_mocks.dart';
import '../../../common/proof_mocks.dart';
import 'prove_use_case_test.mocks.dart';

MockProofRepository proofRepository = MockProofRepository();
MockStacktraceManager stacktraceManager = MockStacktraceManager();
ProveUseCase useCase = ProveUseCase(proofRepository, stacktraceManager);

// Data
ProveParam param = ProveParam(
  circuitId: CommonMocks.circuitId,
  inputs: CommonMocks.aBytes,
  zKeyPath: ProofMocks.zKeyPath,
  datFile: ProofMocks.datFile,
);

@GenerateMocks([
  ProofRepository,
  StacktraceManager,
])
void main() {
  setUp(() {
    when(proofRepository.calculateWitness(
            circuitId: any, datFile: any, atomicQueryInputs: any))
        .thenAnswer((realInvocation) => Future.value(CommonMocks.aBytes));
    when(proofRepository.prove(
      circuitId: any,
      wtnsBytes: any,
      zKeyPath: any,
    )).thenAnswer((realInvocation) => Future.value(ProofMocks.zkProof));
  });

  test(
    'Given a param, when I call execute, then I expect a ZKProof to be returned',
    () async {
      // When
      expect(await useCase.execute(param: param), ProofMocks.zkProof);

      // Then
      var capturedWitness = verify(proofRepository.calculateWitness(
        circuitId: captureAny,
        atomicQueryInputs: captureAny,
        datFile: captureAny,
      )).captured;
      expect(capturedWitness[0], param.circuitId);
      expect(capturedWitness[1], param.inputs);
      expect(capturedWitness[2], param.zKeyPath);
      expect(capturedWitness[3], param.datFile);

      var capturedProve = verify(proofRepository.prove(
        circuitId: captureAny,
        zKeyPath: captureAny,
        wtnsBytes: captureAny,
      )).captured;
      expect(capturedProve[0], param.circuitId);
      expect(capturedProve[1], CommonMocks.aBytes);
    },
  );

  test(
    'Given a param, when I call execute and an error occurred, then I expect an exception to be thrown',
    () async {
      // Given
      when(proofRepository.calculateWitness(
              circuitId: any, datFile: any, atomicQueryInputs: any))
          .thenAnswer((realInvocation) => Future.error(CommonMocks.exception));

      // When
      await expectLater(
          useCase.execute(param: param), throwsA(CommonMocks.exception));

      // Then
      var capturedWitness = verify(proofRepository.calculateWitness(
        atomicQueryInputs: captureAny,
        circuitId: captureAny,
        datFile: captureAny,
      )).captured;
      expect(capturedWitness[0], param.circuitId);
      expect(capturedWitness[1], param.inputs);
      expect(capturedWitness[2], param.zKeyPath);
      expect(capturedWitness[3], param.datFile);

      verifyNever(proofRepository.prove(
        circuitId: captureAny,
        wtnsBytes: captureAny,
        zKeyPath: captureAny,
      ));
    },
  );
}
