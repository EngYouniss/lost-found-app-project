import 'package:flutter/material.dart';

class BuildIconAction extends StatelessWidget {
  final VoidCallback onTap;
  final Icon icon;
  final String text;

    const BuildIconAction({
    super.key,
    required this.onTap,
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: Colors.blue[100], // لون خلفية الأيقونة
            child: icon,
          ),
          const SizedBox(height: 8),
          Text(
            text,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
class dddd extends StatelessWidget {

  const dddd({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
