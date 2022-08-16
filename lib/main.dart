import 'package:chang05/Splash/splash_screen.dart';
import 'package:chang05/transaction_consumer_provider/transaction_provider.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(LoginApp());
}

class LoginApp extends StatelessWidget {
  Color _primaryColor = HexColor('#9A0000');
  Color _accentColor = HexColor('#9A0000');
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) {
            return TransactionProvider();
          },
        ),
        ChangeNotifierProvider(
          create: (context) {
            return UserProvider();
          },
        ),
        ChangeNotifierProvider(
          create: (context) {
            return Post();
          },
        )
      ],
      child: MaterialApp(
        title: 'Chang',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: _primaryColor,
          accentColor: _accentColor,
          scaffoldBackgroundColor: Colors.grey.shade100,
          primarySwatch: Colors.grey,
        ),
        home: SplashScreen(title: 'Chang'),
      ),
    );
  }
}
