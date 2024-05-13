// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserDataModel {

  final String user_name;
  final String  password;
  final String department;
  UserDataModel({
    required this.user_name,
    required this.password,
    required this.department,
  });


  UserDataModel copyWith({
    String? user_name,
    String? password,
    String? department,
  }) {
    return UserDataModel(
      user_name: user_name ?? this.user_name,
      password: password ?? this.password,
      department: department ?? this.department,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'user_name': user_name,
      'password': password,
      'department': department,
    };
  }

  factory UserDataModel.fromMap(Map<String, dynamic> map) {
    return UserDataModel(
      user_name: map['user_name'] as String,
      password: map['password'] as String,
      department: map['department'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserDataModel.fromJson(String source) => UserDataModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'UserDataModel(user_name: $user_name, password: $password, department: $department)';

  @override
  bool operator ==(covariant UserDataModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.user_name == user_name &&
      other.password == password &&
      other.department == department;
  }

  @override
  int get hashCode => user_name.hashCode ^ password.hashCode ^ department.hashCode;
}
