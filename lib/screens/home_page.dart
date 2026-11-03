
import 'package:flutter/material.dart';
import 'add_note_page.dart';
import 'detail_note_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

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

  Future<void> tambahCatatan() async {

    final hasil = await Navigator.push<Map<String, String>>(
      context,
      MaterialPageRoute(
        builder: (context) => const AddNotePage(),
      ),
    );

    if (hasil != null) {

      setState(() {
        daftarCatatan.insert(0, hasil);
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Catatan berhasil ditambahkan!'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F7),

      appBar: AppBar(
        title: const Text(
          'My Daily Notes',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
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

                onTap: () async {
                  final Object? hasil = await Navigator.push<Object?>(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailNotePage(
                        judul: catatan['judul']!,
                        isi: catatan['isi']!,
                        tanggal: catatan['tanggal']!,
                      ),
                    ),
                  );

                  if (!mounted) return;

                  if (hasil == 'hapus') {
                    setState(() {
                      daftarCatatan.remove(catatan);
                    });

                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Catatan berhasil dihapus!'),
                      ),
                    );
                  } else if (hasil is Map<String, String>) {
                    setState(() {
                      final index = daftarCatatan.indexOf(catatan);

                      if (index != -1) {
                        daftarCatatan[index] = hasil;
                      }
                    });

                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Catatan berhasil diperbarui!'),
                      ),
                    );
                  }
                },

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

      floatingActionButton: FloatingActionButton(
        onPressed: tambahCatatan,
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        child: const Icon(Icons.add),
      ),
    );
  }
}
