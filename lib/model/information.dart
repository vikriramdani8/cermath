class Classes {
  final int id;
  final String value;

  Classes({
    required this.id,
    required this.value
  });

  factory Classes.fromJson(dynamic json){
    return Classes(
      id: json['class_id'] ?? "",
      value: json['class_name'] ?? ""
    );
  }
}

class Gender {
  final int id;
  final String value;

  Gender({
    required this.id,
    required this.value
  });

  factory Gender.fromJson(dynamic json){
    return Gender(
      id: json['gender_id'] ?? "",
      value: json['gender_name'] ?? ""
    );
  }
}

class UserTypes {
  final int id;
  final String value;

  UserTypes({
    required this.id,
    required this.value
  });

  factory UserTypes.fromJson(dynamic json){
    return UserTypes(
        id: json['usertype_id'] ?? "",
        value: json['usertype_name'] ?? ""
    );
  }
}