import 'package:flutter/material.dart';

import 'phrase_listing.dart';

void main() => runApp(ThreeHundredApp());

// https://github.com/fablue/building-a-social-network-with-flutter
class ThreeHundredApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _ThreeHundredApp createState() => new _ThreeHundredApp();
}

class _ThreeHundredApp extends State<ThreeHundredApp>
    with SingleTickerProviderStateMixin{
  PageController _pageController;
  int _currentPage = 0;
  bool _showSearch = true;

  Color _appBarColor = Colors.red;
  IconButton _appBarLeadingIcon;
  Widget _appBarTitle = new Text(
    "300 English",
    style: new TextStyle(color: Colors.white),
  );
  Icon _appBarSearchIcon = new Icon(Icons.search, color: Colors.white);
  TextEditingController _searchController;
  String _searchText;

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: new ThemeData(
        primaryColor: Colors.red,
      ),
      home: new Scaffold(
        appBar: new AppBar(
            backgroundColor: _appBarColor,
            title: _appBarTitle,
            leading: _appBarLeadingIcon,
            actions: getAppBarActions(context)
        ),
        body: new PageView(
            children: [
              new PhraseListing(searchText: _searchText),
              new Container(color: Colors.green),
              new Container(color: Colors.grey)
            ],
            controller: _pageController,
            onPageChanged: onPageChanged
        ),
        bottomNavigationBar: new BottomNavigationBar(
            items: [
              new BottomNavigationBarItem(
                  icon: new Icon(Icons.library_books),
                  title: new Text("All")
              ),
              new BottomNavigationBarItem(
                  icon: new Icon(Icons.favorite),
                  title: new Text("Favorites")
              ),
              new BottomNavigationBarItem(
                  icon: new Icon(Icons.info),
                  title: new Text("About")
              ),
            ],
            onTap: onNavigationTapped,
            currentIndex: _currentPage
        ),
      ),
    );
  }

  List<Widget> getAppBarActions(BuildContext context) {
    if (_showSearch) {
      return <Widget>[
        new IconButton(
          icon: _appBarSearchIcon,
          onPressed: () {
            setState(() {
              if (this._appBarSearchIcon.icon == Icons.search) {
                this._appBarColor = Colors.grey[200];
                this._appBarLeadingIcon = new IconButton(
                  icon: new Icon(Icons.arrow_back),
                  color: Colors.grey[800],
                  onPressed: (){
                    onSearchFinished();
                  },
                );
                this._appBarSearchIcon = new Icon(
                  Icons.close,
                  color: Colors.grey[800],
                );
                this._appBarTitle = new Theme(
                  // https://stackoverflow.com/questions/48706884/change-textfields-underline-in-flutter
                    data: Theme
                        .of(context)
                        .copyWith(primaryColor: Colors.transparent),
                    child: new TextField(
                      autofocus: true,
                      controller: _searchController,
                      style: new TextStyle(
                        fontSize: 18.0,
                        color: Colors.grey[800],
                      ),
                      decoration: new InputDecoration(
                          hintText: "Filter by word...",
                          hintStyle: new TextStyle(color: Colors.grey[800]),
                          labelStyle: Theme
                              .of(context)
                              .textTheme
                              .caption
                              .copyWith(color: Colors.transparent)),
                    ));
                onSearchStarted();
              } else {
                _searchController.clear();
              }
            });
          },
        ),
      ];
    } else {
      return <Widget>[];
    }
  }

  void onSearchStarted() {}

  void onSearchFinished() {
    setState(() {
      this._appBarColor = Colors.red;
      this._appBarLeadingIcon = null;
      this._appBarSearchIcon = new Icon(
        Icons.search,
        color: Colors.white,
      );
      this._appBarTitle = new Text(
        "300 English",
        style: new TextStyle(color: Colors.white),
      );
      _searchController.clear();
    });
  }

  void onNavigationTapped(int page) {
    // Animating to the page.
    // You can use whatever duration and curve you like
    _pageController.animateToPage(page,
        duration: const Duration(milliseconds: 300), curve: Curves.ease);
  }

  void onPageChanged(int page) {
    setState(() {
      this._currentPage = page;
      this._showSearch = page < 2;
      onSearchFinished();
    });
  }

  @override
  void initState() {
    super.initState();
    _pageController = new PageController();
    _searchController = new TextEditingController();
    _searchController.addListener((){
      setState(() {
        _searchText = _searchController.text;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

}
