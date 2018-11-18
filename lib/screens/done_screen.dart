import 'package:flutter/material.dart';

class DoneScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: _buildFavouriteList(),
    );
  }

  Widget _buildFavouriteList() {
    final items = List<String>.generate(10000, (i) => "Done $i");
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text('${items[index]}'),
        );
      },
    );
  }
}
