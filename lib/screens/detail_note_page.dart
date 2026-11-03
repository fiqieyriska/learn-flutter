import 'package:flutter/material.dart';
import 'add_note_page.dart';

class DetailNotePage extends StatelessWidget {
  final String judul;
  final String isi;
  final String tanggal;

  const DetailNotePage({
    super.key,
    required this.judul,
    required this.isi,
    required this.tanggal,
  });

  Future<void> hapusCatatan(BuildContext context) async {
    final konfirmasi = await showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Hapus Catatan?'),
          content: const Text(
            'Apakah kamu yakin ingin menghapus catatan ini?',
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context, false);
              },
              child: const Text('Batal'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, true);
              },
              child: const Text('Hapus'),
            ),
          ],
        );
      },
    );

    if (konfirmasi == true && context.mounted) {
      Navigator.pop(context, 'hapus');
    }
  }

  Future<void> editCatatan(BuildContext context) async {
    final hasil = await Navigator.push<Map<String, String>>(
      context,
      MaterialPageRoute(
        builder: (context) => AddNotePage(
          judulAwal: judul,
          isiAwal: isi,
          tanggalAwal: tanggal,
        ),
      ),
    );

    if (hasil != null && context.mounted) {
      Navigator.pop(context, hasil);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F7),

      appBar: AppBar(
        title: const Text('Detail Catatan'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [

            Text(
              judul,
              style: const TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 30),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () => editCatatan(context),
                icon: const Icon(Icons.edit),
                label: const Text('Edit Catatan'),
              ),
            ),

            const SizedBox(height: 12),

            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                onPressed: () => hapusCatatan(context),
                icon: const Icon(Icons.delete, color: Colors.red),
                label: const Text(
                  'Hapus Catatan',
                  style: TextStyle(color: Colors.red),
                ),
              ),
            ),

            const SizedBox(height: 10),

            Row(
              children: [
                const Icon(
                  Icons.calendar_today,
                  size: 16,
                  color: Colors.grey,
                ),

                const SizedBox(width: 8),

                Text(
                  tanggal,
                  style: const TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 25),

            const Divider(),

            const SizedBox(height: 15),

            const Text(
              'Isi Catatan',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 12),

            Text(
              isi,
              style: const TextStyle(
                fontSize: 16,
                height: 1.6,
              ),
            ),

          ],
        ),
      ),
    );
  }
}
