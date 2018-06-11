import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

enum MenuCategory { all, favorites, about }

class Menu extends StatelessWidget {
  final MenuCategory currentCategory;
  final ValueChanged<MenuCategory> onCategoryTap;
  final List<MenuCategory> _categories = MenuCategory.values;

  const Menu({
    Key key,
    @required this.currentCategory,
    this.onCategoryTap,
  }) : assert(currentCategory != null);

  Widget _buildCategory(MenuCategory category, BuildContext context) {
    var categoryString =
    category.toString().replaceAll('MenuCategory.', '').toUpperCase();
    return GestureDetector(
      onTap: () => onCategoryTap(category),
      child: category == currentCategory
          ? Column(
        children: <Widget>[
          SizedBox(height: 16.0),
          Text(
            categoryString,
            style: Theme.of(context).textTheme.body2,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 14.0),
          Container(
            width: 70.0,
            height: 2.0,
            color: Color(0xFFEAA4A4),
          ),
        ],
      )
          : Container(
        padding: EdgeInsets.symmetric(vertical: 16.0),
        child: Text(
          categoryString,
          style: Theme.of(context).textTheme.body2.copyWith(
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var menuItems = <Widget>[];
    _categories.forEach((MenuCategory c) {
      menuItems.add(_buildCategory(c, context));
    });

    return Center(
      child: Container(
        padding: EdgeInsets.only(top: 40.0),
        color: Colors.blue,
        child: ListView(children: menuItems),
      ),
    );
  }
}