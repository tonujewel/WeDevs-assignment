// To parse this JSON data, do
//
//     final userDm = userDmFromJson(jsonString);

import 'dart:convert';

UserDm userDmFromJson(String str) => UserDm.fromJson(json.decode(str));

String userDmToJson(UserDm data) => json.encode(data.toJson());

class UserDm {
  UserDm({
    this.id,
    this.username,
    this.name,
    this.firstName,
    this.lastName,
    this.email,
    this.url,
    this.description,
    this.link,
    this.locale,
    this.nickname,
    this.slug,
    this.roles,
    this.registeredDate,
    this.capabilities,
    this.extraCapabilities,
    this.avatarUrls,
    this.meta,
    this.links,
  });

  int? id;
  String? username;
  String? name;
  String? firstName;
  String? lastName;
  String? email;
  String? url;
  String? description;
  String? link;
  String? locale;
  String? nickname;
  String? slug;
  List<String>? roles;
  DateTime? registeredDate;
  Capabilities? capabilities;
  ExtraCapabilities? extraCapabilities;
  Map<String, String>? avatarUrls;
  List<dynamic>? meta;
  Links? links;

  factory UserDm.fromJson(Map<String, dynamic> json) => UserDm(
    id: json["id"] == null ? null : json["id"],
    username: json["username"] == null ? null : json["username"],
    name: json["name"] == null ? null : json["name"],
    firstName: json["first_name"] == null ? null : json["first_name"],
    lastName: json["last_name"] == null ? null : json["last_name"],
    email: json["email"] == null ? null : json["email"],
    url: json["url"] == null ? null : json["url"],
    description: json["description"] == null ? null : json["description"],
    link: json["link"] == null ? null : json["link"],
    locale: json["locale"] == null ? null : json["locale"],
    nickname: json["nickname"] == null ? null : json["nickname"],
    slug: json["slug"] == null ? null : json["slug"],
    roles: json["roles"] == null ? null : List<String>.from(json["roles"].map((x) => x)),
    registeredDate: json["registered_date"] == null ? null : DateTime.parse(json["registered_date"]),
    capabilities: json["capabilities"] == null ? null : Capabilities.fromJson(json["capabilities"]),
    extraCapabilities: json["extra_capabilities"] == null ? null : ExtraCapabilities.fromJson(json["extra_capabilities"]),
    avatarUrls: json["avatar_urls"] == null ? null : Map.from(json["avatar_urls"]).map((k, v) => MapEntry<String, String>(k, v)),
    meta: json["meta"] == null ? null : List<dynamic>.from(json["meta"].map((x) => x)),
    links: json["_links"] == null ? null : Links.fromJson(json["_links"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "username": username == null ? null : username,
    "name": name == null ? null : name,
    "first_name": firstName == null ? null : firstName,
    "last_name": lastName == null ? null : lastName,
    "email": email == null ? null : email,
    "url": url == null ? null : url,
    "description": description == null ? null : description,
    "link": link == null ? null : link,
    "locale": locale == null ? null : locale,
    "nickname": nickname == null ? null : nickname,
    "slug": slug == null ? null : slug,
    "roles": roles == null ? null : List<dynamic>.from(roles!.map((x) => x)),
    "registered_date": registeredDate == null ? null : registeredDate!.toIso8601String(),
    "capabilities": capabilities == null ? null : capabilities!.toJson(),
    "extra_capabilities": extraCapabilities == null ? null : extraCapabilities!.toJson(),
    "avatar_urls": avatarUrls == null ? null : Map.from(avatarUrls!).map((k, v) => MapEntry<String, dynamic>(k, v)),
    "meta": meta == null ? null : List<dynamic>.from(meta!.map((x) => x)),
    "_links": links == null ? null : links!.toJson(),
  };
}

class Capabilities {
  Capabilities({
    this.read,
    this.level0,
    this.subscriber,
  });

  bool? read;
  bool? level0;
  bool? subscriber;

  factory Capabilities.fromJson(Map<String, dynamic> json) => Capabilities(
    read: json["read"] == null ? null : json["read"],
    level0: json["level_0"] == null ? null : json["level_0"],
    subscriber: json["subscriber"] == null ? null : json["subscriber"],
  );

  Map<String, dynamic> toJson() => {
    "read": read == null ? null : read,
    "level_0": level0 == null ? null : level0,
    "subscriber": subscriber == null ? null : subscriber,
  };
}

class ExtraCapabilities {
  ExtraCapabilities({
    this.subscriber,
  });

  bool? subscriber;

  factory ExtraCapabilities.fromJson(Map<String, dynamic> json) => ExtraCapabilities(
    subscriber: json["subscriber"] == null ? null : json["subscriber"],
  );

  Map<String, dynamic> toJson() => {
    "subscriber": subscriber == null ? null : subscriber,
  };
}

class Links {
  Links({
    this.self,
    this.collection,
  });

  List<Collection>? self;
  List<Collection>? collection;

  factory Links.fromJson(Map<String, dynamic> json) => Links(
    self: json["self"] == null ? null : List<Collection>.from(json["self"].map((x) => Collection.fromJson(x))),
    collection: json["collection"] == null ? null : List<Collection>.from(json["collection"].map((x) => Collection.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "self": self == null ? null : List<dynamic>.from(self!.map((x) => x.toJson())),
    "collection": collection == null ? null : List<dynamic>.from(collection!.map((x) => x.toJson())),
  };
}

class Collection {
  Collection({
    this.href,
  });

  String? href;

  factory Collection.fromJson(Map<String, dynamic> json) => Collection(
    href: json["href"] == null ? null : json["href"],
  );

  Map<String, dynamic> toJson() => {
    "href": href == null ? null : href,
  };
}
