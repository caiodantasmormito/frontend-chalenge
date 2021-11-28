
import 'package:appdesafio/controllers/ControladorApi.dart';
import 'package:appdesafio/servico/CharacterData.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';


class ProductTitleWithImage extends StatelessWidget {
  const ProductTitleWithImage({
    Key ? key,
    @required this.index,
  }) : super(key: key);

   final int?  index;

  @override
  Widget build(BuildContext context) {
      final controladorApi = GetIt.I.get<ControladorApi>();

    return  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          
          
         
        
             Container(
              padding: EdgeInsets.all(16),
              
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Hero(
                tag: "${controladorApi.characterData.results?[index!].name}",
               child: CachedNetworkImage(
                 imageUrl: controladorApi.characterData.results?[index!].photo ??""
               )
              ),
            ),
          
        ],
      
    );
  }
}
