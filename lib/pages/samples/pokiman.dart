import 'package:flutter/material.dart';
import 'package:foodtrucks/pages/samples/Pokemon.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Pokiman extends StatefulWidget {
  Pokiman();

  _PokimanState createState() => _PokimanState();
}

class _PokimanState extends State<Pokiman> {
  var url =
      "https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json";
  PokemanHub pokemon;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    fetchData();
  }

  fetchData() async {
    var res = await http.get(url);
    var decodeJson = jsonDecode(res.body);
    print("hello Venki" + decodeJson.toString());

    pokemon = PokemanHub.fromJson(decodeJson);

    print("Venki ........");
    print(pokemon.toJson());

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hello'),
        backgroundColor: Colors.cyan,
      ),
      drawer: Drawer(),
      body: pokemon == null
          ? Center(
              child: CircularProgressIndicator(),
            )
          : GridView.count(
              crossAxisCount: 2,
              children: pokemon.pokemon
                  .map((poke) => Padding(
                        padding: const EdgeInsets.all(2),
                        child: InkWell(
                          child: Hero(
                            tag: poke.img,
                            child: Card(
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    height: 100.0,
                                    width: 100.0,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: NetworkImage(poke.img))),
                                  ),
                                  Text(
                                    poke.name,
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ))
                  .toList()),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          fetchData();
        },
        backgroundColor: Colors.cyan,
        child: Icon(Icons.refresh),
      ),
    );
  }
}
