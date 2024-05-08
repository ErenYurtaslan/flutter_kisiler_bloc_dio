import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_kisiler_bloc_dio/Views/Detay.dart';
import 'package:flutter_kisiler_bloc_dio/Views/KisiKayitSayfasi.dart';
import 'package:flutter_kisiler_bloc_dio/cubit/AnasayfaCubit.dart';
import 'package:flutter_kisiler_bloc_dio/entity/Kisiler.dart';


class Anasayfa extends StatefulWidget {
  const Anasayfa({super.key});

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {

  bool aramaVarMi = false;
  String arama ="";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<AnasayfaCubit>().kisileriYukle();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(


      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title:
        aramaVarMi?

        TextField(
            decoration: const InputDecoration(hintText: "Ara", hintStyle: TextStyle(color: Colors.white54)),
            cursorColor: Colors.white,
            style: const TextStyle(color: Colors.white),
            onChanged: (aramaSonucu){
              context.read<AnasayfaCubit>().kisiAra(aramaSonucu);
              arama = aramaSonucu;
            }
        )

            :
        const Text("Kişiler Listesi",style: TextStyle(color: Colors.white),),

        actions: [
          aramaVarMi?

          IconButton(onPressed: (){
            setState(() {
              aramaVarMi = false;
            });
            context.read<AnasayfaCubit>().kisileriYukle();
          }, icon: const Icon(Icons.cancel_presentation_sharp, color: Colors.white,))

              :
          IconButton(onPressed: (){
            setState(() {
              aramaVarMi = true;
            });
          }, icon: const Icon(Icons.person_search_outlined, color: Colors.white,))

        ],
      ),


      body:BlocBuilder<AnasayfaCubit, List<Kisiler>>(
        builder: (context, kList){
          if(kList.isNotEmpty){
            return ListView.builder(
                itemCount: kList.length,
                itemBuilder: (context, index){
                  var kisi = kList[index];
                  return Padding(
                    padding: const EdgeInsets.only(left: 30, right: 30),
                    child: GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Detay(kisi: kisi))).then((value) {
                          context.read<AnasayfaCubit>().kisileriYukle();
                        } );
                      },
                      child: SizedBox(
                        width: 300,
                        height: 70,
                        child: Card(
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Text("${kisi.kisi_ad} - ${kisi.kisi_tel}"),
                              ),
                              const Spacer(),
                              IconButton(onPressed: (){
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text("${kisi.kisi_ad} silinsin mi?"),
                                    action: SnackBarAction(
                                        label: "Evet",
                                        onPressed: (){
                                          context.read<AnasayfaCubit>().sil(int.parse(kisi.kisi_id));
                                        }
                                    ),
                                  ),
                                );
                              }, icon: const Icon(Icons.delete_sharp)),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                });
          }else{
            return const Placeholder();
          }
        },
      ),


      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>const KisiKayit())).then((value) {
            context.read<AnasayfaCubit>().kisileriYukle();
          } );
        },
        child: const Icon(Icons.add_card_sharp),
      ),


    );
  }
}
