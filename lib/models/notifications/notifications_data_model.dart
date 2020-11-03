import 'package:bbrecon/models/notifications/notifications_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'notifications_data_model.freezed.dart';

@freezed
abstract class NotificationsDataModel with _$NotificationsDataModel {
  const factory NotificationsDataModel({
    @Default("") String error,
    List<NotificationItem> notifications,
    @Default(true) bool success,
    @Default(false) bool loading,
    @nullable @Default(1) int nextPage,
  }) = _NotificationsDataModel;

  const NotificationsDataModel._();
}
