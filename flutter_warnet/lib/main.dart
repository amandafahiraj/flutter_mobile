import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Warnet Billing',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final _formKey = GlobalKey<FormState>();
  TextEditingController _kodePelangganController = TextEditingController();
  TextEditingController _namaPelangganController = TextEditingController();
  TextEditingController _jamMasukController = TextEditingController();
  TextEditingController _jamKeluarController = TextEditingController();
  String? _jenisPelanggan;

  int _lama = 0;
  double _totalBayar = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  void _calculateTotal() {
    if (_formKey.currentState!.validate()) {
      int jamMasuk = int.tryParse(_jamMasukController.text) ?? 0;
      int jamKeluar = int.tryParse(_jamKeluarController.text) ?? 0;
      int lama = jamKeluar - jamMasuk;
      double tarif = 10000;
      double diskon = 0;

      if (_jenisPelanggan == 'VIP' && lama > 2) {
        diskon = 0.02;
      } else if (_jenisPelanggan == 'GOLD' && lama > 2) {
        diskon = 0.05;
      }

      setState(() {
        _lama = lama;
        _totalBayar = lama * tarif * (1 - diskon);
      });

      // Pindah ke tab kedua untuk menampilkan hasil
      _tabController.animateTo(1);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Warnet Billing'),
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: 'Input Data'),
            Tab(text: 'Hasil Perhitungan'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          // Tab pertama: Input Data
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _kodePelangganController,
                    decoration: InputDecoration(labelText: 'Kode Pelanggan'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Kode Pelanggan harus diisi';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _namaPelangganController,
                    decoration: InputDecoration(labelText: 'Nama Pelanggan'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Nama Pelanggan harus diisi';
                      }
                      return null;
                    },
                  ),
                  DropdownButtonFormField<String>(
                    value: _jenisPelanggan,
                    items: ['VIP', 'GOLD'].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (newValue) {
                      setState(() {
                        _jenisPelanggan = newValue;
                      });
                    },
                    decoration: InputDecoration(labelText: 'Jenis Pelanggan'),
                    validator: (value) {
                      if (value == null) {
                        return 'Pilih jenis pelanggan';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _jamMasukController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(labelText: 'Jam Masuk (24 jam)'),
                    validator: (value) {
                      if (value == null || value.isEmpty || int.tryParse(value) == null) {
                        return 'Jam Masuk harus diisi dan valid';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _jamKeluarController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(labelText: 'Jam Keluar (24 jam)'),
                    validator: (value) {
                      if (value == null || value.isEmpty || int.tryParse(value) == null) {
                        return 'Jam Keluar harus diisi dan valid';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _calculateTotal,
                    child: Text('Hitung Total'),
                  ),
                ],
              ),
            ),
          ),
          // Tab kedua: Hasil Perhitungan
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Kode Pelanggan: ${_kodePelangganController.text}'),
                Text('Nama Pelanggan: ${_namaPelangganController.text}'),
                Text('Jenis Pelanggan: ${_jenisPelanggan ?? ""}'),
                Text('Lama Penggunaan: $_lama jam'),
                Text('Total Bayar: Rp$_totalBayar'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
