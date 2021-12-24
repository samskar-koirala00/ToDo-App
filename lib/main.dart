import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      title: "Todo App",
      home: TODOAPP(),
    ));

class TODOAPP extends StatefulWidget {
  const TODOAPP({Key? key}) : super(key: key);

  @override
  _TODOAPPState createState() => _TODOAPPState();
}

class _TODOAPPState extends State<TODOAPP> {
  late String value;

  var listTODO = [
    '',
  ];

  addTODO(String item) {
    setState(() {
      listTODO.add(item);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Todo App"),
          centerTitle: true,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            addTODO(value);
          },
          child: Icon(Icons.add),
        ),
        body: ListView.builder(
            itemCount: listTODO.length,
            itemBuilder: (context, index) {
              return index == 0
                  ? Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: TextFormField(
                          decoration: InputDecoration(hintText: "Add work"),
                          onChanged: (val) {
                            value = val;
                          }),
                    )
                  : ListTile(
                      leading: Icon(Icons.work),
                      title: Text(
                        '${listTODO[index]}',
                      ),
                    );
            }));
  }
}
