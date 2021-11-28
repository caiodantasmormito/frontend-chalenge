import 'package:appdesafio/controllers/ControladorApi.dart';
import 'package:appdesafio/model/elevatedButtonCustomizado.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

class TelaBemVindoAoAplicativo extends StatefulWidget {
  const TelaBemVindoAoAplicativo({ Key ? key }) : super(key: key);

  @override
  _TelaBemVindoAoAplicativoState createState() => _TelaBemVindoAoAplicativoState();
}

class _TelaBemVindoAoAplicativoState extends State<TelaBemVindoAoAplicativo> {

  @override
  void initState() {
    super.initState();
     controladorApi.loadingDataCharacter();
  }
  final controladorApi = GetIt.I.get<ControladorApi>();
 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Observer(builder: (_) {
        return Container(
          width: double.maxFinite,
          height: double.maxFinite,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/starwars.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              SizedBox(
                height: MediaQuery.of(context).size.height / 2.75,
              ),
              Text(
                'Bem-vindo ao aplicativo',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 24,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 60.0, right: 60),
                child: Text(
                    "Aqui você irá navegar pelo mundo do Star Wars",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: Colors.white,
                    )),
              ),
              SizedBox(
                height: 44,
              ),

              controladorApi.carregandoRequest! ? 
              CircularProgressIndicator(color: Colors.black,):
              ElevatedButtonCustomizado(
                text: 'Conhecer o  app',
                isEnabled: true,
                callback: (){
                    Navigator.pushNamed(context, "/telaHomeScreen");
                },
              ),
            ],
          ));})
    );
  }
}
