import 'package:adonai/app_navigator.dart';
import 'package:adonai/models/Sermons.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SermonsListView extends StatefulWidget {
  final List<Sermon> sermons;
  const SermonsListView({Key? key, required this.sermons}) : super(key: key);

  @override
  _SermonsListViewState createState() => _SermonsListViewState();
}

class _SermonsListViewState extends State<SermonsListView> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: GridView.count(
      shrinkWrap: false,
      crossAxisCount: 4,
      crossAxisSpacing: 04,
      // mainAxisSpacing: 10,
      childAspectRatio: 1.8,
      children: widget.sermons
          .map((sermon) => SermonTileCard(sermon: sermon))
          .toList(),
    ));
  }
}

class SermonTileCard extends StatefulWidget {
  final Sermon sermon;
  const SermonTileCard({Key? key, required this.sermon}) : super(key: key);

  @override
  _SermonTileCardState createState() => _SermonTileCardState();
}

class _SermonTileCardState extends State<SermonTileCard> {
  var _focus = FocusNode();
  var _isFocused = false;

  Widget build(BuildContext context) {
    return RawKeyboardListener(
      onKey: _handleKeyEvent,
      focusNode: _focus,
      child: InkWell(
        child: Card(
          color: (_isFocused) ? Colors.white : Colors.transparent,
          child: _sermonImage(context),
        ),
      ),
    );
  }

  void initState() {
    super.initState();
    /* Initialize the focus. */
    _focus.addListener(
        () => setState(() => _isFocused = (_focus.hasFocus) ? true : false));
  }

  void dispose() {
    super.dispose();
    _focus.dispose();
  }

  _sermonImage(contex) => Container(
        decoration: BoxDecoration(
            borderRadius:
                BorderRadius.circular(MediaQuery.of(context).size.width * .02),
            border: Border.all(
                color: (_isFocused) ? Colors.white : Colors.transparent,
                width: MediaQuery.of(context).size.width * .004)),
        child: CachedNetworkImage(
          fit: BoxFit.cover,
          imageUrl: widget.sermon.thumbnails[3].url,
          placeholder: (contex, url) => Center(
            child: CircularProgressIndicator(
              color: Colors.red,
            ),
          ),
          errorWidget: (context, url, error) => Icon(Icons.error),
        ),
      );

  _handleKeyEvent(RawKeyEvent event) {
    if ((event.physicalKey == PhysicalKeyboardKey.mediaPlayPause) ||
        (event.physicalKey == PhysicalKeyboardKey.select) ||
        (event.logicalKey == LogicalKeyboardKey.select) ||
        (event.physicalKey == PhysicalKeyboardKey.mediaPlay)) {
      Navigator.of(context)
          .pushNamed(RouteList.VIDEO_DETAILS_SCREEN, arguments: widget.sermon);
    }
  }
}
