import 'package:timeago/timeago.dart' as timeago;

// ignore: avoid_classes_with_only_static_members
class Constants {
  static String baseUrl = "https://api.bugbountyrecon.com";

  static String programsEndpoint(String query) =>
      "/v0b/programs${query.isNotEmpty ? '?$query' : ''}";
  static String domainsEndpoint(String query) =>
      "/v0b/domains${query.isNotEmpty ? '?$query' : ''}";
  static String notificationsEndpoint(String query) =>
      "/v0b/notifications${query.isNotEmpty ? '?$query' : ''}";
  static String deleteNotificationEndpoint(String id) =>
      "/v0b/notifications/$id";
}

class DateUtils {
  static String dateTimeAgo(DateTime date) {
    if (date == null) {
      return "";
    }
    return timeago.format(date, allowFromNow: true);
  }
}
