import 'package:flutter/material.dart';
import 'login.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Basics 5',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Basics 5 HomePage'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 200.0,),
            Expanded(
              child: SizedBox(
                width: 500.0,
                child: ListView.separated(
                  padding: const EdgeInsets.all(8.0),
                  itemCount: subjects.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      title: Container(
                        height: 50.0,
                        color: Colors.blue,
                        child: Center(
                          child: Text(subjects[index].systemName, style: TextStyle(fontWeight: FontWeight.bold),),
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    DetailScreen(system: subjects[index])));
                      },
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) =>
                      const Divider(),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

List<Systems> subjects = [
  Systems('iOS', 'assets/ioslogo.png'),
  Systems('Android', 'assets/android.png'),
  Systems('macOS', 'assets/MACOS-LOGO.png'),
  Systems('Windows', 'assets/windows.png'),
  Systems('Linux', 'assets/linux.png'),
];

class Systems {
  final String systemName, imagePath;

  Systems(this.systemName, this.imagePath);
}

class DetailScreen extends StatelessWidget {
  final Systems system;

  DetailScreen({Key key, @required this.system}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(system.systemName),
      ),
      body: Padding(
          padding: EdgeInsets.all(16.0),
          child: Center(
              child: Image.asset(system.imagePath, fit: BoxFit.contain))),
    );
  }
}
