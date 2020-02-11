import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class AppState with ChangeNotifier {
  String _dataUrl = "https://reqres.in/api/users?per_page=10"; // API URL

  AppState();

  String _displayText = "";
  String _jsonResonse = "";
  bool _isFetching = false;

  bool get isFetching =>
      _isFetching; // It is checking whether data is fetched from the server or not yet.

  Future<void> fetchData() async {
    _isFetching = true;
    notifyListeners();

    var response = await http.get(_dataUrl);
    if (response.statusCode == 200) {
      _jsonResonse = response.body;
    }

    _isFetching = false;
    notifyListeners();
  }

  String get getResponseText =>
      _jsonResonse; // Storing the API response from jsonResponse to a getResponseText

  List<dynamic> getResponseJson() {
    if (_jsonResonse.isNotEmpty) {
      Map<String, dynamic> json = jsonDecode(_jsonResonse);
      // print(json['data']['avatar']);
      return json['data'];
    }
    return null;
  }

  void setDisplayText(String text) {
    _displayText = text;
    notifyListeners();
  }

  String get getDisplayText => _displayText;
}
