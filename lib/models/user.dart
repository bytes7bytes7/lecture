class User {
  User({
    required this.id,
    required this.firstName,
    this.middleName,
    required this.lastName,
    this.photo,
  });

  late String id;
  late String firstName;
  String? middleName;
  late String lastName;
  String? photo;

  User.fromMap(Map<String, dynamic> map) {
    List<String> keys = fieldsEN;
    id = map[keys[0]];
    firstName = map[keys[1]];
    middleName = map[keys[2]];
    lastName = map[keys[3]];
    photo = map[keys[4]];
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'firstName': firstName,
      'middleName': middleName,
      'lastName': lastName,
      'photo': photo,
    };
  }

  List<String> get fieldsEN => [
        'id',
        'firstName',
        'middleName',
        'lastName',
        'photo',
      ];

  List<String> get fieldsRU => [
        'id',
        'Имя',
        'Отчество',
        'Фамилия',
        'Фото',
      ];
}
