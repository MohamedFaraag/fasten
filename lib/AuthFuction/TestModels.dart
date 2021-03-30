import 'package:flutter/material.dart';
class MultipleSelectItems extends StatefulWidget {
  @override
  _MultipleSelectItemsState createState() => _MultipleSelectItemsState();
}

class _MultipleSelectItemsState extends State<MultipleSelectItems> {

  // This is responsible to crate your buttons
  // Every button is created will be having it's unique instance only
  // Means, if you hit one button, it won't effect another, and you can select
  // multiple
  // And you don't have to declare your buttons multiple times in the code
  // Which is indeed bad way of coding :)
  List<Widget> get listTileWidgets{
    List<Widget> _widget = [SizedBox(height: 40.0)];
    List<String> _buttonName = ['First', 'Second', 'Third', 'Fourth'];

    // ListTileWidget is defined below in another StatefulWidget
    _buttonName.forEach((name){
      _widget.add(ListTileWidget(name: name));
      _widget.add(SizedBox(height: 20.0));
    });

    return _widget;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        child: Container(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: this.listTileWidgets
            )
        )
    );
  }
}


// This will accept name of the button which will be used to be given
// plus maintaining the uniqueness
class ListTileWidget extends StatefulWidget{
  final String name;

  ListTileWidget({Key key, this.name}):super(key:key);

  @override
  ListTileWidgetState createState() => ListTileWidgetState();
}

class ListTileWidgetState extends State<ListTileWidget>{
  bool isTapped = false;

  @override
  Widget build(BuildContext context){
    return GestureDetector(
        onTap: () {
          setState(() => isTapped = !isTapped);
        },
        child: Container(
            margin: EdgeInsets.only(left: 15, right: 15),
            height:100,
            color: isTapped ? Colors.redAccent : Colors.lightBlueAccent,
            width: double.maxFinite,
            child: ListTile(
                title: Text(
                    widget.name,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'WorksSansSemiBold',
                      fontWeight: FontWeight.bold,
                    )
                )
            )
        )
    );
  }
}