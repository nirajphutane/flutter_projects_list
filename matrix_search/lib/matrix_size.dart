import 'dart:math';
import 'package:flutter/material.dart';
import 'package:mobigic/matrix_input.dart';
import 'matrix.dart';

class MatrixSize extends StatefulWidget {

  @override
  _MatrixSizeState createState() => _MatrixSizeState();
}

class _MatrixSizeState extends State<MatrixSize> {

  int row, column;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Matrix Size', style: TextStyle(color: Colors.yellowAccent)),
      ),
      body: Column(
        children: [
          SizedBox(height: 5),

          TextField(
            onChanged: (text){
              row = int.parse(text);
            },
            decoration: InputDecoration(
              isDense: true,
              filled: true,
              fillColor: Colors.indigo.shade100,
              border: OutlineInputBorder(),
              labelText: 'Row',
              hintText: 'm',
              prefixIcon: Icon(Icons.table_rows_outlined, color: Colors.indigoAccent),
              suffixIcon: Icon(Icons.grid_on, color: Colors.indigoAccent),
            ),
          ),

          SizedBox(height: 5),

          TextField(
            onChanged: (text){
              column = int.parse(text);
            },
            decoration: InputDecoration(
              isDense: true,
              filled: true,
              fillColor: Colors.indigo.shade100,
              border: OutlineInputBorder(),
              labelText: 'Column',
              hintText: 'n',
              prefixIcon: RotatedBox(
                quarterTurns: 1,
                child: Icon(Icons.table_rows_outlined, color: Colors.indigoAccent),
              ),
              suffixIcon: Icon(Icons.grid_on, color: Colors.indigoAccent),
            ),
          ),

          SizedBox(height: 15),

          ElevatedButton.icon(
            icon: Icon(
              Icons.grid_on,
              color: Colors.yellowAccent,
              size: 24.0,
            ),
            label: Text('Create Matrix'),
            onPressed: () {
              if(row == null || column == null || row <= 0 || column <= 0){
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(duration: Duration(seconds: 5), content: Text('Enter Row and Column for m * n matrix.')));
                return;
              }
              Navigator.push(context, MaterialPageRoute(builder: (context) => MatrixInput(row: row, column: column)));
            },
          ),

          SizedBox(height: 5),

          ElevatedButton.icon(
            icon: Icon(
              Icons.grid_on_sharp,
              color: Colors.yellowAccent,
              size: 24.0,
            ),
            label: Text('Create Random Matrix'),
            onPressed: () {
              if(row == null || column == null || row <= 0 || column <= 0){
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(duration: Duration(seconds: 5), content: Text('Enter Row and Column for m * n matrix.')));
                return;
              }

              List<String> alphabets = [];
              Random random = Random();
              for(int r = 0; r < row; r++){
                for(int c = 0; c < column; c++){
                  alphabets.add(String.fromCharCodes(List.generate(1, (index)=> random.nextInt(25) + 65)));
                }
              }

              Navigator.push(context, MaterialPageRoute(builder: (context) => AlphabetMatrix(row: row, column: column, alphabets: alphabets)));
            },
          )
        ],
      ),
    );
  }
}
