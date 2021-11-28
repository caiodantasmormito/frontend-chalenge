import 'package:appdesafio/screens/home/add_to_cart.dart';
import 'package:appdesafio/screens/home/information_general.dart';
import 'package:appdesafio/screens/home/product_title_with_image.dart';
import 'package:appdesafio/servico/CharacterData.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:appdesafio/controllers/ControladorApi.dart';

import 'package:get_it/get_it.dart';

class Body extends StatelessWidget {
  final int? index;

  const Body({Key? key, this.index}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final controladorApi = GetIt.I.get<ControladorApi>();

    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: kToolbarHeight, left: 16, right:16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            ProductTitleWithImage(index: index),
            SizedBox(height: 16),
            InformationGeneral(index: index),
            
          ],
        ),
      ),
    );
  }
}
