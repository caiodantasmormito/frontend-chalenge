

import 'package:appdesafio/screens/home/Body.dart';
import 'package:appdesafio/servico/CharacterData.dart';
import 'package:flutter/material.dart';

class DetalhesHomePage extends StatelessWidget {
   final int  ? index;

  const DetalhesHomePage({Key ? key, this.index}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: Body(index: index),
    );
  }

  
}
