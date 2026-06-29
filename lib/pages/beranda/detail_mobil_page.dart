import 'package:flutter/material.dart';

class DetailMobilPage extends StatelessWidget {
  final String judul;
  final String harga;
  final String foto;
  final Function(Map<String, dynamic>) onTambahPesanan;

  const DetailMobilPage({
    super.key,
    required this.judul,
    required this.harga,
    required this.foto,
    required this.onTambahPesanan,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail $judul",
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.w600)),
        backgroundColor: Colors.blue[900],
        iconTheme: const IconThemeData(color: Colors.white),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Bagian Atas & Tengah (Gambar + Deskripsi) dibuat bisa di-scroll jika layar sempit
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Gambar Mobil Besar
                  Image.asset(foto,
                      width: double.infinity, height: 230, fit: BoxFit.cover),

                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Nama Mobil
                        Text(judul,
                            style: const TextStyle(
                                fontSize: 28, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 8),

                        // Harga Mobil
                        Text("$harga / Hari",
                            style: const TextStyle(
                                fontSize: 22,
                                color: Colors.green,
                                fontWeight: FontWeight.w600)),
                        const SizedBox(height: 15),

                        const Divider(),
                        const SizedBox(height: 10),

                        const Text(
                          "Fasilitas & Spesifikasi:",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 12),

                        // Row Fasilitas
                        const Row(
                          children: [
                            Icon(Icons.ac_unit, color: Colors.blue),
                            SizedBox(width: 8),
                            Text("AC Dingin"),
                            SizedBox(width: 25),
                            Icon(Icons.airline_seat_recline_normal,
                                color: Colors.blue),
                            SizedBox(width: 8),
                            Text("4 Kursi"),
                          ],
                        ),
                        const SizedBox(height: 15),

                        // Teks Deskripsi Panjang
                        const Text(
                          "Mobil dalam kondisi sangat bersih, terawat, bahan bakar irit, serta sudah termasuk asuransi perjalanan penuh. Cocok untuk kebutuhan keluarga maupun bisnis perjalanan Anda.",
                          style: TextStyle(
                              fontSize: 14, color: Colors.grey, height: 1.5),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Bagian Tombol dipisah di luar ScrollView agar tetap menetap di bawah layar dan tidak terpotong
          Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset:
                      const Offset(0, -2), // Efek bayangan tipis di atas tombol
                ),
              ],
            ),
            child: SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  onTambahPesanan({
                    'judul': judul,
                    'harga': harga,
                    'foto': foto,
                  });

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                          "Berhasil memesan mobil $judul! Silakan cek menu Order."),
                      backgroundColor: Colors.green,
                    ),
                  );

                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue[900],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text("Sewa Mobil Sekarang",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
