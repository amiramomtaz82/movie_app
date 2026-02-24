import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/provider/language_provider.dart';
import 'package:movie_app/provider/theme_provider.dart';
import 'package:movie_app/ui/screens/splash_screen.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(ChangeNotifierProvider(create: (_)=>ThemeProvider(),
    child: ChangeNotifierProvider(create:(_)=>LanguageProvider(),

        child: MyApp() ),
  ));
}

class MyApp extends StatelessWidget {
  late LanguageProvider provider;
  late ThemeProvider theme;
   MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    provider = Provider.of(context);
    theme=Provider.of(context);

    return MaterialApp(home: SplashScreen(),





    );
  }
}
