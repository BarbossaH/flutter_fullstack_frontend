import 'package:amzone_clone/constants/global_variables.dart';
import 'package:amzone_clone/features/auth/screens/auth_screen.dart';
import 'package:amzone_clone/router.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          scaffoldBackgroundColor: GlobalVariable.backgroundColor,
          colorScheme:
              const ColorScheme.light(primary: GlobalVariable.primaryColor),
          appBarTheme: const AppBarTheme(
              // color: Colors.amber,
              elevation: 0,
              iconTheme: IconThemeData(color: Colors.black)),
          // useMaterial3: true,
        ),
        onGenerateRoute: (settings) => generateRoute(settings),
        home: Scaffold(
          appBar: AppBar(title: const Text("Amazon")),
          body: Column(
            children: [
              const Center(child: Text("This is a full stack project")),
              // ElevatedButton(
              //     onPressed: () {
              //       Navigator.of(context).pushNamed(AuthScreen.routeName);
              //     },
              // child: const Text('Click'))
              Builder(builder: (context) {
                return ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, AuthScreen.routeName);
                    },
                    child: const Text('Click'));
              })
            ],
          ),
        ));
  }
}
