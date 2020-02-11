import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providerAPI/pages/responseDisplay.dart';
import 'package:providerAPI/pages/textDisplay.dart';
import 'package:providerAPI/pages/textEdit.dart';
import 'package:providerAPI/providers/appState.dart';

void main() => runApp(Unsplash());

class Unsplash extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Provider API',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.pink,
        ),
        home: ChangeNotifierProvider<AppState>(
          create: (_) => AppState(),
          child: HomePage(),
        ),
      );
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Provider'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                TextDisplay(),
                TextEditWidget(),
                MaterialButton(
                  color: Colors.pink,
                  onPressed: () => appState.fetchData(),
                  child: Text(
                    "Fetch Data from Network",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                ResponseDisplay(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
