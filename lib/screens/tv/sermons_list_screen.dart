import 'package:adonai/models/Sermons.dart';
import 'package:adonai/widgets/tv/Sermon_tile.dart';
import 'package:flutter/material.dart';

class SermonsList extends StatelessWidget {
  final List<Sermon> sermons;

  const SermonsList({Key? key, required this.sermons}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: <Widget>[
      SliverGrid(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            crossAxisSpacing: 7,
            childAspectRatio: 1.7,
            mainAxisSpacing: 10),
        delegate: SliverChildBuilderDelegate((context, index) {
          return Card(
            child: SermonTile(sermon: sermons[index]),
          );
        }, childCount: sermons.length),
      ),
    ]);
  }
}
