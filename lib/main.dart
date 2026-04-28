
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app_flutter/Home_Page.dart';
import 'package:shop_app_flutter/cartProvider.dart';
void main (){
  runApp(const MyApp());
}

/// Provider -> read only value
/// ChangeNotifierProvider -> change the value and  notify the value of widgets -> used in shopping app
/// Future Provider -> listen the future subscribe to them  and show the changes
/// StreamProvider -> providing the stream in provide lazy loading
/// multiprovider to multiple navigation
///
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
  return ChangeNotifierProvider(
    create: (context) => CartProvider(),

    child: MaterialApp(
    title : 'Shopping App ',
    theme : ThemeData(
      fontFamily : 'Lato',
      colorScheme : ColorScheme.fromSeed(
          seedColor: const Color.fromRGBO(254,206 , 1, 1),
          primary: const Color.fromRGBO(254,206 , 1, 1),
      ),
      appBarTheme: const AppBarTheme(
        centerTitle: true,
        titleTextStyle: TextStyle(
          fontSize: 20,
          color: Colors.black,
        )
      ),
      inputDecorationTheme : const InputDecorationTheme(
        hintStyle : TextStyle(
          fontWeight : FontWeight.bold,
          fontSize : 16,
        ),
        prefixIconColor: Color.fromRGBO(199, 199, 119, 1),
      ),
      textTheme: TextTheme(
        titleLarge:  TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 35),
        titleMedium: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
        bodySmall: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
        )

      )
    ),


    debugShowCheckedModeBanner: false,
    home : const HomePage(),
    ),
  );

  }

}