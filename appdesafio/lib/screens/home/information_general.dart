import 'package:appdesafio/controllers/ControladorApi.dart';
import 'package:appdesafio/model/constants.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class InformationGeneral extends StatelessWidget {
  const InformationGeneral({
    Key? key,
    @required this.index,
  }) : super(key: key);

  final int? index;

  @override
  Widget build(BuildContext context) {
    final controladorApi = GetIt.I.get<ControladorApi>();

    return SingleChildScrollView(
      child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Name: ${controladorApi.characterData.results?[index!].name}",
                  style: Theme.of(context).textTheme.headline6!.copyWith(color: Colors.black, fontWeight: FontWeight.bold),
                ),
                Text(
                  "Birth Year: ${controladorApi.characterData.results?[index!].birthYear}",
                  style: Theme.of(context).textTheme.headline6!.copyWith(color: Colors.black, fontWeight: FontWeight.bold),
                ),
                Text(
                  "Eye Color: ${controladorApi.characterData.results?[index!].eyeColor}",
                  style: Theme.of(context).textTheme.headline6!.copyWith(color: Colors.black, fontWeight: FontWeight.bold),
                ),
                Text(
                  "Gender: ${controladorApi.characterData.results?[index!].gender}",
                  style: Theme.of(context).textTheme.headline6!.copyWith(color: Colors.black, fontWeight: FontWeight.bold),
                ),
                Text(
                  "Hair Color: ${controladorApi.characterData.results?[index!].hairColor}",
                  style: Theme.of(context).textTheme.headline6!.copyWith(color: Colors.black, fontWeight: FontWeight.bold),
                ),
                Text(
                  "Height: ${controladorApi.characterData.results?[index!].height}",
                  style: Theme.of(context).textTheme.headline6!.copyWith(color: Colors.black, fontWeight: FontWeight.bold),
                ),
                Text(
                  "Mass: ${controladorApi.characterData.results?[index!].mass}",
                  style: Theme.of(context).textTheme.headline6!.copyWith(color: Colors.black, fontWeight: FontWeight.bold),
                ),
                Text(
                  "Skin Color: ${controladorApi.characterData.results?[index!].skinColor}",
                  style: Theme.of(context).textTheme.headline6!.copyWith(color: Colors.black, fontWeight: FontWeight.bold),),
                 
           
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: controladorApi.characterData.results?[index!].resultsInFilms?.length ?? 0,
                itemBuilder: (context, indexEnter){

                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                        Text(
                  "Film Number: ${indexEnter+1}",
                  style: Theme.of(context).textTheme.headline6!.copyWith(color: Colors.black, fontWeight: FontWeight.bold)),
                      Text("Title: ${controladorApi.characterData.results?[index!].resultsInFilms?[indexEnter].title}"),
                      Text("Episode Id: ${controladorApi.characterData.results?[index!].resultsInFilms?[indexEnter].episodeId}"),
                      Text("Opening Crawl: ${controladorApi.characterData.results?[index!].resultsInFilms?[indexEnter].openingCrawl}"),
                      Text("Director: ${controladorApi.characterData.results?[index!].resultsInFilms?[indexEnter].director}"),
                      Text("Producer: ${controladorApi.characterData.results?[index!].resultsInFilms?[indexEnter].producer}"),
                      Text("Release Date: ${controladorApi.characterData.results?[index!].resultsInFilms?[indexEnter].releaseDate}"),
                      Text("Created: ${controladorApi.characterData.results?[index!].resultsInFilms?[indexEnter].created}"),
                      Text("Edit: ${controladorApi.characterData.results?[index!].resultsInFilms?[indexEnter].edited}"),
                      Text("Url: ${controladorApi.characterData.results?[index!].resultsInFilms?[indexEnter].url}"),



                    ]
                  );
                }),

                  ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: controladorApi.characterData.results?[index!].resultsInPlanet?.length ?? 0,
                itemBuilder: (context, indexEnter){

                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                        Text(
                  "Planet Number: ${indexEnter+1}",
                  style: Theme.of(context).textTheme.headline6!.copyWith(color: Colors.black, fontWeight: FontWeight.bold)),
                      Text("Name: ${controladorApi.characterData.results?[index!].resultsInPlanet?[indexEnter].name}"),
                      Text("Rotation period: ${controladorApi.characterData.results?[index!].resultsInPlanet?[indexEnter].rotationPeriod}"),
                      Text("Diameter: ${controladorApi.characterData.results?[index!].resultsInPlanet?[indexEnter].diameter}"),
                      Text("Climate: ${controladorApi.characterData.results?[index!].resultsInPlanet?[indexEnter].climate}"),
                      Text("Gravity: ${controladorApi.characterData.results?[index!].resultsInPlanet?[indexEnter].gravity}"),
                      Text("Terrain: ${controladorApi.characterData.results?[index!].resultsInPlanet?[indexEnter].terrain}"),
                      Text("Surface Water: ${controladorApi.characterData.results?[index!].resultsInPlanet?[indexEnter].surfaceWater}"),
                      Text("Population: ${controladorApi.characterData.results?[index!].resultsInPlanet?[indexEnter].population}"),
                      Text("Created: ${controladorApi.characterData.results?[index!].resultsInPlanet?[indexEnter].created}"),
                      Text("Edited: ${controladorApi.characterData.results?[index!].resultsInPlanet?[indexEnter].edited}"),
                      Text("Url: ${controladorApi.characterData.results?[index!].resultsInPlanet?[indexEnter].url}"),



                    ]
                  );
                }),
        
        ],
      ),
    );
  }
}

