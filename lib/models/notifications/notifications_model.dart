import 'dart:convert';

NotificationsModel notificationsModelFromMap(String str) =>
    NotificationsModel.fromMap(json.decode(str));

String notificationsModelToMap(NotificationsModel data) =>
    json.encode(data.toMap());

class NotificationsModel {
  NotificationsModel({
    this.data,
    this.nextPage,
  });

  List<NotificationItem> data;
  int nextPage;

  factory NotificationsModel.fromMap(Map<String, dynamic> json) =>
      NotificationsModel(
        data: json["data"] == null
            ? null
            : List<NotificationItem>.from(
                json["data"].map((x) => NotificationItem.fromMap(x))),
        nextPage: json["nextPage"] == null ? null : json["nextPage"],
      );

  Map<String, dynamic> toMap() => {
        "data": data == null
            ? null
            : List<dynamic>.from(data.map((x) => x.toMap())),
        "nextPage": nextPage == null ? null : nextPage,
      };
}

class NotificationItem {
  NotificationItem({
    this.resources,
    this.program,
    this.webhook,
    this.id,
    this.createdAt,
  });

  String resources;
  String program;
  String webhook;
  String id;
  DateTime createdAt;

  factory NotificationItem.fromMap(Map<String, dynamic> json) =>
      NotificationItem(
        resources: json["resources"] == null ? null : json["resources"],
        program: json["program"] == null ? null : json["program"],
        webhook: json["webhook"] == null ? null : json["webhook"],
        id: json["id"] == null ? null : json["id"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
      );

  Map<String, dynamic> toMap() => {
        "resources": resources == null ? null : resources,
        "program": program == null ? null : program,
        "webhook": webhook == null ? null : webhook,
        "id": id == null ? null : id,
        "createdAt": createdAt == null ? null : createdAt.toIso8601String(),
      };
}
