

class CatModel{
  final String CatId;
  final String name;
  final String Catimage;

  CatModel({
    required this.CatId,
    required this.name,
    required this.Catimage,
  });

  factory CatModel.fromJson(json)=>
  CatModel(
    CatId: json['CatId'] ?? '',
    name: json['name'] ?? '',
    Catimage: json['Catimage']?? '',
  );

 Map<String, dynamic> toJson() => {
        'CatId': CatId,
        'name': name,
        'Catimage': Catimage,
      };
}

