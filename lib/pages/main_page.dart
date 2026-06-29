import 'package:flutter/material.dart';
import './beranda/beranda_page.dart';
import './order/order_page.dart';
import './profil/profil_page.dart';

class MainPage extends StatefulWidget {
  // 1. Tambahkan parameter untuk menerima data pengguna saat login sukses
  final Map<String, String>? dataPengguna;

  const MainPage({super.key, this.dataPengguna});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int pageIndex = 0;
  List<Map<String, dynamic>> pesananKu = [];

  void tambahPesanan(Map<String, dynamic> mobil) {
    setState(() {
      pesananKu.add(mobil);
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> pageList = [
      berandapage(onTambahPesanan: tambahPesanan),
      OrderPage(daftarPesanan: pesananKu),
      // 2. Kirim dataPengguna ke dalam ProfilPage
      ProfilPage(
        nama: widget.dataPengguna?['nama'] ?? 'Pengguna Sewa Mobil',
        email: widget.dataPengguna?['email'] ?? 'user@gmail.com',
        noHp: widget.dataPengguna?['nohp'] ?? '-',
      ),
    ];

    return Scaffold(
      body: pageList[pageIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            pageIndex = index;
          });
        },
        currentIndex: pageIndex,
        items: [
          barItem(Icons.home, "Beranda"),
          barItem(Icons.wallet, "Order"),
          barItem(Icons.account_circle_outlined, "Profil"),
        ],
      ),
    );
  }

  BottomNavigationBarItem barItem(IconData iconData, String title) {
    return BottomNavigationBarItem(icon: Icon(iconData), label: title);
  }
}
