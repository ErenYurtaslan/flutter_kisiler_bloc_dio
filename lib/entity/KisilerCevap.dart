import 'package:flutter_kisiler_bloc_dio/entity/Kisiler.dart';

class KisilerCevap{
  List<Kisiler> kisiler;
  int success;

  KisilerCevap({required this.kisiler, required this.success});

  factory KisilerCevap.fromJson(Map<String, dynamic> json){
    var jsonDizisi = json["kisiler"] as List;
    List<Kisiler> yerelListe = jsonDizisi.map((e) => Kisiler.fromJson(e)).toList();
    return KisilerCevap(kisiler: yerelListe, success: json["success"] as int);
  }
}