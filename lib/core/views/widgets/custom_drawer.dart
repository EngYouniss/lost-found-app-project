import 'package:flutter/material.dart';
import 'package:losethings/core/views/screens/home_screen.dart';
import 'package:losethings/core/views/screens/login_screen.dart';
import 'package:losethings/core/views/screens/search_screen.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: const Text("يونس"),
            accountEmail: const Text("younis@gmail.com"),
            currentAccountPicture: const CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(Icons.person, size: 40, color: Colors.blue),
            ),
            decoration: const BoxDecoration(color: Colors.blue),
          ),
          ListTile(
            leading: const Icon(Icons.home, color: Colors.blue),
            title: const Text('الرئيسية'),
            onTap: () {
              Navigator.pushNamed(context, HomeScreen.id);
            },
          ),
          ListTile(
            leading: const Icon(Icons.search, color: Colors.blue),
            title: const Text('البحث'),
            onTap: () {
              Navigator.pushNamed(context, SearchScreen.id);
            },
          ),
          ListTile(
            leading: const Icon(Icons.info, color: Colors.blue),
            title: const Text('المزيد'),
            onTap: () {
              Navigator.pushNamed(context, '/more');
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings, color: Colors.blue),
            title: const Text('الإعدادات'),
            onTap: () {
              Navigator.pushNamed(context, '/settings');
            },
          ),
          const Divider(), // خط فاصل لتحسين المظهر
          ListTile(
            leading: const Icon(Icons.person, color: Colors.blue),
            title: const Text("حسابي الشخصي"),
            onTap: () {
              Navigator.pushNamed(context, '/profile');
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout, color: Colors.red),
            title: const Text("تسجيل الخروج"),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/');
            },
          ),
        ],
      ),
    );
  }
}
