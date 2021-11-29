import 'package:flutter/material.dart';
import 'package:i_vally_task_app/models/lowest_price_data.dart';
import 'package:provider/provider.dart';
import 'package:i_vally_task_app/Screens/login_screen.dart';

import 'Screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'I_Valley',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: LoginScreenView(),
      home: ChangeNotifierProvider(
        create: (context) => LowestPriceData(),
        builder: (context, child) {
          return HomeScreenView();
        },
      ),
    );
  }
}
