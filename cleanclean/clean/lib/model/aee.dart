// import 'dart:convert';

// Reserve reserveFromJson(String str) => Reserve.fromJson(json.decode(str));

// String reserveToJson(Reserve data) => json.encode(data.toJson());

class Reserve {
  String id;
  String email;
  String first_name;
  String last_name;

  Reserve({
    required this.id,
    required this.email,
    required this.first_name,
    required this.last_name,
  });

  factory Reserve.fromJson(Map<String, dynamic> json) {
    return Reserve(
      id: json["id"],
      email: json["email"],
      first_name: json["first_name"],
      last_name: json["last_name"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "email": email,
      "first_name": first_name,
      "last_name": last_name,
    };
  }
}