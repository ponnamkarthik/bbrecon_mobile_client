import 'dart:convert';

import 'package:bbrecon/models/domains/domains_model.dart';
import 'package:bbrecon/networks/base_network.dart';
import 'package:bbrecon/networks/base_network_response.dart';
import 'package:bbrecon/utils/constants.dart';

class DomainsManager {
  Future<ResponseData> fetchDomains({String queryParams = ""}) async {
    final response = await dioClient.ref
        .get<dynamic>(Constants.domainsEndpoint(queryParams));
    if (response != null && response.statusCode == 200) {
      final domainsModel = domainsModelFromMap(jsonEncode(response.data));
      return ResponseData<DomainsModel>('', ResponseStatus.SUCCESS,
          data: domainsModel);
    } else {
      try {
        if (response.data['detail'].runtimeType == String) {
          return ResponseData<dynamic>(
              response.data['detail'], ResponseStatus.FAILED);
        }
        return ResponseData<dynamic>(
            response.data['detail'][0]['msg'], ResponseStatus.FAILED);
      } catch (err) {
        return ResponseData<dynamic>(err.toString(), ResponseStatus.FAILED);
      }
    }
  }
}

final domainsManager = DomainsManager();
