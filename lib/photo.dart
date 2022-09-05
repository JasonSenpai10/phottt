class Photo {
  int? id;
  final String name;
  Photo({this.id, required this.name});
  factory Photo.fromMap(Map<dynamic, dynamic> json) => Photo(
        id: json['id'],
        name: json['name'],
      );
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
    };
  }
}
