
import 'package:appdesafio/controllers/ControladorApi.dart';
import 'package:appdesafio/servico/CharacterData.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';



class ItemCard extends StatefulWidget {
  final CharacterData ? product;
  final VoidCallback ? press;
  final int ? indexRecebido;
  const ItemCard({
    this.product,
    this.indexRecebido,
    Key ? key,
    this.press,
  }) : super(key: key);

  @override
  _ItemCardState createState() => _ItemCardState();
}

class _ItemCardState extends State<ItemCard> {
  final controladorApi = GetIt.I.get<ControladorApi>();
  bool achou = false;

  
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.press,
      child:   Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[

          
          
          Expanded(
            child: Container(
              padding: EdgeInsets.all(16),
              
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Hero(
                tag: "${controladorApi.characterData.results?[widget.indexRecebido!].name}",
               child: CachedNetworkImage(
                 imageUrl: controladorApi.characterData.results?[widget.indexRecebido!].photo ??""
               )
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16 / 4),
            child: Text(
              "${controladorApi.characterData.results?[widget.indexRecebido!].name} '' ",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Text(
          "${controladorApi.characterData.results?[widget.indexRecebido!].birthYear}",
            style: TextStyle(fontWeight: FontWeight.bold),
          )
        ],
      )  
    );
  }
}
