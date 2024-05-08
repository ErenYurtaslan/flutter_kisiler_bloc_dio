import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_kisiler_bloc_dio/entity/Kisiler.dart';
import 'package:flutter_kisiler_bloc_dio/repo/KisilerDao_repository.dart';

class AnasayfaCubit extends Cubit<List<Kisiler>> {
  AnasayfaCubit():super(<Kisiler>[]);

  var kRepo = KisilerDaoRepository();

  Future<void> kisileriYukle() async{
    var liste = await kRepo.tumKisileriAl();
    emit(liste);
  }

  Future<void> kisiAra(String arama) async{
    var liste = await kRepo.kisiAra(arama);
    emit(liste);
  }

  Future<void> sil(int kid) async{
    await kRepo.sil(kid);
    await kisileriYukle();
  }
}