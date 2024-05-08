import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_kisiler_bloc_dio/repo/KisilerDao_repository.dart';

class KayitCubit extends Cubit<void>{
  KayitCubit():super("");

  var kRepo = KisilerDaoRepository();

  Future<void> kayit(String kad, String kno) async{
    await kRepo.kayit(kad, kno);
  }
}