import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

// void main() => runApp(MyApp());
bool switchValue = false;
var themeColor = Colors.black54;
var themedataOriginal;
var pad = 1.0;

var flag = true;

class MyApps extends StatefulWidget {
  // This widget is the root of the application.
  @override
  _MyAppsState createState() => _MyAppsState();
}

class _MyAppsState extends State<MyApps> {
  ThemeData themeFunction() {
    // var themedata;
    setState(() {
// themedata=ThemeData.light();
      (switchValue == false)
          ? themedataOriginal = ThemeData.light()
          : themedataOriginal = ThemeData.dark();
    });
    return themedataOriginal;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // SharedPreferences switchPrefs=await SharedPreferences.getInstance();
    setState(() {
      _counter =
          (prefs.getInt('counter') ?? 0); // ?? 0 => this is null pointer check
      // switchValue=(switchPrefs.getBool('switchvalue'));
    });
  }

  _incrementCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _counter = (prefs.getInt('counter') ?? 0) + 1;
      prefs.setInt('counter', _counter);
      (flag == true) ? flag = false : flag = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: _drawer(context),
        appBar: AppBar(
          backgroundColor: Colors.brown,
          title: Text(widget.title),
          centerTitle: true,
        ),
        body: Container(
          // color: themeColor,
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Colors.grey,
          child: Column(
            children: <Widget>[
              // Image(
              //   image: AssetImage('images/counter.png'),
              //   width: 300,),

              AnimatedContainer(
                duration: Duration(seconds: 2),
                width: MediaQuery.of(context).size.width,
                height: 180,
                decoration: BoxDecoration(
                  color: Colors.brown,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(22.0),
                    bottomRight: Radius.circular(22.0),
                  ),
                ),
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      top: 20.0,
                      left: 15.0,
                      child: AnimatedContainer(
                        duration: Duration(seconds: 1),
                        width: 330,
                        height: 80,
                        decoration: BoxDecoration(
                            color: Colors.black87
                            ,
                            border:
                                Border.all(color: Colors.white70, width: 4.0),
                            borderRadius: BorderRadius.circular(12.0)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: Text(
                                "AstagFar",
                                style: TextStyle(
                                  fontFamily: 'SpicyRice',
                                    color: Colors.white70, 
                                    fontSize: 24),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 80, right: 0.0),
                              child: Text(
                                "0",
                                style: TextStyle(
                                    fontFamily: 'digital-7',
                                    color: Colors.white60,
                                     fontSize: 47,
                                    // fontWeight: FontWeight.bold
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      top: 120,
                      left: 230.0,
                      child: Text(
                        "RESET",
                        style: TextStyle(color: Colors.white, fontSize: 24),
                      ),
                    ),
                    Positioned(
                      top: 120,
                      left: 70,
                      child: Text(
                        "COUNT",
                        style: TextStyle(color: Colors.white, fontSize: 24),
                      ),
                    )
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
                    SizedBox(height: 20.0,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        _tasbeehButton(
                            hh: 80.0, ww: 80.0, tasbeeh: "images/9.png"),
                        _tasbeehButton(
                            ww: 80.0, hh: 130.0, tasbeeh: "images/2.png"),
                        _tasbeehButton(
                            ww: 80.0, hh: 80.0, tasbeeh: "images/3.jpg"),
                       
                      ],
                    ),
                    SizedBox(height: 20.0,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        _tasbeehButton(
                            hh: 80.0, ww: 80.0, tasbeeh: "images/7.png"),
                        _tasbeehButton(
                            ww: 80.0, hh: 130.0, tasbeeh: "images/6.png"),
                        _tasbeehButton(
                            ww: 80.0, hh: 80.0, tasbeeh: "images/3.png"),
                       
                      ], 
                    ),
                    SizedBox(height: 10.0,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        _tasbeehButton(
                          ww: 110.0,
                          hh:80.0,
                          tasbeeh: "images/4.png",
                        ),
                         _tasbeehButton(
                          ww: 110.0,
                          hh:80.0,
                          tasbeeh: "images/8.png",
                        )
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

  _tasbeehButton({var hh, var ww, var tasbeeh}) {
    return AnimatedContainer(
      duration: Duration(microseconds: 50),
      width: ww,
      height: ww,
      decoration: BoxDecoration(
          border: Border.all(width: 2.0, color: Colors.black54),
          shape: BoxShape.circle),
      child:ClipRRect(
        
          clipBehavior: Clip.antiAliasWithSaveLayer,
        borderRadius:BorderRadius.circular(230.0),
        child:
        // Text("uzairleo"),
         Image(image: AssetImage(tasbeeh), ),
      ),
    );
  }

  _drawer(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 2 / 3,
      color: Colors.white,
      child: Drawer(
          child: Column(
        children: <Widget>[
          UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white54,
                child: FlutterLogo(
                  size: 44,
                ),
              ),
              accountName: Text("Uzairleo"),
              accountEmail: Text("uzair.jan336@gmail.com")),
          ListTile(
            title: Text(
              "Dark Theme",
              style: Theme.of(context).textTheme.title,
            ),
            trailing: Padding(
              padding: const EdgeInsets.only(top: 10.0),
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
          ),
        ],
      )),
    );
  }
}
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