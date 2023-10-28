import 'package:flutter/material.dart';

class AccountButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  const AccountButton({
    Key? key,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        height: 100,
        decoration: BoxDecoration(
          border:
              Border.all(color: Color.fromARGB(0, 255, 255, 255), width: 0.0),
          borderRadius: BorderRadius.circular(4),
          color: Color.fromARGB(150, 255, 255, 255),
        ),
        child: OutlinedButton(
          style: ElevatedButton.styleFrom(
            primary: Color.fromARGB(0, 255, 255, 255).withOpacity(0.03),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          onPressed: onTap,
          child: Text(
            text,
            style: const TextStyle(
              color: Color.fromARGB(255, 135, 206, 250),
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
      ),
    );
  }
}
