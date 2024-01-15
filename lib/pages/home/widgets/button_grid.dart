import 'package:flutter/material.dart';

class ButtonGrid extends StatelessWidget {
  const ButtonGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // Jumlah kolom dalam satu baris
        crossAxisSpacing: 8.0, // Jarak antar kolom
        mainAxisSpacing: 8.0, // Jarak antar baris
      ),
      itemCount: 4, // Jumlah total item
      itemBuilder: (context, index) {
        return ButtonTheme(
          minWidth: 100.0,
          height: 50.0,
          child: ElevatedButton(
            onPressed: () {},
            child: Text("test"),
          ),
        );
      },
    );
  }
}
