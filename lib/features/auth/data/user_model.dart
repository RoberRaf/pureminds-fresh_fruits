final class UserModel {
  UserModel({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    // required this.phone,
    // required this.image,
    required this.token,
  });

  final int id;
  final String email;
  final String firstName;
  final String lastName;
  // final String phone;
  // final String image;
  final String token;

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      email: json['email'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      // phone: json['phone'],
      // image: json['image'],
      token: json['token'],
    );
  }
}
