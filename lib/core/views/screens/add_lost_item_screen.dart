import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class AddLostItemScreen extends StatefulWidget {
  const AddLostItemScreen({super.key});
  static const String id = "add_lost_item";

  @override
  _AddLostItemScreenState createState() => _AddLostItemScreenState();
}

class _AddLostItemScreenState extends State<AddLostItemScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _contactController = TextEditingController();
  File? _image;

  // اختيار صورة من المعرض
  Future<void> _pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  // التحقق من الحقول وارسال البيانات
  void _submitForm() {
    String name = _nameController.text;
    String location = _locationController.text;
    String date = _dateController.text;
    String contact = _contactController.text;

    if (name.isNotEmpty && location.isNotEmpty && date.isNotEmpty && contact.isNotEmpty && _image != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("تم إضافة المفقود بنجاح!")),
      );
      Navigator.pop(context);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("يرجى ملء جميع الحقول")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("إضافة مفقود"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTextField("اسم المفقود", _nameController),
              const SizedBox(height: 10),
              _buildTextField("الموقع", _locationController),
              const SizedBox(height: 10),
              _buildTextField("التاريخ", _dateController, isDate: true),
              const SizedBox(height: 10),
              _buildTextField("معلومات التواصل", _contactController),
              const SizedBox(height: 10),
              _buildImagePicker(),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _submitForm,
                  child: const Text("إضافة المفقود"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // بناء حقل النصوص
  Widget _buildTextField(String label, TextEditingController controller, {bool isDate = false}) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      ),
      readOnly: isDate,
      onTap: isDate
          ? () async {
        DateTime? pickedDate = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(2000),
          lastDate: DateTime(2100),
        );
        if (pickedDate != null) {
          setState(() {
            controller.text = "${pickedDate.year}-${pickedDate.month}-${pickedDate.day}";
          });
        }
      }
          : null,
    );
  }

  // بناء أداة اختيار الصورة
  Widget _buildImagePicker() {
    return GestureDetector(
      onTap: _pickImage,
      child: Container(
        height: 200,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.grey[200], // خلفية باهتة
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey, width: 2),
        ),
        child: _image == null
            ? Center(
          child: Icon(
            Icons.add_a_photo,
            size: 50,
            color: Colors.grey[600],
          ),
        )
            : ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.file(
            _image!,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
