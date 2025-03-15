import 'package:flutter/material.dart';
import 'package:losethings/core/views/screens/add_lost_item_screen.dart';
import 'package:losethings/core/views/screens/lost_item_details_screen.dart';
import 'package:losethings/core/views/screens/products_from_api.dart';
import 'package:losethings/core/views/screens/search_screen.dart';
import 'package:losethings/core/views/widgets/build_icon_action.dart';

import '../widgets/custom_drawer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
static const String id="home";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        title: const Text(
          'المفقودات',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
actions: [
  IconButton(onPressed: (){
    Navigator.pushNamed(context, ProductsFromApi.id);
  }, icon: Icon(Icons.api_outlined)),
],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // حقل البحث
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(12),
              ),
              child: TextField(
                decoration: const InputDecoration(
                  hintText: 'ابحث عن شيء مفقود...',
                  border: InputBorder.none,
                  prefixIcon: Icon(Icons.search, color: Colors.grey),
                  contentPadding: EdgeInsets.symmetric(vertical: 14),
                ),
                onChanged: (value) {
                  // تنفيذ البحث
                },
              ),
            ),
            const SizedBox(height: 16),
            // الأيقونات الثلاثة
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                BuildIconAction(
                  onTap: () {
                    Navigator.pushNamed(context, SearchScreen.id);
                  },
                  icon: Icon(Icons.search_rounded),
                  text: "البحث",
                ),
                BuildIconAction(
                    onTap: () {
                      Navigator.pushNamed(context, AddLostItemScreen.id);
                    },
                    icon: Icon(Icons.add),
                    text: "اضافة مفقود"),
                BuildIconAction(
                  onTap: () {
                    Navigator.pushNamed(context, AddLostItemScreen.id);
                  },
                  icon: Icon(Icons.add),
                  text: "اضافة معثور عليه",
                ),
              ],
            ),
            const SizedBox(height: 16),
            // النص التوضيحي للإعلانات
            const Text(
              'الإعلانات الأخيرة',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            // قائمة المفقودات
            Expanded(
              child: ListView.builder(
                itemCount: 6,
                itemBuilder: (context, index) {
                  return _buildLostItemCard(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ويدجت لإنشاء بطاقات المفقودات
  Widget _buildLostItemCard(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 3,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.asset(
            'assets/images/51paWD-knaL.jpg',
            width: 60,
            height: 60,
          ),
        ),
        title: const Text(
          'ساعة مفقود - ابل ',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: const Text(
          'الموقع: شارع النصر  - صنعاء\nتاريخ: 25 يناير 2025',
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: () {
          Navigator.pushNamed(context,LostItemDetailsScreen.id);
        },
      ),

    );

  }

}

