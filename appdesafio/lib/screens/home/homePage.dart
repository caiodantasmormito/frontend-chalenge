import 'package:appdesafio/controllers/ControladorApi.dart';
import 'package:appdesafio/model/item_card.dart';
import 'package:appdesafio/screens/home/DetalhesHomePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final controladorApi = GetIt.I.get<ControladorApi>();

   
  TextEditingController controllerPesquisa = TextEditingController();
  
  
    @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[

            Padding(
                    padding: const EdgeInsets.only(right: 16.0, top: 6),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          icon: Icon(
                            Icons.dehaze_outlined,
                            size: 25,
                          ),
                          onPressed: () {},
                        ),
                        Text(
                          "Stars Wars",
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Text("")
                      
                      ],
                    ),
                  ),
            Padding(
              padding: const EdgeInsets.only(
                top: 8.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  
                  Container(
                    height: 1,
                    width: double.infinity,
                    color: Colors.grey.withAlpha(600),
                  ),
                
                  Container(
                    height: 1,
                    width: double.infinity,
                    color: Colors.grey.withAlpha(600),
                  ),

                  // Padding(
                  //   padding: const EdgeInsets.only(left: 16.0, right: 16, top: 16),
                  //   child: Theme(
                  //     data: new ThemeData(
                  //       hintColor: Colors.blueGrey
                  //     ),
                  //     child: TextFormField(
                        
                  //       controller:controllerPesquisa ,
                  //       decoration: InputDecoration (
                  //          suffixIcon:IconButton(
                  //            onPressed: (){
                  //              setState(() {
                  //                controladorApi.texto = controllerPesquisa.text;
                  //              });
                  //            },
                  //           icon: Icon(Icons.search_outlined)),
                  //         hintText: "Digite a sua pesquisa",
                  //         border: OutlineInputBorder(
                  //           borderSide: BorderSide(
                  //             color: Colors.blueGrey
                  //           )
                  //         ),
                    
                  //       ),
                  //     ),
                  //   ),
                  // ),
              
               controllerPesquisa.text != ""  ?
                  Container(
                    alignment: Alignment.topRight,
                    padding: EdgeInsets.only(top: 8, right:  16),
                      decoration: BoxDecoration(
                        borderRadius:  BorderRadius.all(Radius.circular(50.0)),
                      ),
                      child:  Container(
                        decoration: BoxDecoration(
                        borderRadius:  BorderRadius.all(Radius.circular(50.0)),
                        color:   Colors.blueGrey,),
                        child: TextButton(
                          
                          onPressed: (){
                            setState(() {
                              controllerPesquisa.text = "";
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(left: 16.0, right: 16),
                            child: Text(
                                  "Limpar pesquisa",
                                  style: TextStyle(color: Colors.white),
                                ),
                          ) ,
                        ),
                      ),
                    ): Container()] 
              ),
            ),
          
          
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: GridView.builder(
                    itemCount:  controladorApi.characterData.results?.length ,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 16,
                      crossAxisSpacing: 16,
                      childAspectRatio: 0.75,
                    ),
                    itemBuilder: (context, index) => ItemCard(
                      indexRecebido:  index,
                          product: controladorApi.characterData,
                          press: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetalhesHomePage(
                                  index: index,
                                ),
                              )),
                        )),
              ),
            ) 
          ],
        ),
      ),
    );
  }
}
