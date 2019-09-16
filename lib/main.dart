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
          "new_state": (context) => StateTest(),
          "new_list": (context) => RandomWrods(),
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

class RandomWrods extends StatefulWidget {
  @override
  createState() => new RandomWrodsState();
}

class RandomWrodsState extends State<RandomWrods> {
  @override
  Widget build(BuildContext context) {
    // final wordPair = new WordPair.random();
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("ListView"),
          actions: <Widget>[
            new IconButton(
              icon: new Icon(Icons.list),
              onPressed: _pushSaved,
            )
          ],
        ),
        body: _buildSuggestions());
  }

  final _suggestions = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 18.0);
  final _saved = new Set<WordPair>();

  Widget _buildSuggestions() {
    return new ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemBuilder: (context, i) {
        if (i.isOdd) return new Divider();
        final index = i ~/ 2;
        if (index >= _suggestions.length) {
          _suggestions.addAll(generateWordPairs().take(10));
        }
        return _buildRow(_suggestions[index]);
      },
    );
  }

  Widget _buildRow(WordPair pair) {
    final alreadySaved = _saved.contains(pair);
    return new ListTile(
      title: new Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
      trailing: new Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : null,
      ),
      onTap: () {
        setState(() {
          if (alreadySaved) {
            _saved.remove(pair);
          } else {
            _saved.add(pair);
          }
        });
      },
    );
  }

  void _pushSaved() {
    Navigator.of(context).push(new MaterialPageRoute(builder: (context) {
      final tiles = _saved.map((pair) {
        return new ListTile(
          title: new Text(pair.asPascalCase, style: _biggerFont),
        );
      });
      final divided =
          ListTile.divideTiles(context: context, tiles: tiles).toList();
      return new Scaffold(
        appBar: new AppBar(
          title: new Text("save Suggestions"),
        ),
        body: new ListView(children: divided),
      );
    }));
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

  void _onPressed() {
    // print("btn click");
    Navigator.of(context).pushNamed("new_list", arguments: "hi flutter");
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
            Text(
              "Hello world",
              textAlign: TextAlign.left,
            ),
            Text(
              "Hello world! I'm Jack. " * 4,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              "Hello world",
              textScaleFactor: 1.5,
            ),
            RandomWordsWidget(),
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
              child: Text('open new state'),
              textColor: Colors.pink,
              onPressed: () {
                // Navigator.push(context, MaterialPageRoute(builder: (context) {
                //   return NewRoute();
                // }));
                // Navigator.pushNamed(context, "new_page");
                Navigator.of(context)
                    .pushNamed("new_state", arguments: "hi flutter");
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
            ),
            Text(
              "Hello world",
              style: TextStyle(
                  color: Colors.blue,
                  fontSize: 18.0,
                  height: 1.2,
                  fontFamily: "Courier",
                  background: new Paint()..color = Colors.yellow,
                  decoration: TextDecoration.underline,
                  decorationStyle: TextDecorationStyle.dashed),
            ),
            RaisedButton(
              child: Text("normal"),
              onPressed: () {
                print('hello btn');
              },
            ),
            IconButton(
              icon: Icon(Icons.thumb_up),
              onPressed: () {
                print("great");
              },
            ),
            FlatButton.icon(
              icon: Icon(Icons.info),
              label: Text("详情"),
              onPressed: _onPressed,
            ),
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
        body: Column(
          children: <Widget>[
            TextField(
              autofocus: true,
              decoration: InputDecoration(
                  labelText: "用户名",
                  hintText: "用户名或邮箱",
                  prefixIcon: Icon(Icons.person)),
              onChanged: (v) {
                print("onChange:$v");
              },
            ),
            TextField(
              decoration: InputDecoration(
                  labelText: "密码",
                  hintText: "您的登录密码",
                  prefixIcon: Icon(Icons.lock)),
              obscureText: true,
            ),
            FocusTestRoute(),
            // LinearProgressIndicator(
            //   backgroundColor: Colors.grey[200],
            //   valueColor: AlwaysStoppedAnimation(Colors.blue),
            // ),
            // CircularProgressIndicator(
            //   backgroundColor: Colors.grey[200],
            //   valueColor: AlwaysStoppedAnimation(Colors.blue),
            // )
            ProgressRoute()
          ],
        ));
    // return Echo(text: "hello world");
  }
}

//ProgressRoute
class ProgressRoute extends StatefulWidget {
  @override
  _ProgressRouteState createState() => _ProgressRouteState();
}

class _ProgressRouteState extends State<ProgressRoute>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;

  @override
  void initState() {
    //动画执行时间3秒
    _animationController =
        new AnimationController(vsync: this, duration: Duration(seconds: 3));
    _animationController.forward();
    _animationController.addListener(() => setState(() => {}));
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(16),
            child: LinearProgressIndicator(
              backgroundColor: Colors.grey[200],
              valueColor: ColorTween(begin: Colors.grey, end: Colors.blue)
                  .animate(_animationController), // 从灰色变成蓝色
              value: _animationController.value,
            ),
          )
        ],
      ),
    );
  }
}

// input
class FocusTestRoute extends StatefulWidget {
  @override
  _FocusTestRouteState createState() => new _FocusTestRouteState();
}

class _FocusTestRouteState extends State<FocusTestRoute> {
  FocusNode focusNode1 = new FocusNode();
  FocusNode focusNode2 = new FocusNode();
  FocusScopeNode focusScopeNode;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: <Widget>[
          TextField(
            autofocus: true,
            focusNode: focusNode1, //关联focusNode1
            decoration: InputDecoration(labelText: "input1"),
          ),
          TextField(
            focusNode: focusNode2, //关联focusNode2
            decoration: InputDecoration(labelText: "input2"),
          ),
          Builder(
            builder: (ctx) {
              return Column(
                children: <Widget>[
                  RaisedButton(
                    child: Text("移动焦点"),
                    onPressed: () {
                      //将焦点从第一个TextField移到第二个TextField
                      // 这是一种写法 FocusScope.of(context).requestFocus(focusNode2);
                      // 这是第二种写法
                      if (null == focusScopeNode) {
                        focusScopeNode = FocusScope.of(context);
                      }
                      focusScopeNode.requestFocus(focusNode2);
                    },
                  ),
                  RaisedButton(
                    child: Text("隐藏键盘"),
                    onPressed: () {
                      // 当所有编辑框都失去焦点时键盘就会收起
                      focusNode1.unfocus();
                      focusNode2.unfocus();
                    },
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
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
          // 在Widget树中向��查找最近的父级`Scaffold` widget
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

// TapboxA(),
// ParentWidget(),
class StateTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // var args = ModalRoute.of(context).settings.arguments;
    return Scaffold(
        appBar: AppBar(
          title: Text("New route"),
        ),
        body: new Center(
            child: new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[TapboxA(), ParentWidget(), ParentWidgetC()]))
        // child: Text("This is new route"),

        );
    // return Echo(text: "hello world");
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

// ParentWidget 为 TapboxB 管理状态.

//------------------------ ParentWidget --------------------------------

class ParentWidget extends StatefulWidget {
  @override
  _ParentWidgetState createState() => new _ParentWidgetState();
}

class _ParentWidgetState extends State<ParentWidget> {
  bool _active = false;

  void _handleTapboxChanged(bool newValue) {
    setState(() {
      _active = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new TapboxB(
        active: _active,
        onChanged: _handleTapboxChanged,
      ),
    );
  }
}

//------------------------- TapboxB ----------------------------------

class TapboxB extends StatelessWidget {
  TapboxB({Key key, this.active: false, @required this.onChanged})
      : super(key: key);

  final bool active;
  final ValueChanged<bool> onChanged;

  void _handleTap() {
    onChanged(!active);
  }

  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: _handleTap,
      child: new Container(
        child: new Center(
          child: new Text(
            active ? 'Active' : 'Inactive',
            style: new TextStyle(fontSize: 32.0, color: Colors.white),
          ),
        ),
        width: 200.0,
        height: 200.0,
        decoration: new BoxDecoration(
          color: active ? Colors.lightGreen[700] : Colors.grey[600],
        ),
      ),
    );
  }
}

//---------------------------- ParentWidget ----------------------------

class ParentWidgetC extends StatefulWidget {
  @override
  _ParentWidgetCState createState() => new _ParentWidgetCState();
}

class _ParentWidgetCState extends State<ParentWidgetC> {
  bool _active = false;

  void _handleTapboxChanged(bool newValue) {
    setState(() {
      _active = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new TapboxC(
        active: _active,
        onChanged: _handleTapboxChanged,
      ),
    );
  }
}

//----------------------------- TapboxC ------------------------------

class TapboxC extends StatefulWidget {
  TapboxC({Key key, this.active: false, @required this.onChanged})
      : super(key: key);

  final bool active;
  final ValueChanged<bool> onChanged;

  @override
  _TapboxCState createState() => new _TapboxCState();
}

class _TapboxCState extends State<TapboxC> {
  bool _highlight = false;

  void _handleTapDown(TapDownDetails details) {
    setState(() {
      _highlight = true;
    });
  }

  void _handleTapUp(TapUpDetails details) {
    setState(() {
      _highlight = false;
    });
  }

  void _handleTapCancel() {
    setState(() {
      _highlight = false;
    });
  }

  void _handleTap() {
    widget.onChanged(!widget.active);
  }

  @override
  Widget build(BuildContext context) {
    // 在按下时添加绿色边框，当抬起时，取消高亮
    return new GestureDetector(
      onTapDown: _handleTapDown, // 处理按下事件
      onTapUp: _handleTapUp, // 处理抬起事件
      onTap: _handleTap,
      onTapCancel: _handleTapCancel,
      child: new Container(
        child: new Center(
          child: new Text(widget.active ? 'Active' : 'Inactive',
              style: new TextStyle(fontSize: 32.0, color: Colors.white)),
        ),
        width: 200.0,
        height: 200.0,
        decoration: new BoxDecoration(
          color: widget.active ? Colors.lightGreen[700] : Colors.grey[600],
          border: _highlight
              ? new Border.all(
                  color: Colors.teal[700],
                  width: 10.0,
                )
              : null,
        ),
      ),
    );
  }
}
