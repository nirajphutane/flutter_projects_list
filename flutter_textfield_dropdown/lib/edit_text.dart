import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_textfield_dropdown/spinner_popup.dart';

class EditText extends StatefulWidget{

  final List items;
  final int? index;

  EditText({required this.items, this.index}):
  assert(items.isNotEmpty, 'items should not be empty!');

  @override
  State<StatefulWidget> createState() => _EditTextState();
}

class _EditTextState extends State<EditText>{

  GlobalKey textKey = GlobalKey();
  GlobalKey iconKey = GlobalKey();
  int? index;
  @override
  void initState() {
    index = widget.index;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        child: Row(
          children: [
            Expanded(
              child: Autocomplete<String>(
                key: textKey,
                optionsBuilder: (TextEditingValue textEditingValue) {
                  return List<String>.generate(widget.items.length, (value) => value.toString())
                    .where((String text) => text.toLowerCase()
                    .startsWith(textEditingValue.text.toLowerCase())
                  ).toList();
                },
                displayStringForOption: (String text) => text,
              )
            ),
            Icon(Icons.arrow_drop_down_outlined, color: Colors.green,
              key: iconKey,
            ),
          ],
        ),
        onTap: (){
          Navigator.of(context).push(Spinner(
            textKey: textKey,
            iconKey: iconKey,
            items: widget.items,
            onSelected: (index, item){
              setState(() {
                this.index = index;
              });
            })
          );
        },
      ),
    );
  }
}