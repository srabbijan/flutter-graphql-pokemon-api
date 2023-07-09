/// data : {"pokemon":{"id":"UG9rZW1vbjowMDE=","name":"Bulbasaur","weight":{"minimum":"6.04kg","maximum":"7.76kg"},"height":{"minimum":"0.61m","maximum":"0.79m"},"classification":"Seed Pokémon","image":"https://img.pokemondb.net/artwork/bulbasaur.jpg"}}

class DetailsModel {
  DetailsModel({
      Data? data,}){
    _data = data;
}

  DetailsModel.fromJson(dynamic json) {
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  Data? _data;
DetailsModel copyWith({  Data? data,
}) => DetailsModel(  data: data ?? _data,
);
  Data? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }

}

/// pokemon : {"id":"UG9rZW1vbjowMDE=","name":"Bulbasaur","weight":{"minimum":"6.04kg","maximum":"7.76kg"},"height":{"minimum":"0.61m","maximum":"0.79m"},"classification":"Seed Pokémon","image":"https://img.pokemondb.net/artwork/bulbasaur.jpg"}

class Data {
  Data({
      Pokemon? pokemon,}){
    _pokemon = pokemon;
}

  Data.fromJson(dynamic json) {
    _pokemon = json['pokemon'] != null ? Pokemon.fromJson(json['pokemon']) : null;
  }
  Pokemon? _pokemon;
Data copyWith({  Pokemon? pokemon,
}) => Data(  pokemon: pokemon ?? _pokemon,
);
  Pokemon? get pokemon => _pokemon;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_pokemon != null) {
      map['pokemon'] = _pokemon?.toJson();
    }
    return map;
  }

}

/// id : "UG9rZW1vbjowMDE="
/// name : "Bulbasaur"
/// weight : {"minimum":"6.04kg","maximum":"7.76kg"}
/// height : {"minimum":"0.61m","maximum":"0.79m"}
/// classification : "Seed Pokémon"
/// image : "https://img.pokemondb.net/artwork/bulbasaur.jpg"

class Pokemon {
  Pokemon({
      String? id, 
      String? name, 
      Weight? weight, 
      Height? height, 
      String? classification, 
      String? image,}){
    _id = id;
    _name = name;
    _weight = weight;
    _height = height;
    _classification = classification;
    _image = image;
}

  Pokemon.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _weight = json['weight'] != null ? Weight.fromJson(json['weight']) : null;
    _height = json['height'] != null ? Height.fromJson(json['height']) : null;
    _classification = json['classification'];
    _image = json['image'];
  }
  String? _id;
  String? _name;
  Weight? _weight;
  Height? _height;
  String? _classification;
  String? _image;
Pokemon copyWith({  String? id,
  String? name,
  Weight? weight,
  Height? height,
  String? classification,
  String? image,
}) => Pokemon(  id: id ?? _id,
  name: name ?? _name,
  weight: weight ?? _weight,
  height: height ?? _height,
  classification: classification ?? _classification,
  image: image ?? _image,
);
  String? get id => _id;
  String? get name => _name;
  Weight? get weight => _weight;
  Height? get height => _height;
  String? get classification => _classification;
  String? get image => _image;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    if (_weight != null) {
      map['weight'] = _weight?.toJson();
    }
    if (_height != null) {
      map['height'] = _height?.toJson();
    }
    map['classification'] = _classification;
    map['image'] = _image;
    return map;
  }

}

/// minimum : "0.61m"
/// maximum : "0.79m"

class Height {
  Height({
      String? minimum, 
      String? maximum,}){
    _minimum = minimum;
    _maximum = maximum;
}

  Height.fromJson(dynamic json) {
    _minimum = json['minimum'];
    _maximum = json['maximum'];
  }
  String? _minimum;
  String? _maximum;
Height copyWith({  String? minimum,
  String? maximum,
}) => Height(  minimum: minimum ?? _minimum,
  maximum: maximum ?? _maximum,
);
  String? get minimum => _minimum;
  String? get maximum => _maximum;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['minimum'] = _minimum;
    map['maximum'] = _maximum;
    return map;
  }

}

/// minimum : "6.04kg"
/// maximum : "7.76kg"

class Weight {
  Weight({
      String? minimum, 
      String? maximum,}){
    _minimum = minimum;
    _maximum = maximum;
}

  Weight.fromJson(dynamic json) {
    _minimum = json['minimum'];
    _maximum = json['maximum'];
  }
  String? _minimum;
  String? _maximum;
Weight copyWith({  String? minimum,
  String? maximum,
}) => Weight(  minimum: minimum ?? _minimum,
  maximum: maximum ?? _maximum,
);
  String? get minimum => _minimum;
  String? get maximum => _maximum;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['minimum'] = _minimum;
    map['maximum'] = _maximum;
    return map;
  }

}