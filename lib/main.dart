import 'package:amazone_clone/common/widgets/bottom_bar.dart';
import 'package:amazone_clone/constants/global_variables.dart';
import 'package:amazone_clone/features/admin/screen/admin_screen.dart';
import 'package:amazone_clone/features/auth/services/auth_service.dart';
import 'package:amazone_clone/features/auth/screens/auth_screen.dart';
import 'package:amazone_clone/providers/providers.dart';
import 'package:amazone_clone/providers/user_provider.dart';
import 'package:amazone_clone/router.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MultiProvider(
      providers: appProviders,
      // providers: [ChangeNotifierProvider(create: (context) => UserProvider())],
      child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AuthService authService = AuthService();
  // String? localToken;
  @override
  void initState() {
    super.initState();
    // print('$context 333');
    // _loadToken();
    // print("${localToken?.isNotEmpty} $localToken 1112");

    authService.getUserData(context);
  }

  // Helper function to load the token from SharedPreferences
  // Future<void> _loadToken() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   final token = prefs.getString('x-auth-token');
  //   // print('$token 333');
  //   //Getting the token from memory is incorrect;
  //   //it should be retrieved from a file stored on the hard disk.
  //   setState(() {
  //     localToken = token;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    // print("${localToken?.isNotEmpty} $localToken 111");
    // print(Provider.of<UserProvider>(context).user.token);
    // print("${Provider.of<UserProvider>(context).user.type} 1112");

    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
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
        // home: const MeetingScreen());
        home: (Provider.of<UserProvider>(context).user.token.isNotEmpty)
            ? Provider.of<UserProvider>(context).user.type == 'user'
                ? const BottomBar()
                : const AdminScreen()
            : const AuthScreen());
  }
}
