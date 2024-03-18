import 'dart:convert';

import 'package:projecths/models/all_produk.dart';
import 'package:http/http.dart' as http;

class AllProdukController {
 Future<List<Produk>> ambilProduk() async {
   final respon = await http.get(Uri.parse("https://fakestoreapi.com/products"));
   if (respon.statusCode == 200) {
    final List jsonData = jsonDecode(respon.body);
    return jsonData.map((data) => Produk.fromJson(data)).toList();
   } else {
    throw Exception("gagal memuat data");
   }
  }
}