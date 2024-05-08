import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_kisiler_bloc_dio/Views/Anasayfa.dart';
import 'package:flutter_kisiler_bloc_dio/cubit/KayitCubit.dart';

class KisiKayit extends StatefulWidget {
  const KisiKayit({super.key});

  @override
  State<KisiKayit> createState() => _KisiKayitState();
}

class _KisiKayitState extends State<KisiKayit> {

  var ad = TextEditingController();
  var no = TextEditingController();




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title:  const Text("Yeni Kayıt",style: TextStyle(color: Colors.white),),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 30,right: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[

              TextField(controller: ad, decoration: const InputDecoration(hintText: "Kişi Adı"),),

              TextField(controller: no, decoration: const InputDecoration(hintText: "Kişi No"),),

              ElevatedButton(
                  onPressed: (){
                    context.read<KayitCubit>().kayit(ad.text, no.text);
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const Anasayfa()));
                  }, child: const Text("Kaydet")),

            ],
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: (){
          //Navigator.push(context, MaterialPageRoute(builder: (context)=>KisiKayit()));
        },
        child: const Icon(Icons.add_card_sharp),
      ),
    );
  }
}
