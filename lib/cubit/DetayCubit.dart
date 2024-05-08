import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_kisiler_bloc_dio/repo/KisilerDao_repository.dart';

class DetayCubit extends Cubit<void>{
  DetayCubit():super("");

  var kRepo = KisilerDaoRepository();

  Future<void> guncelle(int kid,String kad, String kno) async{
    await kRepo.guncelle(kid, kad, kno);
  }
}