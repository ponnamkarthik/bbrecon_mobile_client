import 'dart:convert';

DomainsModel domainsModelFromMap(String str) =>
    DomainsModel.fromMap(json.decode(str));

String domainsModelToMap(DomainsModel data) => json.encode(data.toMap());

class DomainsModel {
  DomainsModel({
    this.data,
    this.nextPage,
  });

  List<DomainItem> data;
  int nextPage;

  factory DomainsModel.fromMap(Map<String, dynamic> json) => DomainsModel(
        data: json["data"] == null
            ? null
            : List<DomainItem>.from(
                json["data"].map((x) => DomainItem.fromMap(x))),
        nextPage: json["nextPage"] == null ? null : json["nextPage"],
      );

  Map<String, dynamic> toMap() => {
        "data": data == null
            ? null
            : List<dynamic>.from(data.map((x) => x.toMap())),
        "nextPage": nextPage == null ? null : nextPage,
      };
}

class DomainItem {
  DomainItem({
    this.program,
    this.name,
    this.createdAt,
  });

  String program;
  String name;
  DateTime createdAt;

  factory DomainItem.fromMap(Map<String, dynamic> json) => DomainItem(
        program: json["program"] == null ? null : json["program"],
        name: json["name"] == null ? null : json["name"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
      );

  Map<String, dynamic> toMap() => {
        "program": program == null ? null : program,
        "name": name == null ? null : name,
        "createdAt": createdAt == null ? null : createdAt.toIso8601String(),
      };
}
