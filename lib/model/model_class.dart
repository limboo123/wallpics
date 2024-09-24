class Wpmodel{
  String image;
  String photographer;
  String avg_color;
  String alt;

  Wpmodel({
    required this.image,
    required this.photographer,
    required this.avg_color,
    required this.alt
  });
  factory Wpmodel.fromMap(Map<String,dynamic>map){
    return Wpmodel(
        image: map["src"]["portrait"],
        photographer:map["photographer"],
        avg_color: map["avg_color"],
        alt: map["alt"],
    );
  }
}

