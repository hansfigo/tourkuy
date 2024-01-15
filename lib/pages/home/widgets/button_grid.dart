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
        return ElevatedButton(
          onPressed: () {
            // Aksi yang akan dijalankan saat tombol ditekan
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0), // Radius border tombol
            ),
            padding: const EdgeInsets.all(8.0), // Padding tombol
            minimumSize: const Size(0, 30), // Ukuran minimum tombol
          ),

          child: Text('Button $index'), // Teks pada tombol
        );
      },
    );
  }
}
