class Admincustomerid {
  String customerid;
  String fname;
  String lname;
  String phone;
  String email;

  Admincustomerid({
    required this.customerid,
    required this.fname,
    required this.lname,
    required this.phone,
    required this.email,
  });

  factory Admincustomerid.fromJson(Map<String, dynamic> json) {
    return Admincustomerid(
      customerid: json['customerid'],
      fname: json['fname'],
      lname: json['lname'],
      phone: json['phone'],
      email: json['email'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'customerid': customerid,
      'fname': fname,
      'lname': lname,
      'phone': phone,
      'email': email,
    };
  }
}
