import 'dart:convert';

ProgramsModel programsModelFromMap(String str) =>
    ProgramsModel.fromMap(json.decode(str));

String programsModelToMap(ProgramsModel data) => json.encode(data.toMap());

class ProgramsModel {
  ProgramsModel({
    this.data,
    this.nextPage,
  });

  List<ProgramItem> data;
  int nextPage;

  factory ProgramsModel.fromMap(Map<String, dynamic> json) => ProgramsModel(
        data: json["data"] == null
            ? null
            : List<ProgramItem>.from(
                json["data"].map((x) => ProgramItem.fromMap(x))),
        nextPage: json["nextPage"] == null ? null : json["nextPage"],
      );

  Map<String, dynamic> toMap() => {
        "data": data == null
            ? null
            : List<dynamic>.from(data.map((x) => x.toMap())),
        "nextPage": nextPage == null ? null : nextPage,
      };
}

class ProgramItem {
  ProgramItem({
    this.url,
    this.name,
    this.platform,
    this.rewards,
    this.types,
    this.inScope,
    this.outScope,
    this.bountyCreatedAt,
    this.slug,
    this.live,
    this.averageBounty,
    this.minimumBounty,
    this.maximumBounty,
  });

  String url;
  String name;
  String platform;
  List<String> rewards;
  List<String> types;
  List<InScope> inScope;
  List<dynamic> outScope;
  DateTime bountyCreatedAt;
  String slug;
  bool live;
  int averageBounty;
  int minimumBounty;
  int maximumBounty;

  factory ProgramItem.fromMap(Map<String, dynamic> json) {
    return ProgramItem(
      url: json["url"] == null ? null : json["url"],
      name: json["name"] == null ? null : json["name"],
      platform: json["platform"] == null ? null : json["platform"],
      rewards: json["rewards"] == null
          ? null
          : List<String>.from(json["rewards"].map((x) => x)),
      types: json["types"] == null
          ? null
          : List<String>.from(json["types"].map((x) => x)),
      inScope: json["inScope"] == null
          ? null
          : List<InScope>.from(json["inScope"].map((x) => InScope.fromMap(x))),
      outScope: json["outScope"] == null
          ? null
          : List<dynamic>.from(json["outScope"].map((x) => x)),
      bountyCreatedAt: json["bountyCreatedAt"] == null
          ? null
          : DateTime.parse(json["bountyCreatedAt"]),
      slug: json["slug"] == null ? null : json["slug"],
      live: json["live"] == null ? null : json["live"],
      averageBounty:
          json["averageBounty"] == null ? null : json["averageBounty"],
      minimumBounty:
          json["minimumBounty"] == null ? null : json["minimumBounty"],
      maximumBounty:
          json["maximumBounty"] == null ? null : json["maximumBounty"],
    );
  }

  Map<String, dynamic> toMap() => {
        "url": url == null ? null : url,
        "name": name == null ? null : name,
        "platform": platform == null ? null : platform,
        "rewards":
            rewards == null ? null : List<dynamic>.from(rewards.map((x) => x)),
        "types": types == null ? null : List<dynamic>.from(types.map((x) => x)),
        "in_scope": inScope == null
            ? null
            : List<dynamic>.from(inScope.map((x) => x.toMap())),
        "out_scope": outScope == null
            ? null
            : List<dynamic>.from(outScope.map((x) => x)),
        "bountyCreatedAt":
            bountyCreatedAt == null ? null : bountyCreatedAt.toIso8601String(),
        "slug": slug == null ? null : slug,
        "live": live == null ? null : live,
        "averageBounty": averageBounty == null ? null : averageBounty,
        "minimumBounty": minimumBounty == null ? null : minimumBounty,
        "maximumBounty": maximumBounty == null ? null : maximumBounty,
      };
}

class InScope {
  InScope({
    this.type,
    this.value,
  });

  String type;
  String value;

  factory InScope.fromMap(Map<String, dynamic> json) => InScope(
        type: json["type"] == null ? null : json["type"],
        value: json["value"] == null ? null : json["value"],
      );

  Map<String, dynamic> toMap() => {
        "type": type == null ? null : type,
        "value": value == null ? null : value,
      };
}
