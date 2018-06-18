import 'package:flutter/material.dart';

class PhraseDetails extends StatefulWidget {
  final String phrase;
  PhraseDetails({Key key, this.phrase}) : super(key: key);
  @override
  _PhraseDetails createState() => new _PhraseDetails();
}

class _PhraseDetails extends State<PhraseDetails> {
  Widget appBarTitle = new Text(
    "300 English",
    style: new TextStyle(color: Colors.white),
  );
  Icon favoriteIcon = new Icon(
    Icons.favorite_border,
    color: Colors.white,
  );

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: buildBar(context),
      body: new Center(
        child: new RaisedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: new Text(widget.phrase),
        ),
      ),
    );
  }

  Widget buildBar(BuildContext context) {
    return new AppBar(title: appBarTitle, actions: <Widget>[
      new IconButton(
        icon: favoriteIcon,
        tooltip: this.favoriteIcon.icon == Icons.favorite_border
            ? "Add to favorites"
            : "Remove from favorites",
        onPressed: () {
          setState(() {
            if (this.favoriteIcon.icon == Icons.favorite_border) {
              this.favoriteIcon = new Icon(Icons.favorite, color: Colors.white);
            } else {
              this.favoriteIcon =
                  new Icon(Icons.favorite_border, color: Colors.white);
            }
          });
        },
      ),
    ]);
  }
}
