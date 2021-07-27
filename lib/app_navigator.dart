import 'package:adonai_2/models/Sermons.dart';
import 'package:adonai_2/models/video_player_config.dart';
import 'package:adonai_2/screens/home.dart';
import 'package:adonai_2/screens/tv/video_player.dart';
import 'package:adonai_2/screens/tv/video_screen.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (context) => Home());
      case "/videoScreen":
        // return MaterialPageRoute(builder: (context) => VidScreen(vidUrl: settings.arguments as String,));
        return MaterialPageRoute(
            builder: (context) =>
                VideoScreen(sermon: settings.arguments as Sermon));
      case "/videoPlayerScreen":
        return MaterialPageRoute(
            builder: (context) => VideoPlayerScreen(
                videoConfig: settings.arguments as VideoConfig));
      default:
        return _errorRoute();
    }
  }
}

Route<dynamic> _errorRoute() {
  return MaterialPageRoute(builder: (_) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Error'),
      ),
      body: Center(
        child: Text('Error'),
      ),
    );
  });
}

// class AppNavigator extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<NavCubit, String>(builder:(context, id){
//       return Navigator(
//         pages: [
//           MaterialPage(child: TvHomeScreen()),
//           if (id.isNotEmpty) MaterialPage(child: VideoScreen())
//         ],
//         onPopPage: (route, result){
//           BlocProvider.of<NavCubit>(context).popToHomeScreen();
//           return route.didPop(result);
//         },
//       );
//     });
//   }
// }
