import 'package:flutter/material.dart';
import 'backdrop.dart';
import 'menu.dart';
import 'phrase_listing.dart';

void main() => runApp(ThreeHundredApp());

class ThreeHundredApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _ThreeHundredApp createState() => new _ThreeHundredApp();
}

class _ThreeHundredApp extends State<ThreeHundredApp> {
  MenuCategory _currentCategory = MenuCategory.all;
  String _frontSubTitle = "All";

  void _onCategoryTap(MenuCategory category) {
    setState(() {
      _currentCategory = category;

      if (_currentCategory == MenuCategory.all) {
        _frontSubTitle = "All";
      } else if (_currentCategory == MenuCategory.favorites) {
        _frontSubTitle = "Favorites";
      } else {
        _frontSubTitle = "About";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "300 English",
      theme: new ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or press Run > Flutter Hot Reload in IntelliJ). Notice that the
        // counter didn't reset back to zero; the application is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: Backdrop(
        currentCategory: MenuCategory.all,
        frontLayer: PhraseListing(),
        backLayer: Menu(
          currentCategory: _currentCategory,
          onCategoryTap: _onCategoryTap,
        ),
        frontTitle: Text("300 English"),
        frontSubTitle: _frontSubTitle,
        backTitle: Text("Menu"),
      )
    );
  }
}
