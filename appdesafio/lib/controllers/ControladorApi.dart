// ignore: file_names
import 'dart:convert';
import 'package:appdesafio/servico/filme_data.dart';
import 'package:appdesafio/servico/planets_world.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

import 'package:appdesafio/servico/CharacterData.dart';
import 'package:appdesafio/servico/GerenciadorServico.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

part 'ControladorApi.g.dart';

class ControladorApi = _ControladorApiBase with _$ControladorApi;

abstract class _ControladorApiBase with Store {
  @observable
  var retorno;

  @observable
  bool? carregandoRequest = true;
  @observable
  int tamanhoLista = 0;
  @observable
  List<dynamic>? auxiliar = [];

  @observable
  bool exibeAgora = true;
  @observable
  int quantidadeAchada = 0;

  @observable
  List<dynamic> aux = [];

  @observable
  CharacterData characterData = CharacterData();

  @observable
  FilmesData filmesData = FilmesData();

  @observable
  Planets planetsData = Planets();
  @observable
  String texto = "";
  void loadingDataCharacter({Function()? sucesso, Function()? carregando}) async {
    carregandoRequest = true;
    try {
      final response = await http.get(Uri.parse("https://swapi.dev/api/people"));
      var decodeJson = jsonDecode(response.body);
      characterData = CharacterData.fromJson(decodeJson);
      for (int i = 0; i < characterData.results!.length; i++) {
        characterData.results?[i].photo = characterData.results?[i].name.toLowerCase() == "darth vader"
            ? "https://i0.wp.com/sociedadejedi.com.br/wp-content/uploads/2020/01/darth-vader-.jpg?fit=700%2C394&ssl=1"
            : characterData.results?[i].name.toLowerCase() == "luke skywalker"
                ? "https://s2.glbimg.com/LttsvVoQZGHoIJsmdlXMULY336A=/e.glbimg.com/og/ed/f/original/2019/09/23/ea1e16061bdf92edb111d8808c6741a6.jpg"
                : characterData.results?[i].name.toLowerCase() == "c-3po"
                    ? "https://upload.wikimedia.org/wikipedia/pt/6/66/C-3PO.jpg"
                    : characterData.results?[i].name.toLowerCase() == "r2-d2"
                        ? "https://static3.tcdn.com.br/img/img_prod/460977/pipoqueira_popcorn_maker_r2d2_star_wars_ev_80413_1_2813d1f57c62d1614b3a81fa6fba5b08.jpeg"
                        : characterData.results?[i].name.toLowerCase() == "leia organa"
                            ? "https://static.wikia.nocookie.net/ptstarwars/images/8/89/Leia_endorpromo02.jpg/revision/latest?cb=20120217230107"
                            : characterData.results?[i].name.toLowerCase() == "owen lars"
                                ? "https://i2.wp.com/www.heyuguys.com/images/2017/06/Joel-Edgerton-Star-Wars.jpg?fit=1200%2C901&ssl=1"
                                : characterData.results?[i].name.toLowerCase() == "beru whitesun lars"
                                    ? "https://static.wikia.nocookie.net/ptstarwars/images/2/2a/528px-Beru_headshot2.jpg/revision/latest?cb=20090113170251"
                                    : characterData.results?[i].name.toLowerCase() == "r5-d4"
                                        ? "https://static.wikia.nocookie.net/ptstarwars/images/2/2c/R5d4.jpg/revision/latest/top-crop/width/360/height/450?cb=20060701231838"
                                        : characterData.results?[i].name.toLowerCase() == "biggs darklighter"
                                            ? "https://static.wikia.nocookie.net/ptstarwars/images/2/20/Biggs.jpg/revision/latest?cb=20100205180536"
                                            : "https://tm.ibxk.com.br/2021/08/16/16171157868198.jpg";

        for (int j = 0; j < characterData.results![i].films.length; j++) {
          int? auxiliar = characterData.results?[i].films[j].length;
          auxiliar = auxiliar! - 1;
          String? numero = characterData.results?[i].films[j].substring(28, auxiliar);
          characterData.results?[i].listNumberFilms.add(int.parse(numero!));
        }

        int? auxiliarPlanet = characterData.results?[i].homeworld.length;
        auxiliarPlanet = auxiliarPlanet! - 1;
        String? numeroPlanet = characterData.results?[i].homeworld.substring(30, auxiliarPlanet);
        characterData.results?[i].listNumberPlanets = int.parse(numeroPlanet!);
      }
      loadingDataFilm();
    } catch (error) {
      print(error);
    }
  }

  void loadingDataFilm({Function()? sucesso, Function()? carregando}) async {
    carregandoRequest = true;
    try {
      final response = await http.get(Uri.parse("https://swapi.dev/api/films"));
      var decodeJson = jsonDecode(response.body);
      filmesData = FilmesData.fromJson(decodeJson);
      for (int i = 0; i < characterData.results!.length; i++) {
        for (int j = 0; j < characterData.results![i].listNumberFilms.length; j++) {
          if (characterData.results![i].listNumberFilms[j] == 1) {
            characterData.results![i].resultsInFilms?.add(filmesData.results![0]);
          } else if (characterData.results![i].listNumberFilms[j] == 2) {
            characterData.results![i].resultsInFilms?.add(filmesData.results![1]);
          }
        else  if (characterData.results![i].listNumberFilms[j] == 3) {
            characterData.results![i].resultsInFilms?.add(filmesData.results![2]);
          }
         else if (characterData.results![i].listNumberFilms[j] == 4) {
            characterData.results![i].resultsInFilms?.add(filmesData.results![3]);
          }
         else if (characterData.results![i].listNumberFilms[j] == 5) {
            characterData.results![i].resultsInFilms?.add(filmesData.results![4]);
          }
         else if (characterData.results![i].listNumberFilms[j] == 6) {
            characterData.results![i].resultsInFilms?.add(filmesData.results![5]);
          }
        }
      }
      loadingDataPlanet();
    } catch (error) {
      print(error);
    }
  }

  void loadingDataPlanet({Function()? sucesso, Function()? carregando}) async {
    carregandoRequest = true;
    try {
      final response = await http.get(Uri.parse("https://swapi.dev/api/planets"));
      var decodeJson = jsonDecode(response.body);
      planetsData = Planets.fromJson(decodeJson);
      for (int i = 0; i < characterData.results!.length; i++) {
        if (characterData.results![i].listNumberPlanets == 1) {
          characterData.results![i].resultsInPlanet?.add(planetsData.results![0]);
        } else if (characterData.results![i].listNumberPlanets == 2) {
          characterData.results![i].resultsInPlanet?.add(planetsData.results![1]);
        } else if (characterData.results![i].listNumberPlanets == 3) {
          characterData.results![i].resultsInPlanet?.add(planetsData.results![2]);
        } else if (characterData.results![i].listNumberPlanets == 4) {
          characterData.results![i].resultsInPlanet?.add(planetsData.results![3]);
        } else if (characterData.results![i].listNumberPlanets == 5) {
          characterData.results![i].resultsInPlanet?.add(planetsData.results![4]);
        } else if (characterData.results![i].listNumberPlanets == 6) {
          characterData.results![i].resultsInPlanet?.add(planetsData.results![5]);
        } else if (characterData.results![i].listNumberPlanets == 7) {
          characterData.results![i].resultsInPlanet?.add(planetsData.results![6]);
        } else if (characterData.results![i].listNumberPlanets == 8) {
          characterData.results![i].resultsInPlanet?.add(planetsData.results![7]);
        } else if (characterData.results![i].listNumberPlanets == 9) {
          characterData.results![i].resultsInPlanet?.add(planetsData.results![8]);
        } else if (characterData.results![i].listNumberPlanets == 10) {
          characterData.results![i].resultsInPlanet?.add(planetsData.results![9]);
        }
       
      }
      carregandoRequest = false;
    } catch (error) {
      print(error);
    }
  }
}
