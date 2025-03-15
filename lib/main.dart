import 'package:flutter/material.dart';
import 'package:losethings/core/views/screens/add_lost_item_screen.dart';
import 'package:losethings/core/views/screens/login_screen.dart';
import 'package:losethings/core/views/screens/lost_item_details_screen.dart';
import 'package:losethings/core/views/screens/register_screen.dart';

import 'core/views/screens/home_screen.dart';
import 'core/views/screens/products_from_api.dart';
import 'core/views/screens/search_screen.dart';
import 'core/views/widgets/custom_form_field.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'LoseThings App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => LoginScreen(), // الشاشة الرئيسية
        RegisterScreen.id: (context) => RegisterScreen(),
        HomeScreen.id: (context) => const HomeScreen(),
        SearchScreen.id: (context) => const SearchScreen(),
        AddLostItemScreen.id: (context) => const AddLostItemScreen(),
        LostItemDetailsScreen.id: (context) => const LostItemDetailsScreen(),
        ProductsFromApi.id:(context)=>const ProductsFromApi(),
// شاشة إنشاء الحساب
      },
    );
  }
}
