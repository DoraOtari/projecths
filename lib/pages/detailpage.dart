import 'package:flutter/material.dart';
import 'package:projecths/models/all_produk.dart';
import 'package:projecths/pages/shoppage.dart';

class DetailPage extends StatelessWidget {
  final Produk product;
  const DetailPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Produk"),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Align(
              alignment: Alignment.center,
              child: Image.network(product.gambar, height: 200)),
            Text(product.judul, style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold
            ),
            ),
            Text(product.kategori, style: const TextStyle(
              color: Colors.grey
            ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Harga: ${formatRupiah(product.harga)}"),
                QtyBeli(),
              ],
            ),
            Text("Deskripsi", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),),
            Text(product.deksripsi),
          ],
        ),
      ),
    );
  }
}

class QtyBeli extends StatefulWidget {
  const QtyBeli({
    super.key,
  });

  @override
  State<QtyBeli> createState() => _QtyBeliState();
}

class _QtyBeliState extends State<QtyBeli> {
  int _qty = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.pink.shade300,
        borderRadius: BorderRadius.circular(10)
      ),
      child: Row(
    
        children: [
        IconButton(onPressed: _qtyKurang, icon: const Icon(Icons.remove),color: Colors.white,),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 8),
          child: Text(_qty.toString(), style: TextStyle(fontSize: 18,color:Colors.white),)
        ),
        IconButton(onPressed: _qtyTambah, icon: const Icon(Icons.add),color: Colors.white,),
      ],
      ),
    );
  }

  void _qtyKurang() {
    setState(() {
      if (_qty > 0) {
        _qty--;
      }
    });
  }

  void _qtyTambah() {
    setState(() {
      _qty++;
    });
  }
}