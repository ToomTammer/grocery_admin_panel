//import 'firebase_options.dart';
import 'package:admin_p/screen/main_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'const/theme_data.dart';
import 'controllers/MenuController.dart';
import 'inner_screens/add_prod.dart';
import 'provider/dark_theme_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    // Replace with actual values
    options: const FirebaseOptions(
      apiKey: "AIzaSyABEETlGcgugPGwxlUQEqpI4umbcn1Hy5g",
      authDomain: "shop-app-flutter-a34b1.firebaseapp.com",
      projectId: "shop-app-flutter-a34b1",
      storageBucket: "shop-app-flutter-a34b1.appspot.com",
      messagingSenderId: "617724466787",
      appId: "1:617724466787:web:1c221b8c8ec218b6400a56",
      measurementId: "G-NYJ5PD61QP",
    ),
  );

  //await Firebase.initializeApp();
  // await Firebase.initializeApp(
  //     //options: DefaultFirebaseOptions.currentPlatform,
  //     );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DarkThemeProvider themeChangeProvider = DarkThemeProvider();

  void getCurrentAppTheme() async {
    themeChangeProvider.setDarkTheme =
        await themeChangeProvider.drakThemePrefs.getTheme();
  }

  @override
  void initState() {
    getCurrentAppTheme();
    super.initState();
  }

  final Future<FirebaseApp> _initialization = Firebase.initializeApp(
      // options: const FirebaseOptions(
      //     apiKey: "AIzaSyABEETlGcgugPGwxlUQEqpI4umbcn1Hy5g",
      //     authDomain: "shop-app-flutter-a34b1.firebaseapp.com",
      //     projectId: "shop-app-flutter-a34b1",
      //     storageBucket: "shop-app-flutter-a34b1.appspot.com",
      //     messagingSenderId: "617724466787",
      //     appId: "1:617724466787:web:1c221b8c8ec218b6400a56",
      //     measurementId: "G-NYJ5PD61QP"),
      );

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _initialization,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const MaterialApp(
              debugShowCheckedModeBanner: false,
              home: Scaffold(
                body: Center(
                  child: Center(
                    child: Text('App is being initialized'),
                  ),
                ),
              ),
            );
          } else if (snapshot.hasError) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              home: Scaffold(
                body: Center(
                  child: Center(
                    child: Text('An error has been occured ${snapshot.error}'),
                  ),
                ),
              ),
            );
          }
          return MultiProvider(
            providers: [
              ChangeNotifierProvider(
                create: (_) => MenuController(),
              ),
              ChangeNotifierProvider(
                create: (_) {
                  return themeChangeProvider;
                },
              ),
            ],
            child: Consumer<DarkThemeProvider>(
              builder: (context, themeProvider, child) {
                return MaterialApp(
                    debugShowCheckedModeBanner: false,
                    title: 'Shop',
                    theme:
                        Styles.themeData(themeProvider.getDarkTheme, context),
                    home: const MainScreen(),
                    routes: {
                      UploadProductForm.routeName: (context) =>
                          const UploadProductForm(),
                    });
              },
            ),
          );
        });
  }
}
