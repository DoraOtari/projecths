import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:projecths/controllers/api_all_produk.dart';
import 'package:projecths/models/all_produk.dart';

String formatRupiah(harga){
  NumberFormat rupiah = NumberFormat.currency(locale: "id_ID",  symbol: "Rp. ");
  return rupiah.format(harga);
}

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {

  final AllProdukController controller = AllProdukController();

  late Future<List<Produk>> products;

  @override
  void initState() {
    super.initState();
    products = controller.ambilProduk();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(future: products, builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator(),);
        } else if(snapshot.hasError) {
          return Center(child: Text("Error: ${snapshot.error}"),);
        } else {
          return ShopPageView(products: snapshot.data ?? []);
        }
      },)
    );
  }
}

class ShopPageView extends StatelessWidget {
  final List<Produk> products;
  const ShopPageView({ required this.products });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      child: GridView.builder(
        itemCount: products.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 4,
          mainAxisSpacing: 4,
          ), 
        itemBuilder: (context, index) {
          double rupiah = products[index].harga * 14000;
          return Container(
            margin: EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(width: 1, color: Colors.grey),
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(
                  color: Colors.grey,
                  offset: Offset(2, 2),
                  blurRadius: 2,
                  )
              ]
            ),
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Column(
                children: [
                  Expanded(child: Image.network(products[index].gambar)),
                  Text(
                    products[index].judul, 
                    style: TextStyle(fontWeight: FontWeight.bold),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    ),
                  Text(products[index].kategori, style: TextStyle(color: Colors.grey),),
                  Text(formatRupiah(rupiah), style: TextStyle(fontSize: 18.5),),
                ],
              ),
            ),
          );
        },),
    );
  }
}