import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Field2 extends StatefulWidget {
  @override
  _DynamicDialogState createState() => _DynamicDialogState();
}

class _DynamicDialogState extends State<Field2> {
  final List<String> _minValues = [
    "  \$1000",
    "  \$2000",
    "  \$3000",
    "  \$4000",
    "  \$5000"
  ];
  List<String> _maxValues = [
    "  \$1000",
    "  \$2000",
    "  \$3000",
    "  \$4000",
    "  \$5000"
  ];
  var maxValue, minValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20, top: 10),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  hint: Text("Min",style: TextStyle(color: Colors.grey,fontSize: 12,fontFamily: "Regular"),),
                  value: minValue,
                  isDense: true,
                  onChanged: (newValue) {
                    setState(() {
                      minValue = newValue;
                    });
                    print(minValue);
                  },
                  items: _minValues.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value,style: TextStyle(color: Colors.grey,fontSize: 12,fontFamily: "Regular"),),
                    );
                  }).toList(),
                ),
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            flex: 1,
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  hint: Text("Max",style: TextStyle(color: Colors.grey,fontSize: 12,fontFamily: "Regular"),),
                  value: maxValue,
                  isDense: true,
                  onChanged: (newValue) {
                    setState(() {
                      maxValue = newValue;
                    });
                    print(maxValue);
                  },
                  items: _maxValues.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value,style: TextStyle(color: Colors.grey,fontSize: 12,fontFamily: "Regular"),),
                    );
                  }).toList(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
