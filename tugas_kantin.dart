import 'dart:io';

void main() {
  print("====================================");
  print("        INPUT DATA TRANSAKSI        ");
  print("====================================");

  stdout.write("Masukkan Nama Pembeli : ");
  String namaPembeli = stdin.readLineSync() ?? "";

  stdout.write("Masukkan Nama Makanan : ");
  String namaMakanan = stdin.readLineSync() ?? "";

  stdout.write("Masukkan Harga Makanan : ");
  double hargaMakanan = double.parse(stdin.readLineSync() ?? "0");

  stdout.write("Masukkan Jumlah Beli   : ");
  int jumlahBeli = int.parse(stdin.readLineSync() ?? "0");

  double subtotal = hitungSubtotal(hargaMakanan, jumlahBeli);
  double diskon = hitungDiskon(subtotal);
  double totalBayar = subtotal - diskon;

  bool dapetStiker = cekBonusMerchandise(totalBayar);

  stdout.write("Masukkan Uang Bayar    : ");
  double uangBayar = double.parse(stdin.readLineSync() ?? "0");

  print("\n");

  print("====================================");
  print("               KANTIN               ");
  print("====================================");
  print("Nama Pembeli : $namaPembeli");
  print("Makanan      : $namaMakanan ($jumlahBeli pcs)");
  print("Subtotal     : Rp $subtotal");
  print("Diskon       : Rp $diskon");
  print("Total Bayar  : Rp $totalBayar");
  print("------------------------------------");
  print("Dapat Bonus Stiker RPL? : $dapetStiker");
  print("------------------------------------");

  hitungKembalian(uangBayar, totalBayar);
  print("====================================");
}

double hitungSubtotal(double harga, int jumlah) {
  return harga * jumlah;
}

double hitungDiskon(double subtotal) {
  if (subtotal >= 30000) {
    return subtotal * 0.10;
  } else {
    return 0;
  }
}

bool cekBonusMerchandise(double totalBayar) => totalBayar >= 50000;

void hitungKembalian(double uangBayar, double totalBayar) {
  print("Uang Bayar   : Rp $uangBayar");
  if (uangBayar < totalBayar) {
    print("Pesan        : Uang Anda Kurang!");
  } else {
    double kembalian = uangBayar - totalBayar;
    print("Kembalian    : Rp $kembalian");
  }
}
