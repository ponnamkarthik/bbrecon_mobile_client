import 'dart:convert';

import 'package:bbrecon/models/programs_model.dart';
import 'package:bbrecon/networks/base_network.dart';
import 'package:bbrecon/networks/base_network_response.dart';
import 'package:bbrecon/utils/constants.dart';

class ProgramsManager {
  Future<ResponseData> fetchPrograms({String queryParams = ""}) async {
    final response = await dioClient.ref
        .get<dynamic>(Constants.programsEndpoint(queryParams));
    if (response != null && response.statusCode == 200) {
      final programsModel = programsModelFromMap(jsonEncode(response.data));
      return ResponseData<ProgramsModel>('', ResponseStatus.SUCCESS,
          data: programsModel);
    } else {
      try {
        return ResponseData<dynamic>(
            response.data['detail'][0]['msg'], ResponseStatus.FAILED);
      } catch (err) {
        return ResponseData<dynamic>(err.toString(), ResponseStatus.FAILED);
      }
    }
  }
}

final programsManager = ProgramsManager();
