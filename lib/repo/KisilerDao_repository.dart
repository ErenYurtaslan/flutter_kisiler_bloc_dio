import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_kisiler_bloc_dio/entity/Kisiler.dart';
import 'package:flutter_kisiler_bloc_dio/entity/KisilerCevap.dart';

class KisilerDaoRepository{

  List<Kisiler> parseCevap(String cevap){
    return KisilerCevap.fromJson(json.decode(cevap)).kisiler;
  }

  Future<void> kayit(String kad, String kno) async{
    var url = "http://kasimadalan.pe.hu/kisiler/insert_kisiler.php";
    var veri = {"kisi_ad" : kad, "kisi_tel" : kno};
    var yanit = await Dio().post(url, data: FormData.fromMap(veri));
    print("Kişi Ekleme Başarılı Mı : ${yanit.data.toString()}");
  }

  Future<void> guncelle(int kid,String kad, String kno) async{
    var url = "http://kasimadalan.pe.hu/kisiler/update_kisiler.php";
    var veri = {"kisi_id" : kid, "kisi_ad" : kad, "kisi_tel" : kno};
    var yanit = await Dio().post(url, data: FormData.fromMap(veri));
    print("Kişi Güncelleme Başarılı Mı : ${yanit.data.toString()}");
  }

  Future<List<Kisiler>> tumKisileriAl() async {
    var url = "http://kasimadalan.pe.hu/kisiler/tum_kisiler.php";
    var yanit =await Dio().get(url);
    return parseCevap(yanit.data.toString());
  }

  Future<List<Kisiler>> kisiAra(String arama) async {
    var url = "http://kasimadalan.pe.hu/kisiler/tum_kisiler_arama.php";
    var veri = {"kisi_ad" : arama};
    var yanit =await Dio().post(url, data: FormData.fromMap(veri));
    return parseCevap(yanit.data.toString());
  }

  Future<void> sil(int kid) async{
    var url = "http://kasimadalan.pe.hu/kisiler/delete_kisiler.php";
    var veri = {"kisi_id" : kid};
    var yanit =await Dio().post(url, data: FormData.fromMap(veri));
    print("Kişi Silme Başarılı mı : ${yanit.data.toString()}");
  }


}