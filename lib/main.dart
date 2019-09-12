// import 'package:english_words/english_words.dart';
// import 'package:flutter/material.dart';

// void main() => runApp(new MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     // final wordPair = new WordPair.random();
//     return new MaterialApp(
//       title: 'Startup Name Generator',
//       theme: new ThemeData(
//         primaryColor: Colors.pink,
//       ),
//       // home: new Scaffold(
//       //   appBar: new AppBar(
//       //     title: new Text('Welcome to Flutter'),
//       //   ),
//       //   body: new Center(
//       //     // child: new Text('Hello World by Jiyr!!!'),
//       //     child: new Text(wordPair.asPascalCase),
//       //   ),
//       // ),
//       home: new RandomWrods(),
//     );
//   }
// }

// class RandomWrods extends StatefulWidget {
//   @override
//   createState() => new RandomWrodsState();
// }

// class RandomWrodsState extends State<RandomWrods> {
//   @override
//   Widget build(BuildContext context) {
//     // final wordPair = new WordPair.random();
//     return new MaterialApp(
//       title: "my flutter",
//       theme: new ThemeData(primaryColor: Colors.pink),
//       home: new Scaffold(
//         appBar: new AppBar(
//           title: new Text("ListView"),
//           actions: <Widget>[
//             new IconButton(
//               icon: new Icon(Icons.list),
//               onPressed: _pushSaved,
//             )
//           ],
//         ),
//         body: _buildSuggestions(),
//       ),
//     );
//   }

//   final _suggestions = <WordPair>[];
//   final _biggerFont = const TextStyle(fontSize: 18.0);
//   final _saved = new Set<WordPair>();

//   Widget _buildSuggestions() {
//     return new ListView.builder(
//       padding: const EdgeInsets.all(16.0),
//       itemBuilder: (context, i) {
//         if (i.isOdd) return new Divider();
//         final index = i ~/ 2;
//         if (index >= _suggestions.length) {
//           _suggestions.addAll(generateWordPairs().take(10));
//         }
//         return _buildRow(_suggestions[index]);
//       },
//     );
//   }

//   Widget _buildRow(WordPair pair) {
//     final alreadySaved = _saved.contains(pair);
//     return new ListTile(
//       title: new Text(
//         pair.asPascalCase,
//         style: _biggerFont,
//       ),
//       trailing: new Icon(
//         alreadySaved ? Icons.favorite : Icons.favorite_border,
//         color: alreadySaved ? Colors.red : null,
//       ),
//       onTap: () {
//         setState(() {
//           if (alreadySaved) {
//             _saved.remove(pair);
//           } else {
//             _saved.add(pair);
//           }
//         });
//       },
//     );
//   }

//   void _pushSaved() {
//     Navigator.of(context).push(new MaterialPageRoute(builder: (context) {
//       final tiles = _saved.map((pair) {
//         return new ListTile(
//           title: new Text(pair.asPascalCase, style: _biggerFont),
//         );
//       });
//       final divided =
//           ListTile.divideTiles(context: context, tiles: tiles).toList();
//       return new Scaffold(
//         appBar: new AppBar(
//           title: new Text("save Suggestions"),
//         ),
//         body: new ListView(children: divided),
//       );
//     }));
//   }
// }
// 中文网 这个 demo 跑不起来
// import 'package:flutter/material.dart';

// void main() => runApp(new MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return new Container(
//       padding: const EdgeInsets.all(32.0),
//       child: new Row(
//         children: <Widget>[
//           new Expanded(
//             child: new Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[
//                 new Container(
//                   padding: const EdgeInsets.only(bottom: 8.0),
//                   child: new Text(
//                     'Oeschinen Lake Campground',
//                     style: new TextStyle(fontWeight: FontWeight.bold),
//                   ),
//                 ),
//                 new Text('Kandersteg, Switzerland',
//                     style: new TextStyle(color: Colors.grey[500])),
//               ],
//             ),
//           ),
//           new Icon(Icons.star, color: Colors.red[500]),
//           new Text('41')
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: 'My Flutter',
        initialRoute: "/", //名为"/"的路由作为应用的home(首页)
        theme: new ThemeData(primaryColor: Colors.blue),
        // home: new MyHomePage(title: 'Flutter Home Page'),
        //注册路由表
        routes: {
          "tip2": (context) {
            return TipRoute(text: ModalRoute.of(context).settings.arguments);
          },
          "new_page": (context) => NewRoute(),
          "/": (context) =>
              MyHomePage(title: 'Flutter Demo Home Page'), //注册首页路由
        });
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text(
              'You have pushed the button this many times:',
            ),
            new Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
            FlatButton(
              child: Text('open new route'),
              textColor: Colors.blue,
              onPressed: () {
                // Navigator.push(context, MaterialPageRoute(builder: (context) {
                //   return NewRoute();
                // }));
                // Navigator.pushNamed(context, "new_page");
                Navigator.of(context).pushNamed("new_page", arguments: "hi");
              },
            ),
            FlatButton(
              child: Text('RouterTestRoute'),
              textColor: Colors.blue,
              onPressed: () {
                // Navigator.push(context, MaterialPageRoute(builder: (context) {
                //   return RouterTestRoute();
                // }));
                Navigator.of(context).pushNamed("tip2", arguments: "hi");
              },
            )
          ],
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: new Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class NewRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text("New route"),
      ),
      body: Center(
        child: Text("This is new route"),
      ),
    );
  }
}

class TipRoute extends StatelessWidget {
  TipRoute({
    Key key,
    @required this.text, // 接收一个text参数
  }) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("提示"),
      ),
      body: Padding(
        padding: EdgeInsets.all(18),
        child: Center(
          child: Column(
            children: <Widget>[
              Text(text),
              RaisedButton(
                onPressed: () => Navigator.pop(context, "我是高俊杰"),
                child: Text("返回"),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class RouterTestRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: RaisedButton(
        onPressed: () async {
          // 打开`TipRoute`，并等待��回结果
          var result = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return TipRoute(
                  // 路由参数
                  text: "flutter",
                );
              },
            ),
          );
          //输出`TipRoute`路由返回结果
          print("路由返回值: $result");
        },
        child: Text("打开提示页"),
      ),
    );
  }
}
