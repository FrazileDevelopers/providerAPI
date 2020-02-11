import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providerAPI/providers/appState.dart';

class TextEditWidget extends StatefulWidget {
  @override
  _TextEditWidgetState createState() => _TextEditWidgetState();
}

class _TextEditWidgetState extends State<TextEditWidget> {
  TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context); // AppState

    return Container(
      child: TextField(
        controller: _textEditingController,
        decoration: InputDecoration(
          labelText: "Some Text",
          border: OutlineInputBorder(),
        ),
        onChanged: (changed) =>
            appState.setDisplayText(changed), // Set Text On Change
        onSubmitted: (submitted) =>
            appState.setDisplayText(submitted), // Set Text On Submit
      ),
    );
  }
}
