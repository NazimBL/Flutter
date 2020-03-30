import 'package:flutter/material.dart';
import 'package:autocomplete_textfield/autocomplete_textfield.dart';

class SearchField extends StatefulWidget{
  @override
  SearchFieldState createState() =>new SearchFieldState();

}

class SearchFieldState extends State<SearchField>{
  List<String> added = [];
  String currentText = "";
  GlobalKey<AutoCompleteTextFieldState<String>> key = new GlobalKey();

  SearchFieldState() {
    textField = SimpleAutoCompleteTextField(
      key: key,
      suggestions: suggestions,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 32.0,vertical: 14.0),
        hintText: "Yo, What are you looking for ?",
        suffixIcon: Material(
            elevation: 5.0,
            borderRadius: BorderRadius.circular(30.0),
            child:Icon(
                Icons.search,
                color: Colors.black
            )
        ),
      ),
      textChanged: (text) => currentText = text,
      clearOnSubmit: true,
      textSubmitted: (text) => setState(() {
        if (text != "") {
          added.add(text);
        }
      }),
    );
  }

  SimpleAutoCompleteTextField textField;

  @override
  Widget build(BuildContext context) {

    Column body = new Column(children: [
      new ListTile(
          title: textField),
    ]);

    return Container(
        margin: EdgeInsets.only(top: 20.0),
     child: Material(
         elevation: 5.0,
         borderRadius: BorderRadius.circular(30.0),
      child: body
    )
    );
  }
}

List<String> suggestions = [
  "Apple",
  "Armidillo",
  "Actual",
  "Actuary",
  "America",
  "Argentina",
  "Australia",
  "Antarctica",
  "Blueberry",
  "Cheese",
  "Danish",
  "Eclair",
  "Fudge",
  "Granola",
  "Hazelnut",
  "Ice Cream",
  "Jely",
  "Kiwi Fruit",
  "Lamb",
  "Macadamia",
  "Nachos",
  "Oatmeal",
  "Palm Oil",
  "Quail",
  "Rabbit",
  "Salad",
  "T-Bone Steak",
  "Urid Dal",
  "Vanilla",
  "Waffles",
  "Yam",
  "Zest"
];
