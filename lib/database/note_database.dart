
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Data contoh catatan
    final List<Map<String, String>> daftarCatatan = [
      {
        'judul': 'Belajar Flutter',
        'isi': 'Mempelajari dasar-dasar Flutter dan widget.',
        'tanggal': '02 November 2026',
      },
      {
        'judul': 'Aktivitas Hari Ini',
        'isi': 'Menyelesaikan project My Daily Notes.',
        'tanggal': '02 November 2026',
      },
      {
        'judul': 'Ide Project',
        'isi': 'Membuat aplikasi pencatatan harian.',
        'tanggal': '01 November 2026',
      },
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F7),

      appBar: AppBar(
        title: const Text(
          'My Daily Notes',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),

      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const Text(
            'Halo, Selamat Datang!',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 8),

          const Text(
            'Catat ide dan aktivitas harianmu.',
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey,
            ),
          ),

          const SizedBox(height: 25),

          // Informasi jumlah catatan
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Total Catatan',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),

                const SizedBox(height: 8),

                Text(
                  '${daftarCatatan.length}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 25),

          const Text(
            'Catatan Terbaru',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 12),

          // Daftar catatan
          ...daftarCatatan.map((catatan) {
            return Card(
              margin: const EdgeInsets.only(bottom: 12),
              child: ListTile(
                leading: const CircleAvatar(
                  child: Icon(Icons.note_alt_outlined),
                ),

                title: Text(
                  catatan['judul']!,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),

                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(catatan['isi']!),
                    const SizedBox(height: 5),
                    Text(
                      catatan['tanggal']!,
                      style: const TextStyle(
                        fontSize: 11,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),

                isThreeLine: true,
              ),
            );
          }),
        ],
      ),

      // Tombol tambah catatan
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                'Fitur tambah catatan akan dibuat pada Tahap 3.',
              ),
            ),
          );
        },
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        child: const Icon(Icons.add),
      ),
    );
  }
}
