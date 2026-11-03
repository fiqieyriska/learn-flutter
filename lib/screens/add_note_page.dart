
import 'package:flutter/material.dart';

class AddNotePage extends StatefulWidget {
  final String? judulAwal;
  final String? isiAwal;
  final String? tanggalAwal;

  const AddNotePage({
    super.key,
    this.judulAwal,
    this.isiAwal,
    this.tanggalAwal,
  });

  @override
  State<AddNotePage> createState() => _AddNotePageState();
}

class _AddNotePageState extends State<AddNotePage> {

  final TextEditingController judulController =
  TextEditingController();

  final TextEditingController isiController =
  TextEditingController();

  @override
  void initState() {
    super.initState();

    judulController.text = widget.judulAwal ?? '';
    isiController.text = widget.isiAwal ?? '';
  }

  void simpanCatatan() {
    String judul = judulController.text.trim();
    String isi = isiController.text.trim();

    if (judul.isEmpty || isi.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Judul dan isi catatan wajib diisi!'),
        ),
      );
      return;
    }

    Navigator.pop(context, {
      'judul': judul,
      'isi': isi,
      'tanggal': widget.tanggalAwal ??
          DateTime.now().toString().substring(0, 10),
    });
  }

  @override
  void dispose() {
    judulController.dispose();
    isiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.judulAwal == null
              ? 'Tambah Catatan'
              : 'Edit Catatan',
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          children: [

            TextField(
              controller: judulController,
              decoration: const InputDecoration(
                labelText: 'Judul Catatan',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.title),
              ),
            ),

            const SizedBox(height: 20),

            TextField(
              controller: isiController,
              maxLines: 6,
              decoration: const InputDecoration(
                labelText: 'Isi Catatan',
                alignLabelWithHint: true,
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.edit_note),
              ),
            ),

            const SizedBox(height: 25),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: simpanCatatan,
                icon: const Icon(Icons.save),
                label: Text(
                  widget.judulAwal == null
                      ? 'Simpan Catatan'
                      : 'Update Catatan',
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
