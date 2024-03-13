import 'package:flutter/material.dart';
import 'package:newsapp/src/pages/pages.dart';
import 'package:newsapp/src/theme/darktheme.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: myTheme,
      title: 'Material App',
      home: const TabsPage(), 
    );
  }
}
