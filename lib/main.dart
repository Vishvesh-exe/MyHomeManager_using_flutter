import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: Colors.teal,
          scaffoldBackgroundColor: Colors.teal.shade500),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List addl = [];
  String input = "";

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/bkg.png"), // <-- BACKGROUND IMAGE
                fit: BoxFit.fill,
              ),
            ),
          ),
          Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              centerTitle: true,
              backgroundColor: Colors.blue.shade800,
              title: const Text(
                'Groceries List',
                style: TextStyle(
                    color: Colors.white,
                    letterSpacing: 1,
                    fontSize: 35,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold),
              ),
            ),
            floatingActionButton: FloatingActionButton(
              backgroundColor: Colors.blue.shade800,
              child: Icon(Icons.add, color: Colors.orange),
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                          backgroundColor: Colors.blue.shade800,
                          title: Text('ADD LIST',
                          style: TextStyle(color: Colors.white)),
                      content: TextField(
                      decoration: InputDecoration(hintText: 'add',hintStyle: TextStyle(color: Colors.white),
                      border: OutlineInputBorder(
                      borderSide: BorderSide(
                      color: Colors.white,
                      ),),),

                      onChanged: (String value) {
                      input = value;
                      },
                      ),
                      actions: [
                      FlatButton(
                      onPressed: () {
                      setState(() {
                      addl.add(input);
                      });
                      Navigator.of(context).pop();
                      },
                      child: Text("ADD",
                      style: TextStyle(color: Colors.white)))
                      ]
                      ,
                      );
                    });
              },
            ),
            body:
            Padding(
              padding: EdgeInsets.all(5),
              child: ListView.builder(
                  itemCount: addl.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Dismissible(
                        key: Key(addl[index]),
                        child: Card(
                          elevation: 4,
                          margin: EdgeInsets.all(8),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: ListTile(
                            title: Text(addl[index]),
                            trailing: IconButton(
                              icon: Icon(Icons.delete, color: Colors.redAccent),
                              onPressed: () {
                                setState(() {
                                  addl.removeAt(index);
                                });
                              },
                            ),
                          ),
                        ));
                  }),
            ),
          ),
        ]);
  }
}
