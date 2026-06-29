import 'package:flutter/material.dart';

class OrderPage extends StatelessWidget {
  final List<Map<String, dynamic>> daftarPesanan;

  const OrderPage({super.key, required this.daftarPesanan});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            const Text('Pesanan Saya', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue[900],
        centerTitle: true,
      ),
      body: daftarPesanan.isEmpty
          ? const Center(
              child: Text(
                "Belum ada mobil yang disewa.",
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: daftarPesanan.length,
              itemBuilder: (context, index) {
                final pesanan = daftarPesanan[index];
                return Card(
                  elevation: 3,
                  margin: const EdgeInsets.only(
                      bottom:
                          12), // Perbaikan dari EdgeInsets.bottom yang error
                  child: ListTile(
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(4),
                      child: Image.asset(pesanan['foto'],
                          width: 50, height: 40, fit: BoxFit.cover),
                    ),
                    title: Text(pesanan['judul'],
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Text(
                        "Status: Sedang Disewa\nTotal: ${pesanan['harga']}"),
                    trailing: const Text("Hari Ini",
                        style: TextStyle(
                            color: Colors.blue, fontWeight: FontWeight.bold)),
                    isThreeLine: true,
                  ),
                );
              },
            ),
    );
  }
}
