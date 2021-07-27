import 'package:adonai_2/models/Sermons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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

class SermonTile extends StatefulWidget {
  final Sermon sermon;

  const SermonTile({Key? key, required this.sermon}) : super(key: key);
  _SermonTileState createState() => _SermonTileState();
}

class _SermonTileState extends State<SermonTile> {
  var _focus = FocusNode();
  bool _isFocused = false;

  void _onFocusChange() {
    setState(() {
      if (_focus.hasFocus) {
        _isFocused = true;
      } else {
        _isFocused = false;
      }
    });
  }

  void _handleKeyEvent(RawKeyEvent event) {
    if ((event.physicalKey == PhysicalKeyboardKey.mediaPlayPause) ||
        (event.physicalKey == PhysicalKeyboardKey.select) || 
        (event.logicalKey == LogicalKeyboardKey.select)) {
      Navigator.of(context).pushNamed("/videoScreen", arguments: widget.sermon);
    }
  }

  @override
  void initState() {
    super.initState();
    _focus.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    super.dispose();
    _focus.dispose();
  }

  Widget build(BuildContext context) {
    return RawKeyboardListener(
      focusNode: _focus,
      onKey: _handleKeyEvent,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        foregroundDecoration: BoxDecoration(
          color: (_isFocused) ? Colors.transparent : Colors.black54,
        ),
        curve: Curves.fastOutSlowIn,
        child: InkWell(
          onTap: () => Navigator.of(context)
              .pushNamed("/videoScreen", arguments: widget.sermon),
          child: Stack(children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Image.network(widget.sermon.thumbnails[3].url,
                  fit: BoxFit.cover),
            ),
            Center(
                child: (_isFocused)
                    ? Container(
                        width: MediaQuery.of(context).size.width * .04,
                        color: Colors.black54,
                        child: Icon(
                          Icons.play_arrow,
                          color: Colors.white,
                        ),
                      )
                    : Container())
          ]),
        ),
      ),
    );
  }
}
