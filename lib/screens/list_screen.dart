import 'package:flutter/material.dart';
import 'package:ruesy/widgets/word_entry.dart';

class ListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      new WordEntry(),
      new WordEntry(),
      new WordEntry(),
      new WordEntry(),
      new WordEntry(),
      new WordEntry(),
      new WordEntry(),
      new WordEntry(),
      new WordEntry(),
      new WordEntry(),
      new WordEntry(),
    ]);
  }

  Widget _buildFavouriteList() {
    final items = List<String>.generate(10000, (i) => "List $i");
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


