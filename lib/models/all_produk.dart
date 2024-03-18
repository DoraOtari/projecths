
class Produk {
 final String judul;
 final String deksripsi;
 final double harga;
 final String kategori;
 final String gambar;
 final double rate;
 final int count;

 Produk({ 
  required this.judul, 
  required this.deksripsi,
  required this.harga,
  required this.kategori,
  required this.gambar,
  required this.rate,
  required this.count,
  });

  factory Produk.fromJson(Map<String,dynamic> json){
    return Produk(
      judul: json['title'], 
      deksripsi: json['description'], 
      harga: json['price'], 
      kategori: json['category'], 
      gambar: json['image'], 
      rate: json['rating']['rate'], 
      count: json['rating']['count']);
  }

}