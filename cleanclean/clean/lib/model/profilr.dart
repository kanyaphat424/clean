class UserProfile {
  String name;
  String address;
  String phone;
  String dateOfBirth;
  String sex;
  String email;
  String password1;
  String password2;
  String password3;

  UserProfile({
    required this.name,
    required this.address,
    required this.phone,
    required this.dateOfBirth,
    required this.sex,
    required this.email,
    required this.password1,
    required this.password2,
    required this.password3,
  });

  factory UserProfile.fromJson(Map<String, dynamic> json) {
    return UserProfile(
      name: json['name'],
      address: json['address'],
      phone: json['phone'],
      dateOfBirth: json['dateOfBirth'],
      sex: json['sex'],
      email: json['email'],
      password1: json['password1'],
      password2: json['password2'],
      password3: json['password3'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'address': address,
      'phone': phone,
      'dateOfBirth': dateOfBirth,
      'sex': sex,
      'email': email,
      'password1': password1,
      'password2': password2,
      'password3': password3,
    };
  }
}
