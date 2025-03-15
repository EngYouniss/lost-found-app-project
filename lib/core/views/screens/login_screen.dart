import 'package:flutter/material.dart';
import 'package:losethings/core/views/screens/home_screen.dart';
import 'package:losethings/core/views/screens/register_screen.dart';
import 'package:losethings/core/views/widgets/custom_form_field.dart';

class LoginScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  LoginScreen({super.key});
static const String id="login";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'تسجيل الدخول',
          style: TextStyle(fontSize: 24),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              const Icon(
                Icons.login_outlined,
                size: 100,
                color: Colors.blue,
              ),
              const SizedBox(height: 24),

              // TextFormField(
              //   controller: _emailController,
              //   decoration: const InputDecoration(
              //     labelText: 'البريد الإلكتروني',
              //     border: OutlineInputBorder(),
              //     prefixIcon: Icon(Icons.email),
              //   ),
              //   validator: (value) {
              //     if (value == null || value.isEmpty) {
              //       return 'يرجى إدخال البريد الإلكتروني';
              //     }
              //     if (!value.endsWith("@gmail.com")) {
              //       return 'البريد الإلكتروني غير صالح';
              //     }
              //     return null;
              //   },
              // ),
              CustomFormField(
                preffixIcon: const Icon(Icons.email),
                controller: _emailController,
                textLabel: "البريد الإلكتروني",
                hintText: "يرجى إدخال البريد الإلكتروني",
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'يرجى إدخال البريد الإلكتروني';
                  }
                  if (!value.endsWith("@gmail.com")) {
                    return 'البريد الإلكتروني غير صالح';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              // TextFormField(
              //   controller: _passwordController,
              //   decoration: const InputDecoration(
              //     labelText: 'كلمة المرور',
              //     border: OutlineInputBorder(),
              //     prefixIcon: Icon(Icons.lock),
              //   ),
              //   obscureText: true,
              //   validator: (value) {
              //     if (value == null || value.isEmpty) {
              //       return 'يرجى إدخال كلمة المرور';
              //     }
              //     if (value.length < 6) {
              //       return 'كلمة المرور يجب أن تكون على الأقل 6 أحرف';
              //     }
              //     return null;
              //   },
              // ),
              CustomFormField(
                controller: _passwordController,
                textLabel: "كلمة المرور",
                hintText: "يرجئ ادخال كلمة المرور",
                preffixIcon: Icon(Icons.lock),
                isSecure: true,
                validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'يرجى إدخال كلمة المرور';
                }
                if (value.length < 6) {
                  return 'كلمة المرور يجب أن تكون على الأقل 6 أحرف';
                }
                return null;
              },                                ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("مرحبا "),));

                    Navigator.pushReplacementNamed(context, HomeScreen.id);
                  }
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  backgroundColor:
                  Colors.blueAccent, // الإبقاء على اللون الأصلي
                ),
                child: const Text(
                  'تسجيل الدخول',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),

              ),
              const SizedBox(height: 16),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, RegisterScreen.id);
                },
                child: const Text(
                  'ليس لديك حساب؟ أنشئ حسابًا الآن',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.blue,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
