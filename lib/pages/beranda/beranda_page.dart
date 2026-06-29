import 'package:flutter/material.dart';
import './search_field.dart';
import 'package:sewa_mobil/pages/beranda/mobil_list.dart'; // Jalur absolut agar aman
import './mobil_card.dart';

class berandapage extends StatelessWidget {
  final Function(Map<String, dynamic>) onTambahPesanan;

  const berandapage({super.key, required this.onTambahPesanan});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: const SearchField(),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12.0,
                mainAxisSpacing: 12.0,
                mainAxisExtent: 250,
              ),
              itemCount: mobilList.length,
              itemBuilder: (_, index) {
                return MobilCard(
                  judul: mobilList.elementAt(index)['judul'],
                  harga: mobilList.elementAt(index)['harga'],
                  foto: mobilList.elementAt(index)['foto'],
                  onTambahPesanan: onTambahPesanan,
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
