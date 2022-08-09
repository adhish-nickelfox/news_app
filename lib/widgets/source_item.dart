import 'package:flutter/material.dart';

import '../models/source.dart';

class SourceItem extends StatelessWidget {
  final Source _source;
  SourceItem(this._source);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        color: _source.isSelected ? Colors.blue : Colors.white,
        child: Container(
          margin: EdgeInsets.all(5),
          width: 75,
          child: Center(
            child: Text(
              _source.title,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ),
        ),
      ),
    );
  }
}
