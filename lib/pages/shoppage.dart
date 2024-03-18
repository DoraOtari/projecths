import 'package:flutter/material.dart';
import 'package:projecths/controllers/api_all_produk.dart';
import 'package:projecths/models/all_produk.dart';

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
    return GridView.builder(
      itemCount: products.length,
      gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2), 
      itemBuilder: (context, index) {
        double rupiah = products[index].harga;
        return Container(

          child: Column(
            children: [
              Expanded(child: Image.network(products[index].gambar)),
              Text(products[index].judul, style: TextStyle(fontWeight: FontWeight.bold),),
              Text(products[index].kategori, style: TextStyle(color: Colors.grey),),
              Text("Rp. "+rupiah.toString(), style: TextStyle(fontSize: 18.5),),
            ],
          ),
        );
      },);
  }
}