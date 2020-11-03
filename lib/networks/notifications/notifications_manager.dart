import 'dart:convert';

import 'package:bbrecon/models/notifications/notifications_model.dart';
import 'package:bbrecon/networks/base_network.dart';
import 'package:bbrecon/networks/base_network_response.dart';
import 'package:bbrecon/utils/constants.dart';

class NotificationsManager {
  Future<ResponseData> fetchNotifications({String queryParams = ""}) async {
    final response = await dioClient.ref
        .get<dynamic>(Constants.notificationsEndpoint(queryParams));
    if (response != null && response.statusCode == 200) {
      final notificationsModel =
          notificationsModelFromMap(jsonEncode(response.data));
      return ResponseData<NotificationsModel>('', ResponseStatus.SUCCESS,
          data: notificationsModel);
    } else {
      try {
        return ResponseData<dynamic>(
            response.data['detail'][0]['msg'], ResponseStatus.FAILED);
      } catch (err) {
        return ResponseData<dynamic>(err.toString(), ResponseStatus.FAILED);
      }
    }
  }

  Future<ResponseData> createNotification(String webhook) async {
    final data = {
      "resources": "programs",
      "program": "ALL",
      "webhook": webhook
    };
    final response = await dioClient.ref
        .post<dynamic>(Constants.notificationsEndpoint(""), data: data);
    if (response != null && response.statusCode == 201) {
      return ResponseData<NotificationsModel>('', ResponseStatus.SUCCESS);
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

  Future<ResponseData> deleteNotification(String id) async {
    final response = await dioClient.ref
        .delete<dynamic>(Constants.deleteNotificationEndpoint(id));
    if (response != null && response.statusCode == 204) {
      return ResponseData<NotificationsModel>('', ResponseStatus.SUCCESS);
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

final notificationsManager = NotificationsManager();
