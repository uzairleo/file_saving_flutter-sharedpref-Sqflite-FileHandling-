import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

// void main() => runApp(MyApp());
bool switchValue = false;
var themeColor = Colors.black54;
var themedataOriginal;
var pad = 1.0;
var flag = true;
///////////////////////////
var subHanallahCounter = true;
var allahoAkbarCounter = true;
var alhamdulilahCounter = true;
var lailahaCounter = true;
var bismillahCounter = true;
var astagfarCounter = true;
var duaCounter = true;
var ayatkursiCounter = true;
/////////////////////////////
List<String> tasbeehList = [
  'SUBHANALLAH',
  'ALHAMDULILAH',
  'ALLAHOAKBAR',
  'LAILLAHA-ILALLAH',
  'BISMILLAH',
  'ASTAGFAAR',
  'AYATULKURSI',
  'DUA-E-YUNAS'
];
int tlistIndex = 0;

SharedPreferences prefs;

class MyApps extends StatefulWidget {
  // This widget is the root of the application.
  @override
  _MyAppsState createState() => _MyAppsState();
}

class _MyAppsState extends State<MyApps> {
  ThemeData themeFunction() {
    setState(() {
      (switchValue == false)
          ? themedataOriginal = ThemeData.light()
          : themedataOriginal = ThemeData.dark();
    });
    return themedataOriginal;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shared preferences demo',
      theme: themeFunction(),
      home: MyHomePage(
          title: "Tasbeeh_Counter",
          // 'Shared preferences demo',
          themefunction: themeFunction),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final Function themefunction;
  MyHomePage({Key key, this.title, this.themefunction}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState(themefunction);
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  Function themefunction;
  _MyHomePageState(this.themefunction);
  @override
  void initState() {
    super.initState();

    _loadCounter();
  }

  //Loading counter value on start
  _loadCounter() async {
    prefs = await SharedPreferences.getInstance();
    // SharedPreferences switchPrefs=await SharedPreferences.getInstance();
    setState(() {
      _counter =
          (prefs.getInt('counter') ?? 0); // ?? 0 => this is null pointer check
      tlistIndex = (prefs.getInt('Listindex') ?? 0);
      // switchValue=(switchPrefs.getBool('switchvalue'));
    });
  }

  _incrementCounter() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {
      _counter = (prefs.getInt('counter') ?? 0) + 1;
      // _counter=0;
      prefs.setInt('counter', _counter);
      prefs.setInt('Listindex', tlistIndex);
      // (flag == true) ? flag = false : flag = true;
    });
  }

  List<bool> flags = [true, true, true];

  resetpref() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {
      // (flags[index]==true)?
      // flags[index]=false:
      // flags[index]=true;
      _counter = 0;
      prefs.setInt('counter', _counter);
    });
  }

  var favtIcon = Icons.favorite_border;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: _drawer(context),
      appBar: AppBar(
        // elevation: 0.0s,
        backgroundColor: Colors.brown,
        titleSpacing: 4.0,
        actions: <Widget>[
          IconButton(
              tooltip: 'favorite',
              icon: Icon(favtIcon),
              onPressed: () {
                setState(() {
                  (favtIcon == Icons.favorite_border)
                      ? favtIcon = Icons.favorite
                      : favtIcon = Icons.favorite_border;
                });
              })
        ],
        title: Text(
          widget.title,
          style: TextStyle(
            fontFamily: 'Satisfy',
            fontSize: 34,
            // fontWeight: FontWeight.bold
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        // color: themeColor,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.grey,
        child: Column(
          children: <Widget>[
            AnimatedContainer(
              duration: Duration(seconds: 2),
              width: MediaQuery.of(context).size.width,
              height: 180,
              decoration: BoxDecoration(
                color: Colors.brown,
                boxShadow: [
                  BoxShadow(
                      blurRadius: 10.0,
                      color: Colors.black26,
                      offset: Offset(1, 12))
                ],
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(32.0),
                  bottomRight: Radius.circular(32.0),
                ),
              ),
              child: Stack(
                children: <Widget>[
                  Positioned(
                    top: 20.0,
                    left: 13.0,
                    // right: 0.0,
                    child: AnimatedContainer(
                      duration: Duration(seconds: 1),
                      width: 335,
                      height: 80,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 164, 175, 135),
                        // Colors.black87,
                        border: Border.all(
                            color: Colors.white54,
                            // Colors.white70,
                            width: 4.0),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: Stack(
                        children: <Widget>[
                          Positioned(
                            top: 2.0,
                            left: 6.0,
                            child: Text(
                              tasbeehList[tlistIndex],
                              style: TextStyle(
                                  // fontFamily: 'SpicyRice',
                                  color: Colors.black87,
                                  // Colors.white70,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            ),
                          ),
                          Positioned(
                            top: 24,
                            left: 2,
                            right: 8.0,
                            child: Container(
                              alignment: Alignment.bottomRight,
                              width: 320,
                              decoration: BoxDecoration(
                                  // border: Border.all(color:Colors.white,width:2.9)
                                  ),
                              child: Text(
                                '$_counter',
                                style: TextStyle(
                                  fontFamily: 'digital-7',
                                  color: Colors.black,
                                  // Colors.white60,
                                  fontSize: 52,
                                  //  fontWeight: FontWeight.bold
                                  // fontWeight: FontWeight.bold
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                      top: 110,
                      left: 220.0,
                      child: FlatButton(
                        // color: Colors.black38,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0)),
                        onPressed: () async {
                          resetpref();
                        },
                        child: Text(
                          "RESET",
                          style: TextStyle(color: Colors.white, fontSize: 24),
                        ),
                      )),
                  Positioned(
                      top: 110,
                      left: 40,
                      child: FlatButton(
                        // color: Colors.black38,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0)),
                        onPressed: () {
                          _save();
                        },
                        child: Text(
                          "SAVE",
                          style: TextStyle(color: Colors.white, fontSize: 24),
                        ),
                      ))
                ],
              ),
            ),
            AnimatedContainer(
              width: MediaQuery.of(context).size.width,
              height: 330,
              decoration: BoxDecoration(
                  // border: Border.all(width: 2.0, color: Colors.black87)
                  ),
              duration: Duration(seconds: 1),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      _tasbeehButton(
                          hh: 80.0,
                          ww: 80.0,
                          tasbeeh: "images/9.png",
                          ontap: () {
                            setState(() {
                              tlistIndex = 0;
                              _incrementCounter();
                            });
                          }),
                      _tasbeehButton(
                          ww: 80.0,
                          hh: 130.0,
                          tasbeeh: "images/2.png",
                          ontap: () {
                            setState(() {
                              tlistIndex = 1;
                              _incrementCounter();
                            });
                          }),
                      _tasbeehButton(
                          ww: 80.0,
                          hh: 80.0,
                          tasbeeh: "images/3.jpg",
                          ontap: () {
                            setState(() {
                              tlistIndex = 2;
                              _incrementCounter();
                            });
                          }),
                    ],
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      _tasbeehButton(
                          hh: 80.0,
                          ww: 80.0,
                          tasbeeh: "images/7.png",
                          ontap: () {
                            setState(() {
                              tlistIndex = 3;
                              _incrementCounter();
                            });
                          }),
                      _tasbeehButton(
                          ww: 80.0,
                          hh: 130.0,
                          tasbeeh: "images/6.png",
                          ontap: () {
                            setState(() {
                              tlistIndex = 4;
                              _incrementCounter();
                            });
                          }),
                      _tasbeehButton(
                          ww: 80.0,
                          hh: 80.0,
                          tasbeeh: "images/3.png",
                          ontap: () {
                            setState(() {
                              tlistIndex = 5;
                              _incrementCounter();
                            });
                          }),
                    ],
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      _tasbeehButton(
                          ww: 110.0,
                          hh: 80.0,
                          tasbeeh: "images/4.png",
                          ontap: () {
                            setState(() {
                              tlistIndex = 6;
                              _incrementCounter();
                            });
                          }),
                      _tasbeehButton(
                          ww: 110.0,
                          hh: 80.0,
                          tasbeeh: "images/8.png",
                          ontap: () {
                            setState(() {
                              tlistIndex = 7;
                              _incrementCounter();
                            });
                          })
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _save() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return SaveDiloge();
        });
  }

  _tasbeehButton({var hh, var ww, var tasbeeh, Function ontap}) {
    return InkWell(
      splashColor: Colors.white,
      onTap: ontap,
      child: AnimatedContainer(
        duration: Duration(microseconds: 50),
        width: ww,
        height: ww,
        decoration: BoxDecoration(
            border: Border.all(width: 2.0, color: Colors.black54),
            shape: BoxShape.circle),
        child: ClipRRect(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          borderRadius: BorderRadius.circular(230.0),
          child:
              // Image.asset(tasbeeh)
              Image(
            image: AssetImage(tasbeeh),
          ),
        ),
      ),
    );
  }

  _drawer(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 2 / 3,
      color: Colors.amber,
      child: Drawer(
          child: Column(
        children: <Widget>[
          UserAccountsDrawerHeader(
              arrowColor: Colors.brown,
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white54,
                child: FlutterLogo(
                  size: 44,
                ),
              ),
              accountName: Text("Uzairleo"),
              accountEmail: Text("uzair.jan336@gmail.com")),
          ListTile(
            leading: Icon(Icons.home),
            title: Text("Home"),
            onTap: () {
              Navigator.pop(context);
            },
          ), //saved
          Divider(),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text("Settings"),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) =>
                          (Settings(themefunction))));
            },
          ), //Setting
          Divider(),
          ListTile(
              leading: Icon(Icons.info),
              title: Text("About me"),
              onTap: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return Dialog(
                        elevation: 0.0,
                        backgroundColor: Colors.transparent,
                        child: Container(
                          height: 300.0,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Column(
                          // crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "About me",
                                style: TextStyle(
                                    fontSize: 24.0,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Satisfy'),
                              ),
                              Padding(
                                padding:EdgeInsets.all(12.0),
                                child: Text(
                                  'I am Uzairleo from Islamia College Peshawar.'
                                  'I am a software engineer who love his work '
                                  'as well as Flutter Developer expert for '
                                  'Android/Cross platform Application.Search'
                                  'engine Optimizer as well as Graphics Designer. '
                                  ' Still building up or learning some more skills',
                                  style: TextStyle(
                                    fontSize: 16.0,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 18.0),
                                child: Text(
                                  "Contact me",
                                  style: TextStyle(
                                      fontSize: 24.0,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Satisfy'),
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  IconButton(
                                      icon: Icon(FontAwesomeIcons.facebook),
                                      onPressed: () {
                                        _urlLauncher("http://www.facebook.com");
                                      }),
                                  IconButton(
                                      icon: Icon(FontAwesomeIcons.youtube),
                                      onPressed: () {
                                        _urlLauncher("http://www.youtube.com");
                                      }),
                                  IconButton(
                                      icon: Icon(FontAwesomeIcons.github),
                                      onPressed: () {
                                        _urlLauncher("http://www.github.com/uzairleo");
                                      }),
                                  IconButton(
                                      icon: Icon(Icons.mail), 
                                      onPressed: () {
                                        _urlLauncher("http://www.gmail.com/");
                                      }),
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    });
              }),
          Divider(),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text("Quit App"),
            onTap: () {
              exit(0);
            },
          )
        ],
      )),
    );
  }
  _urlLauncher(var url)async {
      if(await canLaunch(url)){
        await launch(url);
      }else
      {
              throw "Invalid url Sorry!";
      }
  }
}

class Settings extends StatefulWidget {
  final Function themefunction;
  Settings(this.themefunction);
  @override
  _SettingsState createState() => _SettingsState(themefunction);
}

class _SettingsState extends State<Settings> {
  var themefunction;
  _SettingsState(this.themefunction);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
        title: Text("Settings"),
      ),
      body: Column(
        children: <Widget>[
          ListTile(
            title: Text(
              "Theme",
            ),
            trailing: Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Switch(
                  value: switchValue,
                  onChanged: (value) {
                    setState(() {
                      switchValue = value;
                      // themefunction();
                      // (switchValue==true)?
                      // themeColor=Colors.grey:
                      // themeColor=Colors.white;
                    });
                    themefunction();
                  }),
            ),
            leading: Icon(Icons.format_paint),
          ),
          Divider(),
          ListTile(
              leading: Icon(Icons.font_download),
              title: Text("Large Fonts"),
              onTap: () {}),
        ],
      ),
    );
  }
}

class SaveDiloge extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Dialog(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        child: Container(
          padding: EdgeInsets.only(left: 4.0),
          height: 160,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(145.0),
                bottomLeft: Radius.circular(145.0),
                bottomRight: Radius.circular(12.0),
                topRight: Radius.circular(12.0),
              )),
          child: Row(children: <Widget>[
            Expanded(
                child: CircleAvatar(
              radius: 59,
              backgroundColor: Colors.black12,
              child: CircleAvatar(
                radius: 28,
                backgroundColor: Colors.green,
                child: Center(
                  child: Icon(
                    Icons.done,
                    size: 28.0,
                    color: Colors.white,
                  ),
                ),
              ),
            )),
            Expanded(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 0.0),
                    child: Text(
                      "Status",
                      style: TextStyle(
                        fontSize: 28.0,
                        fontFamily: 'Satisfy',
                      ),
                    ),
                  ),
                  Flexible(
                    child: Text(
                      'Your tasbeeh was saved Successfully press '
                      'press ok to continue Zikar',
                      style: TextStyle(
                        fontSize: 14.0,
                        // fontFamily: 'Satisfy',
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(""),
                        //                      RaisedButton(
                        // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
                        // child: Text("OK"),
                        // onPressed:(){}),
                      ),
                      SizedBox(
                        width: 12.0,
                      ),
                      Expanded(
                        flex: 2,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 8.0, left: 0.0),
                          child: RaisedButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25.0)),
                              child: Text("OK "),
                              colorBrightness: Brightness.light,
                              color: Colors.red,
                              onPressed: () {
                                Navigator.pop(context);
                              }),
                        ),
                      ),
                      // RaisedButton(onPressed: null),
                    ],
                  )
                ]))
          ]),
        ),
      ),
    );
  }
}
// _tasbeehTappedLogic(var index) {
//   (flags[index] == false)
//       ? _incrementCounter()
//       : showDialog(
//           context: context,
//           builder: (BuildContext context) {
//             return AlertDialog(
//               title: Text('Warning'),
//               content: Text('Do u want to leave this tasbeeh '
//                   'and start new one if u want'
//                   ' to start new one press ok otherwise to thcontinue '
//                   ' the remainng one startpress cancel'),
//               actions: <Widget>[
//                 FlatButton(
//                     onPressed: () {
//                       resetpref(index);
//                     },
//                     child: Text("OK")),
//                 FlatButton(onPressed: () {}, child: Text("cancel")),
//               ],
//             );
//           });
// }
//commit the following

//1-Dynamic Theming using inherited Models
//2-And also Commit custom Drawer settings
//  Center(
//                             child: Text(
//                               '$_counter',
//                               style: Theme.of(context).textTheme.display1,
//                             ),
//                           ),

// Center(
//               child: Column(

//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: <Widget>[

//                   Text(
//                     'You have pushed the button this many times:',
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Container(
//                       width: 250.0,
//                       height: 200,
//                       decoration: BoxDecoration(
//                         border: Border.all(
//                           color: Colors.purple,
//                           width: 3,
//                         ),
//                         // shape: BoxShape.circle,
//                         borderRadius: BorderRadius.only(
//                           topRight: Radius.circular(50.0),
//                           bottomRight: Radius.circular(50.0),
//                         ),
//                       ),
//                       child: Column(
//                         children: <Widget>[

//                           Padding(
//                             padding: const EdgeInsets.only(top: 10.0),
//                             child: Switch(
//                                 value: switchValue,
//                                 onChanged: (value) {
//                                   setState(() {
//                                     switchValue = value;
//                                     // themefunction();
//                                     // (switchValue==true)?
//                                     // themeColor=Colors.grey:
//                                     // themeColor=Colors.white;
//                                   });
//                                   themefunction();
//                                 }),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//  FloatingActionButton(
//                   onPressed: _incrementCounter,
//                   tooltip: 'Increment',
//                   child: Icon(Icons.settings),
//                 ),

// floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
// floatingActionButton: AnimatedContainer(
//   duration: Duration(seconds: 4),
//   child: Column(
//       mainAxisAlignment: MainAxisAlignment.end,
//       children: <Widget>[
//         Padding(
//           padding: EdgeInsets.only(bottom: pad),
//           child: (flag == true)
//               ? AnimatedContainer(
//                   width: 50,
//                   height: 50,
//                   decoration: BoxDecoration(
//                     color: Colors.blue,
//                     shape: BoxShape.circle,
//                     // border: Border.all(color:Colors.black87)
//                   ),
//                   duration: Duration(seconds: 2),
//                   child: Center(
//                       child: IconButton(
//                     onPressed: () {},
//                     icon: Icon(Icons.donut_small),
//                   )))
//               : Text("sorry"),
//         ),

//         FloatingActionButton(
//           onPressed: _incrementCounter,
//           tooltip: 'Increment',
//           child: Icon(Icons.settings),
//         ), // This trailing comma makes auto-formatting nicer for build methods.
//       ]),
// )
