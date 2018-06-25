import "package:firebase_database/firebase_database.dart";

const String ATTRIBUTE_ID = "id";
const String ATTRIBUTE_VALUE = "value";
const String ATTRIBUTE_CATEGORY_LIST = "categoryList";
const String ATTRIBUTE_ADDITIONAL_LIST = "additionalList";

class Phrase {

  String _id;
  String _value;
  List<String> _categoryList = new List();
  List<String> _additionalList = new List();

  Phrase(this._id, this._value, this._categoryList);

  Phrase.withAdditionalList(String id,
      String value,
      List<String> categoryList,
      List<String> additionalList)

      : _id = id,
        _value = value,
        _categoryList = categoryList,
        _additionalList = additionalList;

  Phrase.fromSnapshot(DataSnapshot snapshot)
      : _id = snapshot.key,
        _value = snapshot.value[ATTRIBUTE_VALUE],
        _categoryList = snapshot.value[ATTRIBUTE_CATEGORY_LIST],
        _additionalList = snapshot.value[ATTRIBUTE_ADDITIONAL_LIST];

  @override
  String toString() {
    return _id + ". " + _value;
  }

  String get id => _id;

  String get value => _value;

  List<String> get additionalList => _additionalList;

  int getCategoriesCount() {
    return _categoryList != null ? _categoryList.length : 0;
  }

  String getCategoriesAsString({bool usePrefix : false}) {
    int categoryCount = getCategoriesCount();

    return categoryCount == 0
      ? ""
      : (usePrefix ? (categoryCount > 1 ? "Categories: " : "Category: ") : "")
        + _categoryList.map((category) => category).join(", ");
  }

  int getAlternativesCount() {
    return _additionalList != null ? _additionalList.length : 0;
  }

  toJson() {
    return {
      ATTRIBUTE_ID: _id,
      ATTRIBUTE_VALUE: _value,
      ATTRIBUTE_CATEGORY_LIST: _categoryList,
      ATTRIBUTE_ADDITIONAL_LIST: _additionalList
    };
  }



}