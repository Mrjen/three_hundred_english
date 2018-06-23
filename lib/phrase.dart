import "package:firebase_database/firebase_database.dart";

const String ATTRIBUTE_ID = "id";
const String ATTRIBUTE_DESCRIPTION = "description";
const String ATTRIBUTE_CATEGORIES = "categories";
const String ATTRIBUTE_REPORTED_ABUSE = "reportedAbuse";

class Phrase {

  String _id;
  String _description;
  List<String> _categories = new List();
  bool _reportedAbuse;

  Phrase(this._id, this._description, this._categories);

  //TODO description has to be the main phrase
  //TODO create a List of author's examples (can't be edited)
  //TODO check how to style text (color some parts like v.+ING

  @override
  String toString() {
    return _id + ". " + _description;
  }

  String get id => _id;

  String get description => _description;

  int getCategoriesCount() {
    return _categories != null ? _categories.length : 0;
  }

  String getCategoriesAsString({bool usePrefix : false}) {
    int categoryCount = getCategoriesCount();

    return categoryCount == 0
      ? ""
      : (usePrefix ? (categoryCount > 1 ? "Categories: " : "Category: ") : "")
        + _categories.map((category) => category).join(", ");
  }

  toJson() {
    return {
      ATTRIBUTE_ID: _id,
      ATTRIBUTE_DESCRIPTION: _description,
      ATTRIBUTE_CATEGORIES: _categories,
      ATTRIBUTE_REPORTED_ABUSE: _reportedAbuse
    };
  }

  Phrase.fromSnapshot(DataSnapshot snapshot)
    : _id = snapshot.key,
      _description = snapshot.value[ATTRIBUTE_DESCRIPTION],
      _categories = snapshot.value[ATTRIBUTE_CATEGORIES],
      _reportedAbuse = snapshot.value[ATTRIBUTE_REPORTED_ABUSE];

}