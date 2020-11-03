import 'package:bbrecon/models/notifications/notifications_data_model.dart';
import 'package:bbrecon/models/notifications/notifications_model.dart';
import 'package:bbrecon/networks/base_network_response.dart';
import 'package:bbrecon/networks/notifications/notifications_manager.dart';
import 'package:hooks_riverpod/all.dart';

class NotificationsNotifier extends StateNotifier<NotificationsDataModel> {
  NotificationsNotifier() : super(NotificationsDataModel()) {
    _init();
  }

  Future<void> _init([List<String> params]) async {
    state = state.copyWith(
      nextPage: 0,
      error: "",
      success: true,
      notifications: null,
    );
    final responseData = await notificationsManager.fetchNotifications(
        queryParams: params?.join("&") ?? "");
    if (responseData.status == ResponseStatus.SUCCESS) {
      final latestModel = responseData.data as NotificationsModel;
      state = state.copyWith(
        nextPage: latestModel.nextPage,
        error: "",
        success: true,
        notifications: [...latestModel.data],
      );
    } else {
      state = state.copyWith(
        error: responseData.message,
        success: false,
      );
    }
  }

  void reload([List<String> params]) {
    _init(params);
  }

  Future<ResponseData> deleteNotification(String id) async {
    final responseData = await notificationsManager.deleteNotification(id);
    return responseData;
  }

  Future<void> loadMore([List<String> params]) async {
    final p = params ?? [];
    p.add("page=${state.nextPage}");
    final responseData = await notificationsManager.fetchNotifications(
        queryParams: p?.join("&") ?? "");
    if (responseData.status == ResponseStatus.SUCCESS) {
      final latestModel = responseData.data as NotificationsModel;
      final notifications = state.notifications ?? [];
      if (latestModel.nextPage == state.nextPage) {
        return;
      }
      state = state.copyWith(
        nextPage: latestModel.nextPage,
        error: "",
        success: true,
        notifications: [...notifications, ...latestModel.data],
      );
    } else {
      state = state.copyWith(
        error: responseData.message,
        success: false,
      );
    }
  }
}
