import 'package:flutter/material.dart';

typedef void MonsterRowChangeCallback(int numMonsters, double cr);

var challengeRatings = const [
  { 'name': '1/8', 'value': 0.125 },
  { 'name': '1/4', 'value': 0.250 },
  { 'name': '1/2', 'value': 0.500 },
  { 'name': '1', 'value': 1.000 },
  { 'name': '2', 'value': 2.000 },
  { 'name': '3', 'value': 3.000 },
  { 'name': '4', 'value': 4.000 },
  { 'name': '5', 'value': 5.000 },
  { 'name': '6', 'value': 6.000 },
  { 'name': '7', 'value': 7.000 },
  { 'name': '8', 'value': 8.000 },
  { 'name': '9', 'value': 9.000 },
  { 'name': '10', 'value': 10.00 },
  { 'name': '11', 'value': 11.00 },
  { 'name': '12', 'value': 12.00 },
  { 'name': '13', 'value': 13.00 },
  { 'name': '14', 'value': 14.00 },
  { 'name': '15', 'value': 15.00 },
  { 'name': '16', 'value': 16.00 },
  { 'name': '17', 'value': 17.00 },
  { 'name': '18', 'value': 18.00 },
  { 'name': '19', 'value': 19.00 },
  { 'name': '20', 'value': 20.00 },
  { 'name': '21', 'value': 21.00 },
  { 'name': '22', 'value': 22.00 },
  { 'name': '23', 'value': 23.00 },
  { 'name': '24', 'value': 24.00 },
  { 'name': '25', 'value': 25.00 },
  { 'name': '26', 'value': 26.00 },
  { 'name': '27', 'value': 27.00 },
  { 'name': '28', 'value': 28.00 },
  { 'name': '29', 'value': 29.00 },
  { 'name': '30', 'value': 30.00 },
];

class MonsterRow extends StatelessWidget {
  MonsterRow({
    Key key,
    @required this.numMonsters,
    @required this.cr,
    @required this.onChange,
    @required this.onDelete,
  }) : super(key: key);

  final int numMonsters;
  final double cr;
  final MonsterRowChangeCallback onChange;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: DropdownButton<double>(
            value: this.cr,
            items: challengeRatings.map<DropdownMenuItem<double>>((cr) {
              return DropdownMenuItem(child: Text(cr['name']), value: cr['value']);
            }).toList(),
            onChanged: (double newCr) {
              this.onChange(this.numMonsters, newCr);
            }
          ),
        ),
        Expanded(
          child: TextField(
            keyboardType: TextInputType.number,
            onChanged: (String newNumMonsters) {
              this.onChange(int.parse(newNumMonsters), this.cr);
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: IconButton(
            icon: Icon(Icons.delete),
            color: Colors.red,
            onPressed: this.onDelete,
            disabledColor: Colors.blue,
          ),
        ),
      ],
    );
  }
}
