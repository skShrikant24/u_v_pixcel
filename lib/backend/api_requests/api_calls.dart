import 'dart:convert';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class RemovebgCall {
  static Future<ApiCallResponse> call({
    String? imageFileB64 = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'removebg',
      apiUrl: 'https://api.remove.bg/v1.0/removebg',
      callType: ApiCallType.POST,
      headers: {
        'X-Api-Key': 'JpDXWo589P6koDet6dBhJSCq',
      },
      params: {
        'image_file_b64': imageFileB64,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class GetPincodeCall {
  static Future<ApiCallResponse> call({
    String? pincode = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'getPincode',
      apiUrl: 'https://pincode-bc3n.onrender.com/pincode',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'pincode': pincode,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class RemoveCall {
  static Future<ApiCallResponse> call({
    String? image = '',
  }) async {
    final ffApiRequestBody = '''
{
  "image": "$image"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'remove',
      apiUrl:
          'https://asia-south1-uvpixcel.cloudfunctions.net/removeBg/removeImageBg',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class PayAPICall {
  static Future<ApiCallResponse> call({
    String? merchantId = '',
    String? merchantTransactionId = '',
    String? merchantUserId = '',
    double? amount,
    String? redirectUrl = '',
    String? redirectMode = '',
    String? callbackUrl = '',
    int? mobileNumber,
    String? type = '',
  }) async {
    final ffApiRequestBody = '''
{
  "merchantId": "$merchantId",
  "merchantTransactionId": "$merchantTransactionId",
  "merchantUserId": "$merchantUserId",
  "amount": $amount,
  "redirectUrl": "$redirectUrl",
  "redirectMode": "$redirectMode",
  "callbackUrl": "$callbackUrl",
  "mobileNumber": $mobileNumber,
  "type": "$type"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'payAPI',
      apiUrl:
          'https://asia-south1-uvpixcel.cloudfunctions.net/Phonepe-PayAPI/payAPI',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class CheckStatusCall {
  static Future<ApiCallResponse> call({
    String? merchantId = '',
    String? merchantTransactionId = '',
  }) async {
    final ffApiRequestBody = '''
{
  "merchantId": "$merchantId",
  "merchantTransactionId": "$merchantTransactionId"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'checkStatus',
      apiUrl:
          'https://asia-south1-uvpixcel.cloudfunctions.net/Phonepe-PayAPI/payAPI/status',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return isList ? '[]' : '{}';
  }
}
