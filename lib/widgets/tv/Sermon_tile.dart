import 'package:adonai_2/models/Sermons.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
            _loadSermonImage(context),
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

  Widget _loadSermonImage(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: CachedNetworkImage(
          imageUrl: widget.sermon.thumbnails[3].url,
          placeholder: (contex, url) => Center(
            child: CircularProgressIndicator(
              color: Colors.red,
            ),
          ),
          errorWidget: (context, url, error) => Icon(Icons.error),
        ));
  }
}
