class User {
  String? email;
  Metadata? metadata;

  User({this.email, this.metadata});

  User.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    metadata =
        json['metadata'] != null ? Metadata.fromJson(json['metadata']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    if (metadata != null) {
      data['metadata'] = metadata!.toJson();
    }
    return data;
  }
}

class Metadata {
  String? sub;
  String? name;
  String? email;
  String? image;
  String? description;
  bool? emailVerified;
  bool? phoneVerified;

  Metadata(
      {this.sub,
      this.name,
      this.email,
      this.image,
      this.description,
      this.emailVerified,
      this.phoneVerified});

  Metadata.fromJson(Map<String, dynamic> json) {
    sub = json['sub'];
    name = json['name'];
    email = json['email'];
    image = json['image'];
    description = json['description'];
    emailVerified = json['email_verified'];
    phoneVerified = json['phone_verified'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['sub'] = sub;
    data['name'] = name;
    data['email'] = email;
    data['image'] = image;
    data['description'] = description;
    data['email_verified'] = emailVerified;
    data['phone_verified'] = phoneVerified;
    return data;
  }
}
