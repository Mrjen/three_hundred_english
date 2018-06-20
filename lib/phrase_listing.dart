import 'package:flutter/material.dart';
import 'phrase_details.dart';

class PhraseListing extends StatefulWidget {
  final String searchText;

  PhraseListing({Key key, this.searchText}) : super(key: key);
  @override
  _SearchListState createState() => new _SearchListState();
}

class _SearchListState extends State<PhraseListing> {
  List<String> _list;

  @override
  void initState() {
    super.initState();
    init();
  }

  void init() {
    _list = List();
    _list.add("Google");
    _list.add("IOS");
    _list.add("Android");
    _list.add("Dart");
    _list.add("Flutter");
    _list.add("Python");
    _list.add("React");
    _list.add("Xamarin");
    _list.add("Kotlin");
    _list.add("Java");
    _list.add("RxAndroid");
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new ListView(
          padding: new EdgeInsets.symmetric(vertical: 8.0),
          children: _buildSearchList(widget.searchText)
      ),
    );
  }

  List<ChildItem> _buildList() {
    return _list.map((contact) => new ChildItem(contact)).toList();
  }

  List<ChildItem> _buildSearchList(String searchText) {
    if (searchText == null || searchText.isEmpty) {
      return _buildList();

    } else {
      List<String> _searchList = List();
      for (int i = 0; i < _list.length; i++) {
        String name = _list.elementAt(i);
        if (name.toLowerCase().contains(searchText.toLowerCase())) {
          _searchList.add(name);
        }
      }
      return _searchList.map((contact) => new ChildItem(contact)).toList();
    }
  }

}

class ChildItem extends StatelessWidget {
  final String name;
  ChildItem(this.name);
  @override
  Widget build(BuildContext context) {
    return new ListTile(
        title: new Text(this.name),
        onTap: () {
          Navigator.push(
            context,
            new MaterialPageRoute(builder: (context) => new PhraseDetails(phrase: this.name,)),
          );
        }
    );
  }
}
