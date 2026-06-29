import 'package:flutter/material.dart';
import '../welcome/welcome_page.dart';

class ProfilPage extends StatelessWidget {
  final String nama;
  final String email;
  final String noHp;

  const ProfilPage({
    super.key,
    required this.nama,
    required this.email,
    required this.noHp,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil Pengguna',
            style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue[900],
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 20),
            CircleAvatar(
              radius: 50,
              backgroundColor: Colors.blue[900],
              child: const Icon(Icons.person, size: 50, color: Colors.white),
            ),
            const SizedBox(height: 20),
            ListTile(
              leading: const Icon(Icons.person_outline, color: Colors.blue),
              title: const Text("Nama Lengkap"),
              subtitle: Text(nama,
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black)),
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.email_outlined, color: Colors.blue),
              title: const Text("Email"),
              subtitle: Text(email,
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black)),
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.phone_android, color: Colors.blue),
              title: const Text("Nomor Handphone"),
              subtitle: Text(noHp,
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black)),
            ),
            const Spacer(),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => const WelcomePage()),
                  (route) => false,
                );
              },
              icon: const Icon(Icons.logout, color: Colors.white),
              label: const Text("Keluar Akun",
                  style: TextStyle(color: Colors.white)),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
