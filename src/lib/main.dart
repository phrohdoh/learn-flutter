import 'package:flutter/material.dart';
import './views/quotes/view.dart' show QuotesListPage;

ThemeData theme = new ThemeData(
  primaryColor: Colors.teal,
  accentColor: Colors.redAccent,
);

void main() => runApp(new MaterialApp(
  home: new QuotesListPage(),
  theme: theme,
));

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'SafeButler',
      theme: new ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: new MyHomePage(title: 'SafeButler'),
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
  @override
  Widget build(BuildContext context) {
    var ltEmail = new ListTile(
      title: new TextFormField(
        decoration: const InputDecoration(
          hintText: "Email",
        ),
      ),
    );

    var ltPhone = new ListTile(
      title: new TextFormField(
        decoration: const InputDecoration(
          hintText: "Phone",
        ),
      ),
    );

    var ltPassword = new ListTile(
      title: new TextField(
        decoration: new InputDecoration(
          hintText: "Password",
        ),
        obscureText: true,
        onSubmitted: (val) {
          print(val);
        },
      ),
    );

    var ltState = new ListTile(
        title: new DropdownButton(
      hint: new Text("State (optional)"),
      items: <DropdownMenuItem>[
        const DropdownMenuItem(value: "TX", child: const Text("Texas")),
        const DropdownMenuItem(value: "CA", child: const Text("California")),
      ],
      onChanged: (dynamic key) {
        print(key);
      },
    ));

    var ltInviteCode = new ListTile(
      title: new TextFormField(
        decoration: const InputDecoration(
          hintText: "Invite Code (optional)",
        ),
      ),
    );

    var ltSignupButton = new ListTile(
        title: new MaterialButton(
      color: Colors.teal,
      child: const Text("Sign up"),
      textColor: Colors.white,
      onPressed: () {
        print("signup pressed");
      },
    ));

    var ltLoginButton = new ListTile(
        title: new MaterialButton(
      color: Colors.grey,
      child: const Text("Log in to an existing account"),
      textColor: Colors.white,
      onPressed: () {
        print("login pressed");
      },
    ));

    var ltUberLyftText = new ListTile(
      title: new Center(child: new Text(
        "Sign up as a(n) Uber/Lyft driver",
        style: const TextStyle(color: Colors.teal)
      ))
    );

    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new Column(
        children: <Widget>[
          ltEmail,
          ltPhone,
          ltPassword,
          ltState,
          ltInviteCode,
          ltSignupButton,
          ltLoginButton,
          new Divider(),
          ltUberLyftText,
        ],
      ),
    );
  }
}
