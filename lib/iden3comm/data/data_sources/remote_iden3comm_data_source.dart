import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:dio_cache_interceptor_hive_store/dio_cache_interceptor_hive_store.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:polygonid_flutter_sdk/common/data/exceptions/network_exceptions.dart';
import 'package:polygonid_flutter_sdk/common/domain/domain_logger.dart';
import 'package:polygonid_flutter_sdk/common/domain/error_exception.dart';
import 'package:polygonid_flutter_sdk/common/infrastructure/stacktrace_stream_manager.dart';
import 'package:polygonid_flutter_sdk/common/utils/pinata_gateway_utils.dart';
import 'package:polygonid_flutter_sdk/credential/data/dtos/claim_dto.dart';
import 'package:polygonid_flutter_sdk/iden3comm/data/dtos/credential/response/fetch_claim_response_dto.dart';
import 'package:polygonid_flutter_sdk/iden3comm/domain/exceptions/iden3comm_exceptions.dart';

class RemoteIden3commDataSource {
  final Dio dio;
  final http.Client client;
  final StacktraceManager _stacktraceManager;

  RemoteIden3commDataSource(
    this.dio,
    this.client,
    this._stacktraceManager,
  );

  Future<Response> authWithToken({
    required String token,
    required String url,
  }) async {
    Uri? uri = Uri.tryParse(url);
    if (uri == null) {
      _stacktraceManager
          .addError('authWithToken error: url is invalid\nurl: $url');
      throw NetworkException(
        errorMessage: "url is invalid",
        statusCode: 0,
      );
    }

    try {
      final response = await dio.post(
        url,
        data: token,
        options: Options(
          headers: {
            HttpHeaders.acceptHeader: '*/*',
            HttpHeaders.contentTypeHeader: 'text/plain',
          },
        ),
      );

      if (response.statusCode != 200) {
        logger().d(
            'Auth Error: code: ${response.statusCode} msg: ${response.data}');
        _stacktraceManager.addError(
            'Auth Error: $url response with\ncode: ${response.statusCode}\nmsg: ${response.data}');
        throw NetworkException(
          errorMessage: response.data,
          statusCode: response.statusCode ?? 0,
        );
      } else {
        return response;
      }
    } catch (e) {
      logger().e('authWithToken error: $e');
      rethrow;
    }
  }

  Future<ClaimDTO> refreshCredential({
    required String authToken,
    required String url,
    required,
    required String profileDid,
  }) async {
    Uri? uri = Uri.tryParse(url);
    if (uri == null) {
      _stacktraceManager
          .addError('refreshCredential error: url is invalid\nurl: $url');
      throw NetworkException(errorMessage: "Invalid url", statusCode: 0);
    }

    http.Response response = await client.post(
      uri,
      body: authToken,
      headers: {
        HttpHeaders.acceptHeader: '*/*',
        HttpHeaders.contentTypeHeader: 'text/plain',
      },
    );

    if (response.statusCode != 200) {
      logger().d(
          'refreshCredential Error: code: ${response.statusCode} msg: ${response.body}');
      _stacktraceManager.addError(
          'refreshCredential Error: $url response with\ncode: ${response.statusCode}\nmsg: ${response.body}');
      throw NetworkException(
          errorMessage: response.body, statusCode: response.statusCode);
    } else {
      FetchClaimResponseDTO fetchResponse =
          FetchClaimResponseDTO.fromJson(json.decode(response.body));

      if (fetchResponse.type == FetchClaimResponseType.issuance) {
        return ClaimDTO(
          id: fetchResponse.credential.id,
          issuer: fetchResponse.from,
          did: profileDid,
          type: fetchResponse.credential.credentialSubject.type,
          expiration: fetchResponse.credential.expirationDate,
          info: fetchResponse.credential,
          credentialRawValue: response.body,
        );
      } else {
        _stacktraceManager.addTrace(
            "[RemoteIden3commDataSource] fetchClaim: UnsupportedFetchClaimTypeException");
        _stacktraceManager.addError(
            "[RemoteIden3commDataSource] fetchClaim: UnsupportedFetchClaimTypeException");
        throw UnsupportedFetchClaimTypeException(
          type: fetchResponse.type.name,
          errorMessage:
              'Unsupported fetch claim type: ${fetchResponse.type.name}\nShould be ${FetchClaimResponseType.issuance.name}',
        );
      }
    }
  }

  Future<ClaimDTO> fetchClaim({
    required String authToken,
    required String url,
    required String did,
  }) {
    _stacktraceManager.addTrace(
        "[RemoteIden3commDataSource] fetchClaim: did:$did\nurl: $url\nauthToken: $authToken");
    logger().i(
        "[RemoteIden3commDataSource] fetchClaim: did:$did\nurl: $url\nauthToken: $authToken");
    return Future.value(Uri.parse(url))
        .then((uri) => client.post(
              uri,
              body: authToken,
              headers: {
                HttpHeaders.acceptHeader: '*/*',
                HttpHeaders.contentTypeHeader: 'text/plain',
              },
            ))
        .then((response) {
      logger()
          .d("fetchClaim: code: ${response.statusCode} msg: ${response.body}");
      _stacktraceManager.addTrace(
          "[RemoteIden3commDataSource] fetchClaim: ${response.statusCode} ${response.body}");
      if (response.statusCode == 200) {
        Map<String, dynamic> jsonResponse = json.decode(response.body);
        final fetchResponse = FetchClaimResponseDTO.fromJson(jsonResponse);

        if (fetchResponse.type == FetchClaimResponseType.issuance) {
          logger().i(
              "[RemoteIden3commDataSource] fetchClaim: ${fetchResponse.credential.toJson()}");
          final claimDTO = ClaimDTO(
            id: fetchResponse.credential.id,
            issuer: fetchResponse.from,
            did: did,
            type: fetchResponse.credential.credentialSubject.type,
            expiration: fetchResponse.credential.expirationDate,
            info: fetchResponse.credential,
            credentialRawValue: response.body,
          );
          logger().i(
              "[RemoteIden3commDataSource] fetchClaim: ${claimDTO.info.toJson()}");
          return claimDTO;
        } else {
          _stacktraceManager.addTrace(
              "[RemoteIden3commDataSource] fetchClaim: UnsupportedFetchClaimTypeException");
          _stacktraceManager.addError(
              "[RemoteIden3commDataSource] fetchClaim: UnsupportedFetchClaimTypeException");
          throw UnsupportedFetchClaimTypeException(
            type: fetchResponse.type.name,
            errorMessage:
                'Unsupported fetch claim type: ${fetchResponse.type.name}\nShould be ${FetchClaimResponseType.issuance.name}',
          );
        }
      } else {
        logger().d(
            'fetchClaim Error: code: ${response.statusCode} msg: ${response.body}');
        _stacktraceManager.addError(
            'fetchClaim Error: $url response with\ncode: ${response.statusCode}\nmsg: ${response.body}');
        throw NetworkException(
          errorMessage: response.body,
          statusCode: response.statusCode,
        );
      }
    });
  }

  Future<Map<String, dynamic>> fetchSchema({required String url}) async {
    try {
      String schemaUrl = url;

      if (schemaUrl.toLowerCase().startsWith("ipfs://")) {
        String fileHash = schemaUrl.replaceFirst("ipfs://", "");

        String? pinataGatewayUrl =
            await PinataGatewayUtils().retrievePinataGatewayUrlFromEnvironment(
          fileHash: fileHash,
        );

        if (pinataGatewayUrl != null) {
          schemaUrl = pinataGatewayUrl;
        } else {
          schemaUrl = "https://ipfs.io/ipfs/$fileHash";
        }
      }

      var schemaUri = Uri.parse(schemaUrl);
      _stacktraceManager.addTrace(
          "[RemoteIden3commDataSource] fetchSchema original url: $url");
      logger().i(
          "[RemoteIden3commDataSource] fetchSchema original url: $url\nschemaUrl: $schemaUrl");

      Dio dio = Dio();
      final dir = await getApplicationDocumentsDirectory();
      final path = dir.path;
      dio.interceptors.add(
        DioCacheInterceptor(
          options: CacheOptions(
            store: HiveCacheStore(path),
            policy: CachePolicy.request,
            hitCacheOnErrorExcept: [],
            maxStale: const Duration(days: 14),
            priority: CachePriority.high,
          ),
        ),
      );

      final schemaResponse = await dio.get(schemaUri.toString());
      logger().d(
          'fetchSchema: code: ${schemaResponse.statusCode} msg: ${schemaResponse.data}');
      _stacktraceManager.addTrace(
          "[RemoteIden3commDataSource] fetchSchema: ${schemaResponse.statusCode} ${schemaResponse.data}");
      if (schemaResponse.statusCode == 200 ||
          schemaResponse.statusCode == 304) {
        Map<String, dynamic> schema = {};
        bool isMap = schemaResponse.data is Map<String, dynamic>;
        if (!isMap) {
          schema = json.decode(schemaResponse.data);
        } else {
          schema = schemaResponse.data;
        }

        return schema;
      } else {
        _stacktraceManager.addTrace(
            "[RemoteIden3commDataSource] fetchSchema: ${schemaResponse.statusCode} ${schemaResponse.data}");
        _stacktraceManager.addError(
            "[RemoteIden3commDataSource] fetchSchema: ${schemaResponse.statusCode} ${schemaResponse.data}");
        throw NetworkException(
          errorMessage: schemaResponse.data.toString(),
          statusCode: schemaResponse.statusCode ?? 0,
        );
      }
    } on PolygonIdSDKException catch (_) {
      rethrow;
    } catch (error) {
      _stacktraceManager
          .addTrace("[RemoteIden3commDataSource] fetchSchema: $error");
      _stacktraceManager
          .addError("[RemoteIden3commDataSource] fetchSchema: $error");
      throw FetchSchemaException(
        error: error,
        errorMessage: 'Error while fetching schema',
      );
    }
  }

  Future<Map<String, dynamic>> fetchDisplayType({required String url}) async {
    try {
      String displayTypeUrl = url;

      if (displayTypeUrl.toLowerCase().startsWith("ipfs://")) {
        String ipfsHash = displayTypeUrl.replaceFirst("ipfs://", "");

        String? pinataGatewayUrl =
            await PinataGatewayUtils().retrievePinataGatewayUrlFromEnvironment(
          fileHash: ipfsHash,
        );

        if (pinataGatewayUrl != null) {
          displayTypeUrl = pinataGatewayUrl;
        } else {
          displayTypeUrl = "https://ipfs.io/ipfs/$ipfsHash";
        }
      }

      final displayTypeUri = Uri.parse(displayTypeUrl);
      _stacktraceManager.addTrace(
          "[RemoteIden3commDataSource] fetchDisplayType original url: $url");

      final dio = Dio();
      final dir = await getApplicationDocumentsDirectory();
      final path = dir.path;
      dio.interceptors.add(
        DioCacheInterceptor(
          options: CacheOptions(
            store: HiveCacheStore(path),
            policy: CachePolicy.request,
            hitCacheOnErrorExcept: [],
            maxStale: const Duration(days: 14),
            priority: CachePriority.high,
          ),
        ),
      );

      final response = await dio.get(displayTypeUri.toString());
      _stacktraceManager.addTrace(
          "[RemoteIden3commDataSource] fetchDisplayType: ${response.statusCode} ${response.data}");
      if (response.statusCode == 200 || response.statusCode == 304) {
        Map<String, dynamic> data = {};
        bool isMap = response.data is Map<String, dynamic>;
        if (!isMap) {
          data = json.decode(response.data);
        } else {
          data = response.data;
        }

        return data;
      } else {
        _stacktraceManager.addTrace(
            "[RemoteIden3commDataSource] fetchDisplayType: ${response.statusCode} ${response.data}");
        _stacktraceManager.addError(
            "[RemoteIden3commDataSource] fetchDisplayType: ${response.statusCode} ${response.data}");
        throw NetworkException(
          errorMessage: response.data.toString(),
          statusCode: response.statusCode ?? 0,
        );
      }
    } catch (error) {
      _stacktraceManager
          .addTrace("[RemoteIden3commDataSource] fetchDisplayType: $error");
      _stacktraceManager
          .addError("[RemoteIden3commDataSource] fetchDisplayType: $error");
      throw FetchDisplayTypeException(
          error: error, errorMessage: error.toString());
    }
  }

  ///
  Future<void> cleanSchemaCache() async {
    final dir = await getApplicationDocumentsDirectory();
    final path = dir.path;
    await HiveCacheStore(path).clean();
    return;
  }
}
