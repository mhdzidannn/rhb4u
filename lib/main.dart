import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:rhb4u/widgets/color.dart';

import 'notifier/questionNotifier.dart';
import 'onboard.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.dark.copyWith(statusBarColor: Colors.transparent),
    );
    
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => QuestionNotifier(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
          theme: ThemeData(
            pageTransitionsTheme: PageTransitionsTheme(
              builders: {
                TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
                TargetPlatform.android: CupertinoPageTransitionsBuilder(),
              }
            ),
            checkboxTheme: Theme.of(context).checkboxTheme.copyWith(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              side: BorderSide(
                width: 1, 
                color: Theme.of(context).unselectedWidgetColor
              ),
              splashRadius: 0,
            ),
            canvasColor: Colors.white,
            primarySwatch: colorBlue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
        home: OnBoardingPage(),
      ),
    );
  }
}
