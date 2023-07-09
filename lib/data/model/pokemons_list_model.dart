
class ListModel{
  Data? data;

  ListModel({this.data});

  ListModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
}

class Data {
  List<Pokemons>? pokemons;

  Data({this.pokemons});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['pokemons'] != null) {
      pokemons = <Pokemons>[];
      json['pokemons'].forEach((v) {
        pokemons!.add(Pokemons.fromJson(v));
      });
    }
  }
}

class Pokemons {
  String? id;
  String? name;
  Weight? weight;
  Weight? height;
  String? classification;
  String? image;

  Pokemons(
      {this.id,
        this.name,
        this.weight,
        this.height,
        this.classification,
        this.image});

  Pokemons.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    weight = json['weight'] != null ? Weight.fromJson(json['weight']) : null;
    height = json['height'] != null ? Weight.fromJson(json['height']) : null;
    classification = json['classification'];
    image = json['image'];
  }

}

class Weight {
  String? minimum;
  String? maximum;

  Weight({this.minimum, this.maximum});

  Weight.fromJson(Map<String, dynamic> json) {
    minimum = json['minimum'];
    maximum = json['maximum'];
  }
}