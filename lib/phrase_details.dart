import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:three_hundred_english/phrase.dart';
import 'dart:math';

const MENU_ITEM_REPORT_ABUSE = "REPORT_ABUSE";

class PhraseDetails extends StatefulWidget {
  final Phrase phrase;
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
      body: ListView.builder(
        itemCount: 1,
        itemBuilder: (context, index) {
          return Column(
            children: <Widget>[
              buildPhraseCard(context),
              Container(
                child: widget.phrase.getAlternativesCount() == 0
                    ? Container()
                    : Column(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 16.0, bottom: 8.0),
                          alignment: FractionalOffset.centerLeft,
                          child: Text(
                              "Additional sentences and examples",
                              style: new TextStyle(
                                  fontWeight: FontWeight.bold
                              )
                          ),
                        ),
                        buildAdditionalList(context, widget.phrase),
                        new Container(
                            padding: EdgeInsets.only(left: 20.0, right: 4.0),
                            child: new Divider()
                        ),
                      ],
                    ),
              ),
              Container(
                child: widget.phrase.getAlternativesCount() == 0
                  ? Container()
                  : Column(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 16.0, bottom: 8.0),
                        alignment: FractionalOffset.centerLeft,
                        child: Text(
                            "Notes and Tips",
                            style: new TextStyle(
                                fontWeight: FontWeight.bold
                            )
                        )
                      ),
                      buildNoteList(context)
                    ],
                  )
              ),
            ],
          );
        },
      ),
    );
  }

  Widget buildBar(BuildContext context) {
    return new AppBar(title: appBarTitle,
      actions: <Widget>[
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
        )
      ]
    );
  }

  Widget buildPhraseCard(BuildContext context) {
    return new Card(
      child: new Column(
        children: <Widget>[
          buildPhraseTile(widget.phrase),
          new Row(
            children: <Widget>[
              new ButtonTheme.bar( // make buttons use the appropriate styles for cards
                child: new ButtonBar(
                  alignment: MainAxisAlignment.start,
                  children: <Widget>[
                    new FlatButton(
                      child: Text('COLLABORATE'),
                      onPressed: () {
                        showModalBottomSheet(
                            context: context,
                            builder: (BuildContext context) {
                              return buildSheetAddNote(context);
                            }
                        );
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget buildAdditionalList(BuildContext context, Phrase phrase) {
    return new Container(
        child: ListView(
            shrinkWrap: true,
            physics: ClampingScrollPhysics(),
            children: phrase.additionalList.map((additional) => new ListTile(
              contentPadding: EdgeInsets.only(left: 20.0, right: 20.0),
              title: Text(additional, textAlign: TextAlign.justify,),
            )).toList()
        )
    );
  }

  Widget buildNoteList(BuildContext context) {
    return new Container(
        child: ListView(
            shrinkWrap: true,
            physics: ClampingScrollPhysics(),
            children: new List.filled(15,
              Row(
                children: <Widget>[
                  Expanded(
                    child: new ListTile(
                      contentPadding: EdgeInsets.only(left: 20.0, right: 20.0),
                      title: Text("Test test test test test test test test test test test test test test.", textAlign: TextAlign.justify,),
                      subtitle: Text("by Ju", textAlign: TextAlign.justify,),
                    ),
                  ),
                  new IconButton(
                    tooltip: "Report abuse",
                    icon: Icon(
                      Icons.error,
                      size: 20.0,
                      color: Colors.grey
                    ),
                    onPressed: (){
                      //TODO open dialog -> Report Abuse?
                    }
                  )
                ],
              )
            )
        )
    );
  }

  Widget buildSheetAddNote(BuildContext context) {
    return new Container(
        child: new Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                new Expanded(
                    child: new TextField(
                      autofocus: true,
                      style: new TextStyle(
                        fontSize: 18.0,
                        color: Colors.grey[800],
                      ),
                      decoration: new InputDecoration(
                        hintText: "Add a note or tip...",
                        hintStyle: new TextStyle(color: Colors.grey[800]),
                      ),
                    )
                ),
                new IconButton(
                    icon: Icon(
                      Icons.send,
                      color: Colors.red,
                    ),
                    onPressed: () {
                      //TODO send
                      Navigator.pop(context);
                    }
                )
              ],
            )
        )
    );
  }

  void onPopupMenuItemSelected(String value) {
    if (MENU_ITEM_REPORT_ABUSE == value) {
      //TODO
    }
  }

  Widget buildPhraseTile(Phrase phrase) {
    return Container(
      padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
      child: Row(
        children: <Widget>[
          new Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
//                Text(
//                    widget.phrase.toString(),
//                    textAlign: TextAlign.justify,
//                    style: new TextStyle(
//                      fontSize: 18.0,
//                      color: Colors.grey[800],
//                    )
//                ),
                new RichText(
                  text: new TextSpan(
                    // Note: Styles for TextSpans must be explicitly defined.
                    // Child text spans will inherit styles from parent
                    style: new TextStyle(
                      fontSize: 18.0,
                      color: Colors.black,
                    ),
                    children: bla(phrase.toString(), new List()),
                  ),
                ),
                Padding(
                    padding: EdgeInsets.only(top: 4.0),
                    child: Text(
                        widget.phrase.getCategoriesAsString(usePrefix: true),
                        textAlign: TextAlign.justify,
                        style: new TextStyle(
                          fontSize: 14.0,
                          color: Colors.grey[500],
                        )
                    )
                )
              ],
            )
          )
        ],
      ),
    );
  }


  String formatDate(DateTime dateTime) {
      return "on " + DateFormat.yMMMd().format(dateTime)
          + " at " + DateFormat.jm().format(dateTime);
  }

  List<TextSpan> bla(String description, List<TextSpan> spans) {
    int index = description.indexOf(" noun/v.+ING ");
    if (index > -1) {
      spans.add(new TextSpan(text: description.substring(0, index)));
      spans.add(new TextSpan(
        text: " noun/v.+ING ",
        style: new TextStyle(
            background: new Paint()..color = Colors.primaries[new Random().nextInt(Colors.primaries.length)],
            color: Colors.white,
            fontWeight: FontWeight.bold)
      ));
      return bla(description.substring(index + 13), spans);
    } else {
      spans.add(new TextSpan(text: description));
      return spans;
    }
//
//
//    List<TextSpan> spans = phrase.description.split("v.+ING")
//        .map((text) => new TextSpan(text: text));
//
//    return new RichText(
//      text: new TextSpan(
//        // Note: Styles for TextSpans must be explicitly defined.
//        // Child text spans will inherit styles from parent
//        style: new TextStyle(
//          fontSize: 14.0,
//          color: Colors.black,
//        ),
//        children: <TextSpan>[
//          new TextSpan(text: 'Hello'),
//          new TextSpan(text: 'World', style: new TextStyle(fontWeight: FontWeight.bold)),
//        ],
//      ),
//    );
  }

}

