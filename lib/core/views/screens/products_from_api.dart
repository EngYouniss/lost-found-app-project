import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:losethings/helper/httpconnection.dart';

import '../widgets/custom_drawer.dart';

class ProductsFromApi extends StatelessWidget {
  const ProductsFromApi({super.key});
static const String id="products_from_api";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Products"),
        centerTitle: true,
      ),

      drawer: CustomDrawer(),

      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: HttpConnection.loadProducts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError ||
              snapshot.data == null ||
              snapshot.data!.isEmpty) {
            return const Center(child: Text("لا يوجد بيانات"));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              padding: const EdgeInsets.all(10),
              itemBuilder: (context, index) {
                var product = snapshot.data![index];
                return Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                        ),
                        child: Image.network(
                          product["thumbnail"] ?? "",
                          width: double.infinity,
                          height: 180,
                          fit: BoxFit.cover,
                        ),
                      ),
                      ListTile(
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 8),
                        title: Text(
                          product["title"] ?? "عنوان غير متوفر",
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          product["description"] ?? "لا يوجد وصف",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        trailing: Text(
                          "\$${product["price"] ?? "0"}",
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                          ),
                        ),
                      )
                    ],
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
//
//   Future<List<Map<String, dynamic>>> loadProducts() async {
//     Dio dio = Dio();
//     Response feedback = await dio.get("https://dummyjson.com/products");
//     return List<Map<String, dynamic>>.from(feedback.data["products"] ?? []);
//   }
// }
}
