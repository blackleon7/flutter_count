import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Counter App',
      theme: ThemeData(),
      home: MyHomePage(title: 'Counter App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      if (_counter > 0) _counter--; //이렇게는 왜 작성하는거지?
    });
  }

  void _reset() {
    setState(() {
      _counter = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[350],
        title: Text(
          widget.title,
          style: TextStyle(
            color: Colors.black87,
            fontSize: 20,
            fontWeight: FontWeight.w800,
            wordSpacing: 5,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '$_counter',
              style: TextStyle(
                color: Colors.black87,
                fontSize: 60,
                fontWeight: FontWeight.w800,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            RaisedButton(
              color: Colors.grey[350],
              elevation: 5.0,
              onPressed: () {
                print('Reset Button');
                HapticFeedback.heavyImpact();
                _reset();
              },
              child: Text(
                'RESET',
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(20),
              child: FloatingActionButton(
                elevation: 5.0,
                backgroundColor: Colors.grey[350],
                child: Icon(Icons.remove),
                onPressed: () {
                  print('- Button');
                  HapticFeedback.heavyImpact();
                  _decrementCounter();
                },
              ),
            ),
            SizedBox(
              width: 5,
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: FloatingActionButton(
                elevation: 5.0,
                backgroundColor: Colors.grey[400],
                child: Icon(Icons.add),
                onPressed: () {
                  print('+ Button');
                  HapticFeedback.heavyImpact();
                  _incrementCounter();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
