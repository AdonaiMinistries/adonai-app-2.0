import 'package:adonai_2/app_navigator.dart';
import 'package:adonai_2/screens/home.dart';
import 'package:adonai_2/widgets/tv/Loading_widget.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(AdonaiApp());
}

class AdonaiApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Shortcuts(
      shortcuts: {
        LogicalKeySet(LogicalKeyboardKey.select): ActivateIntent(),
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: 'Gotham'),
        home: AnimatedSplashScreen(
          nextScreen: Home(),
          splash: LoadingWidget(),
          duration: 3000,
        ),
        // initialRoute: "/",
        onGenerateRoute: RouteGenerator.generateRoute,
      ),
    );
  }
}

// class AdonaiApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final sermonConfigCubit = SermonConfigCubit(null as SermonConfig);
//     return Shortcuts(shortcuts: {
//       LogicalKeySet(LogicalKeyboardKey.select): ActivateIntent(),
//     }, child: MaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme: adonaiTheme(),
//       home: MultiBlocProvider(providers: [
//         BlocProvider(create: (context) => SermonsBloc()..add(LoadSermonsEvent())),
//         BlocProvider(create: (context) => NavCubit(sermonConfigCubit: sermonConfigCubit)),
//         BlocProvider(create: (context) => sermonConfigCubit),
//       ], child: AppNavigator()),
//     ));
//   }
// }
