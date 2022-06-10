class Users {
  String? uid;
  String? email;
  String? firstName;
  String? lastName;
  String? phone;
  String? status;

  Users({
    this.uid,
    this.email,
    this.firstName,
    this.lastName,
    this.phone,
    this.status,
  });

  // recieving data from server
  factory Users.fromMap(user) {
    return Users(
      uid: user['uid'],
      email: user['email'],
      firstName: user['firstName'],
      lastName: user['lastName'],
      phone: user['phone'],
      status: user['status'],
    );
  }

  // sending data to server
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'firstName': firstName,
      'lastName': lastName,
      'phone': phone,
      'status': status,
    };
  }
}
