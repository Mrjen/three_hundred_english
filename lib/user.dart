import "package:firebase_database/firebase_database.dart";

const String ATTRIBUTE_NAME = "name";
const String ATTRIBUTE_EMAIL = "email";

class User {

  String _name;
  String _email;

  User(this._name, this._email);

  User.fromSnapshot(DataSnapshot snapshot)
      : _email = snapshot.key,
        _name = snapshot.value[ATTRIBUTE_NAME];

  String get name => _name;

  toJson() {
    return {
      ATTRIBUTE_NAME: _name,
      ATTRIBUTE_EMAIL: _email
    };
  }

}