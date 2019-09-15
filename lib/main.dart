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
import 'package:english_words/english_words.dart';
import 'package:flutter/widgets.dart';
//导入cupertino widget库
import 'package:flutter/cupertino.dart';

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
          "new_widget": (context) => NewWidget(),
          "new_context": (context) => ContextRoute(),
          "new_counter": (context) => CounterRoute(),
          "new_snack": (context) => SnackRoute(),
          "new_cuper": (context) => CupertinoTestRoute(),
          "/": (context) =>
              MyHomePage(title: 'Flutter Demo Home Page'), //注册首页路由
        },
        onGenerateRoute: (RouteSettings settings) {
          return MaterialPageRoute(builder: (context) {
            String routeName = settings.name;
            print("路由名字 ,$routeName");
            // 如果访问的路由页需要登录，但当前未登录，则直接返回登录页路由，
            // 引导用户登录；其它情况则正常打开路由。
          });
        });
  }
}

class RandomWordsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 生成随机字符串
    final wordPair = new WordPair.random();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: new Text(wordPair.toString()),
    );
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
            RandomWordsWidget(),
            TapboxA(),
            FlatButton(
              child: Text('open new route'),
              textColor: Colors.blue,
              onPressed: () {
                // Navigator.push(context, MaterialPageRoute(builder: (context) {
                //   return NewRoute();
                // }));
                // Navigator.pushNamed(context, "new_page");
                Navigator.of(context)
                    .pushNamed("new_page", arguments: "hi flutter");
              },
            ),
            FlatButton(
              child: Text('open new widget'),
              textColor: Colors.blue,
              onPressed: () {
                // Navigator.push(context, MaterialPageRoute(builder: (context) {
                //   return NewRoute();
                // }));
                // Navigator.pushNamed(context, "new_page");
                Navigator.of(context)
                    .pushNamed("new_widget", arguments: "hi flutter");
              },
            ),
            FlatButton(
              child: Text('open new context'),
              textColor: Colors.blue,
              onPressed: () {
                // Navigator.push(context, MaterialPageRoute(builder: (context) {
                //   return NewRoute();
                // }));
                // Navigator.pushNamed(context, "new_page");
                Navigator.of(context)
                    .pushNamed("new_context", arguments: "hi flutter");
              },
            ),
            FlatButton(
              child: Text('open new counter'),
              textColor: Colors.pink,
              onPressed: () {
                // Navigator.push(context, MaterialPageRoute(builder: (context) {
                //   return NewRoute();
                // }));
                // Navigator.pushNamed(context, "new_page");
                Navigator.of(context)
                    .pushNamed("new_counter", arguments: "hi flutter");
              },
            ),
            FlatButton(
              child: Text('open new snack'),
              textColor: Colors.pink,
              onPressed: () {
                // Navigator.push(context, MaterialPageRoute(builder: (context) {
                //   return NewRoute();
                // }));
                // Navigator.pushNamed(context, "new_page");
                Navigator.of(context)
                    .pushNamed("new_snack", arguments: "hi flutter");
              },
            ),
            FlatButton(
              child: Text('open new cuper'),
              textColor: Colors.pink,
              onPressed: () {
                // Navigator.push(context, MaterialPageRoute(builder: (context) {
                //   return NewRoute();
                // }));
                // Navigator.pushNamed(context, "new_page");
                Navigator.of(context)
                    .pushNamed("new_cuper", arguments: "hi flutter");
              },
            ),
            FlatButton(
              child: Text('RouterTestRoute'),
              textColor: Colors.blue,
              onPressed: () {
                // Navigator.push(context, MaterialPageRoute(builder: (context) {
                //   return RouterTestRoute();
                // }));
                Navigator.of(context)
                    .pushNamed("tip2", arguments: "hi flutter");
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
    // var args = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text("New route"),
      ),
      body: Center(
        child: Text("This is new route"),
      ),
    );
    // return Echo(text: "hello world");
  }
}

class NewWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // var args = ModalRoute.of(context).settings.arguments;
    // return Scaffold(
    //   appBar: AppBar(
    //     title: Text("New route"),
    //   ),
    //   body: Center(
    //     child: Text("This is new route"),
    //   ),
    // );
    return Echo(text: "hello world");
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

class Echo extends StatelessWidget {
  const Echo({
    Key key,
    @required this.text,
    this.backgroundColor: Colors.lightBlue,
  }) : super(key: key);

  final String text;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("New widget"),
      ),
      body: Center(
        child: Text(text),
      ),
    );
    // return Center(
    //   child: Container(
    //     // color: ,
    //     child: Text(text),
    //   ),
    // );
  }
}

class ContextRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Context测试"),
      ),
      body: Container(
        child: Builder(builder: (context) {
          // 在Widget树中向上查找最近的父级`Scaffold` widget
          Scaffold scaffold = context.ancestorWidgetOfExactType(Scaffold);
          // 直接返回 AppBar的title， 此处实际上是Text("Context测试")
          return (scaffold.appBar as AppBar).title;
        }),
      ),
    );
  }
}

class CounterWidget extends StatefulWidget {
  const CounterWidget({Key key, this.initValue: 0});

  final int initValue;

  @override
  _CounterWidgetState createState() => new _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  int _counter;

  @override
  void initState() {
    super.initState();
    //初始化状态
    _counter = widget.initValue;
    print("initState");
  }

  @override
  Widget build(BuildContext context) {
    print("build");
    return Scaffold(
      appBar: AppBar(
        title: Text("Counter"),
      ),
      body: Center(
        child: FlatButton(
          child: Text('$_counter'),
          //点击后计数器自增
          onPressed: () => setState(
            () => ++_counter,
          ),
        ),
      ),
    );
  }

  @override
  void didUpdateWidget(CounterWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    print("didUpdateWidget");
  }

  @override
  void deactivate() {
    super.deactivate();
    print("deactive");
  }

  @override
  void dispose() {
    super.dispose();
    print("dispose");
  }

  @override
  void reassemble() {
    super.reassemble();
    print("reassemble");
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("didChangeDependencies");
  }
}

class CounterRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CounterWidget();
  }
}

class SnackRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("子树中获取State对象"),
      ),
      body: Center(
        child: Builder(builder: (context) {
          return RaisedButton(
            onPressed: () {
              // 查找父级最近的Scaffold对应的ScaffoldState对象
              ScaffoldState _state =
                  context.ancestorStateOfType(TypeMatcher<ScaffoldState>());
              //调用ScaffoldState的showSnackBar来弹出SnackBar
              _state.showSnackBar(
                SnackBar(
                  content: Text("我是SnackBar"),
                ),
              );
            },
            child: Text("显示SnackBar"),
          );
        }),
      ),
    );
  }
}

class CupertinoTestRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text("Cupertino Demo"),
      ),
      child: Center(
        child: CupertinoButton(
            color: CupertinoColors.activeBlue,
            child: Text("Press"),
            onPressed: () {
              print("hello,world");
            }),
      ),
    );
  }
}

// TapboxA 管理自身状态.

//------------------------- TapboxA ----------------------------------

class TapboxA extends StatefulWidget {
  TapboxA({Key key}) : super(key: key);

  @override
  _TapboxAState createState() => new _TapboxAState();
}

class _TapboxAState extends State<TapboxA> {
  bool _active = false;

  void _handleTap() {
    setState(() {
      _active = !_active;
    });
  }

  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: _handleTap,
      child: new Container(
        child: new Center(
          child: new Text(
            _active ? 'Active' : 'Inactive',
            style: new TextStyle(fontSize: 32.0, color: Colors.white),
          ),
        ),
        width: 200.0,
        height: 200.0,
        decoration: new BoxDecoration(
          color: _active ? Colors.lightGreen[700] : Colors.grey[600],
        ),
      ),
    );
  }
}
