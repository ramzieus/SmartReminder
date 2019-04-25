import 'package:flutter/material.dart';
import 'dart:async';
import 'package:fluttertoast/fluttertoast.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: Text('Login Page'),
        ),
        body: Container(
            padding: EdgeInsets.all(16.0),
            child: new Form(
              child: new ListView(
                shrinkWrap: true,
                children: <Widget>[
                  _showLogo(),
                  _showEmailInput(),
                  _showPasswordInput(),
                  Padding(
                      padding: EdgeInsets.fromLTRB(0.0, 45.0, 0.0, 0.0),
                      child: SizedBox(
                          height: 40.0,
                          child: new RaisedButton(
                            elevation: 5.0,
                            shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(30.0)),
                            color: Colors.blueAccent,
                            child: Text('Login',
                                style: new TextStyle(
                                    fontSize: 20.0, color: Colors.white)),
                            onPressed: () {
                              Fluttertoast.showToast(
                                  msg: "You are logged in !",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIos: 2,
                                  backgroundColor: Colors.blueGrey,
                                  textColor: Colors.white,
                                  fontSize: 16.0);
                              Future.delayed(const Duration(milliseconds: 1000),
                                  () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ListDisplay()),
                                );
                              });
                            },
                          )))
                ],
              ),
            )));
  }
}

List<String> tiitle = [];
List<String> desc = [];
List<String> donee = [];
Widget _showPasswordInput() {
  return Padding(
    padding: const EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
    child: new TextFormField(
      maxLines: 1,
      obscureText: true,
      autofocus: false,
      decoration: new InputDecoration(
          hintText: 'Password',
          icon: new Icon(
            Icons.lock,
            color: Colors.grey,
          )),
    ),
  );
}

Widget _showEmailInput() {
  return Padding(
    padding: const EdgeInsets.fromLTRB(0.0, 100.0, 0.0, 0.0),
    child: new TextFormField(
      maxLines: 1,
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      decoration: new InputDecoration(
          hintText: 'Email',
          icon: new Icon(
            Icons.mail,
            color: Colors.grey,
          )),
    ),
  );
}

Widget _showLogo() {
  return new Hero(
    tag: 'hero',
    child: Padding(
      padding: EdgeInsets.fromLTRB(0.0, 70.0, 0.0, 0.0),
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 48.0,
        child: Image.asset('assets/logo.png'),
      ),
    ),
  );
}

class ListDisplay extends StatefulWidget {
  @override
  State createState() => new DyanmicList();
}

class DyanmicList extends State<ListDisplay> {
  final a = TextEditingController();
  final b = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the Widget is disposed
    a.dispose();
    b.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext ctxt) {
    return new Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          showDialog(
              child: Dialog(
                  child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: <Widget>[
                    TextField(
                      decoration: InputDecoration(hintText: 'Note title'),
                      controller: a,
                    ),
                    TextField(
                      decoration: InputDecoration(hintText: 'discription'),
                      controller: b,
                    ),
                    
                    RaisedButton.icon(
                      icon: Icon(Icons.save),
                      label: Text('Save !'),
                      onPressed: () {
                        tiitle.add(a.text);
                        desc.add(b.text);
                        donee.add(null);
                        a.clear();
                        b.clear();
                        Navigator.of(context).pop();
                      },
                    )
                  ],
                ),
              )),
              context: context);

          setState(() {});
        },
        icon: Icon(Icons.add),
        label: Text("add new reminder"),
      ),
      appBar: AppBar(
        title: Text("Welcome User"),
      ),
      body: ListView.builder(
        itemCount: tiitle.length,
        itemBuilder: (context, position) {
          // ListTile(
          //   leading: Icon(Icons.access_alarm),
          //   title: Text(position.toString()),
          //   subtitle: Text('just test'),
          //   trailing: Icon(Icons.done),
          // );

          return Card(
            child: Padding(
              padding: const EdgeInsets.all(0.0),
              child: ListTile(
                leading: Icon(Icons.access_alarm),
                title: Text(tiitle[position]),
                subtitle: Text(desc[position]),
                trailing: Icon(
                  donee[position] == null ? Icons.done : Icons.done_all,
                  color: donee[position] != null ? Colors.blue : null,
                ),
                onTap: () {
                  donee[position] == 'true'
                      ? donee[position] = null
                      : donee[position] = 'true';
                  setState(() {});
                },
                onLongPress: () {
                  setState(() {
                    tiitle.removeAt(position);
                    desc.removeAt(position);
                    donee.removeAt(position);
                  });
                },
              ),
              // child: Text(
              //   choco[position],
              //   style: TextStyle(fontSize: 22.0),
              // ),
            ),
          );
        },
      ),
    );
  }
}

class SecondRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          tiitle.add('hhhhhh');
        },
        icon: Icon(Icons.add),
        label: Text("add new reminder"),
      ),
      appBar: AppBar(
        title: Text("Welcome User"),
      ),
      body: ListView.builder(
        itemCount: tiitle.length,
        itemBuilder: (context, position) {
          // ListTile(
          //   leading: Icon(Icons.access_alarm),
          //   title: Text(position.toString()),
          //   subtitle: Text('just test'),
          //   trailing: Icon(Icons.done),
          // );

          return Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListTile(
                leading: Icon(Icons.access_alarm),
                title: Text(tiitle[position]),
                subtitle: Text('just test'),
                trailing: Icon(Icons.done),
              ),
              // child: Text(
              //   choco[position],
              //   style: TextStyle(fontSize: 22.0),
              // ),
            ),
          );
        },
      ),
    );
  }
}
