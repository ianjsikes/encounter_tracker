import 'package:flutter/material.dart';
import 'monster_row.dart';

void main() => runApp(MyApp());

typedef B MapWithIndexCallback<B, A>(A a, int index);

Iterable<B> mapWithIndex<B, A>(List<A> l, MapWithIndexCallback<B, A> cb) {
  Map<int, A> map = l.asMap();
  return map.keys.map((key) {
    return cb(map[key], key);
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTitle = 'Form Validation Demo';

    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(title: Text(appTitle)),
        body: MyForm(),
      ),
    );
  }
}

class MyForm extends StatefulWidget {
  @override
  MyFormState createState() {
    return MyFormState();
  }
}

class MyFormState extends State<MyForm> {
  List monsters = [
    { 'numMonsters': 0, 'cr': 1.000 },
    { 'numMonsters': 2, 'cr': 4.000 },
  ];

  final myController = TextEditingController();
  final playerNumberController = TextEditingController();

  String menuValue = "c";

  List<Widget> _buildMonsterRows() {
    return mapWithIndex(this.monsters, (monster, index) {
      return MonsterRow(
        numMonsters: monster['numMonsters'],
        cr: monster['cr'],
        onChange: (newNumMonsters, newCr) {
          setState(() {
            this.monsters[index]['numMonsters'] = newNumMonsters;
            this.monsters[index]['cr'] = newCr;
          });
        },
        onDelete: () {
          setState(() {
            this.monsters.removeAt(index);
          });
        }
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    // int total = 
    return Container(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: []..addAll(_buildMonsterRows())..addAll([
          Text("foobar"),
          FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {
              print("hello");
              setState(() {
                this.monsters.add({ 'numMonsters': 0, 'cr': 1.000 });
              });
            }
          ),
        ]),
      ),
    );
  }

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }
}
