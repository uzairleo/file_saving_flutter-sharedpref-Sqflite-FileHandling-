import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:csv/csv.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
 final String title;


  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

String data="before writing";
var testController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextField(
              controller: testController,
              onSubmitted: (value){
                    setState((){
                      // _save(value);
                      sendToFile(value);
                    });
              },
            ),
          RaisedButton(
            onPressed: (){
           setState((){
             var s="write from button";
            //  _save(s);
                sendToFile(s);
           });
            },
            color: Colors.brown,
            colorBrightness: Brightness.light,
            child: Text("Save/Write",style: Theme.of(context).textTheme.display1,)),
          RaisedButton(
            onPressed: (){
              setState(() {
            //  _read();
            readFromFile();
              });
            },
            color: Colors.red,
            colorBrightness: Brightness.dark,
            child: Text("Read/Retrieve",style: Theme.of(context).textTheme.display1,)
            ),
            Text(data,style: Theme.of(context).textTheme.display1,),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: (){
              setState(() {
                data="before Writting";
              });
        },
         label:Row(children: <Widget>[
           Icon(Icons.restore),
           Text("Reset")
         ],)),
    );
  }
  sendToFile(var data)async{
     try 
     { final Directory targetPath=await getApplicationDocumentsDirectory();
      final File targetFile= File("${targetPath.path}/leo2.text");
      targetFile.writeAsStringSync(data);
      print(targetFile.toString());
      // this.data=data;
      print(this.data);

     }catch(Exception)
     {
       print("an error occured ");
     }
  }
  readFromFile()async
  {
    try{
          final Directory filePath=await  getApplicationDocumentsDirectory();
          final File targetFile = File("${filePath.path}/leo2.text");
         this.data= targetFile.readAsStringSync().toString();
         print("read Successfully");

    }catch(Exception)
    {
        print("an error occured");
    }
  }
  _read() async//for retrieving data from file 
  {
    try{
        final Directory filePath=await getApplicationDocumentsDirectory();
        final File targetFile=File("${filePath.path}/leo.text");
        print(filePath.path);
        String readData=targetFile.readAsStringSync();
        print(readData);
        data=readData;
    }catch(Exception){
      print("Error Happened");
    }
  }
  _save(var value)async //for Writting data to files
  {
    try{
      final Directory filePath=await getApplicationDocumentsDirectory();
      final File targetFile=File("${filePath.path}/leo.text");
      print(filePath.toString());
      data="Write Successfully";
      print(data);
      // String someData="Read Successfull";
      targetFile.writeAsStringSync(value);
    }catch(Exception)
    {
      print("Error Happened");
    }

  }
//now what if we have some more quantities like items then we need some rows and table like we did 
//in Database to do the same here in files u need a to Write your data to csv file that will 
//help u to store your multiple items (data)
//first import a package called csv : any
}


