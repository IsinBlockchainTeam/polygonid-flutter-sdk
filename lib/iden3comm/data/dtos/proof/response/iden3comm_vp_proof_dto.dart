/*
{
  "type": "https://iden3-communication.io/authorization-response/v1",
  "data": {
    "scope": [
      {
        "type": "zeroknowledge",
        "circuit_id": "auth",
        "pub_signals": [
          "383481829333688262229762912714748186426235428103586432827469388069546950656",
          "12345"
        ],
        "proof_data": {
          "pi_a": [
            "14146277947056297753840642586002829867111675410988595047766001252156753371528",
            "14571022849315211248046007113544986624773029852663683182064313232057584750907",
            "1"
          ],
          "pi_b": [
            [
              "16643510334478363316178974136322830670001098048711963846055396047727066595515",
              "10398230582752448515583571758866992012509398625081722188208617704185602394573"
            ],
            [
              "6754852150473185509183929580585027939167256175425095292505368999953776521762",
              "4988338043999536569468301597030911639875135237017470300699903062776921637682"
            ],
            [
              "1",
              "0"
            ]
          ],
          "pi_c": [
            "17016608018243685488662035612576776697709541343999980909476169114486580874935",
            "1344455328868272682523157740509602348889110849570014394831093852006878298645",
            "1"
          ],
          "protocol": "groth16"
        }
      }
    ]
  }
}

{
  "type": "https://iden3-communication.io/authorization-request/v1",
  "data": {
    "callbackUrl": "https://auth-demo.idyllicvision.com/callback?id=27887",
    "audience": "1125GJqgw6YEsKFwj63GY87MMxPL9kwDKxPUiwMLNZ",
    "scope": [
      {
        "circuit_id": "auth",
        "type": "zeroknowledge",
        "rules": {
          "audience": "1125GJqgw6YEsKFwj63GY87MMxPL9kwDKxPUiwMLNZ",
          "challenge": 27887
        }
      }
    ]
  }
}

*/

import 'package:json_annotation/json_annotation.dart';

/// Sample
/// ``` "vp":{
///       "@context": ["https://www.w3.org/2018/credentials/v1"]
///       "@type": "VerifiablePresentation",
///       "verifiableCredential": {
///         "@context": [
///           "https://www.w3.org/2018/credentials/v1",
///           "https://raw.githubusercontent.com/iden3/claim-schema-vocab/main/schemas/json-ld/kyc-v3.json-ld",
///         ]
///         "type": [ "VerifiableCredential","KYCAgeCredential"],
///         "credentialSubject":{
///           "type: "KYCAgeCredential",
///           "birthday": 19960424
///         }
///       }
///     }
/// ```
///

part 'iden3comm_vp_proof_dto.g.dart';

@JsonSerializable()
class Iden3commVPProofDTO {
  @JsonKey(name: '@context')
  final List<String> context;
  @JsonKey(name: '@type')
  final String type;
  final Map<String, dynamic> verifiableCredential;

  Iden3commVPProofDTO(
      {required this.context,
      required this.type,
      required this.verifiableCredential});

  factory Iden3commVPProofDTO.fromJson(Map<String, dynamic> json) =>
      _$Iden3commVPProofDTOFromJson(json);

  Map<String, dynamic> toJson() => _$Iden3commVPProofDTOToJson(this);

  @override
  List<Object?> get props => [context, type, verifiableCredential];
}
