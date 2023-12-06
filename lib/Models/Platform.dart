class platformModel{
  final String Idplat;
  final String name;
  final String image;

  platformModel({
    required this.Idplat,
    required this.name,
    required this.image
  });

  factory platformModel.fromJson(json)=>
  platformModel(
    Idplat: json['Idplat'] ?? '',
    name: json['name'] ?? '',
    image: json['image']?? '',
  );

 Map<String, dynamic> toJson() => {
        'Idplat': Idplat,
        'name': name,
        'image': image,
      };
      
}