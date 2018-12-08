import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Widget> _screen = [
    HomeScreen(),
    PostScreen(),
    ProfileScreen()
  ];
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;      
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: _screen[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Home')),
          BottomNavigationBarItem(icon: Icon(Icons.add), title: Text('Post')),
          BottomNavigationBarItem(icon: Icon(Icons.person), title: Text('profile'))
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  HomeScreenState createState() => HomeScreenState();
} 

class HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
      return Center(
        child: Text('Home'),
      );
    }
}

class PostScreen extends StatefulWidget {
  PostScreen({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => PostScreenState();
}

class PostScreenState extends State<PostScreen> {
  @override
  Widget build(BuildContext context) {
      return Center(
        child: Text('Post'),
      );
    }
}

class ProfileScreen extends StatefulWidget {
  ProfileScreen({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => ProfileScreenState();
}

class ProfileScreenState extends State<ProfileScreen> {
  _navigate() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AccountNameScreen()
      )
    );
  }

  @override
    Widget build(BuildContext context) {
      return 
        Container(
          margin: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              DecoratedBox(
                decoration: BoxDecoration(
                  color: const Color(0xff7c94b6),
                  gradient: LinearGradient(
                    colors: <Color>[
                      const Color(0xff70e1f5),
                      const Color(0xFFffd194),
                    ],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                ),
                child: Center(
                  child: Text(
                    'Profile',
                    style: TextStyle(
                      fontSize: 24.0,
                      color: Color(0xffffffff)
                    ),
                  ),
                )
              ),
              ListTile(
                leading: Icon(Icons.arrow_forward_ios),
                title: Text('email'),
                onTap: _navigate,
              ),
              ListTile(
                leading: Icon(Icons.arrow_forward_ios),
                title: Text('account name'),
              )
            ],
          )
      );
    }
}

class AccountNameScreen extends StatefulWidget {
  AccountNameScreen({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => AccountNameScreenState();
}

class AccountNameScreenState extends State<AccountNameScreen> {
  _back() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('setting'),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: _back,
          child: Text('go back'),
        ),
      ),
    );
  }
}
