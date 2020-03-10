class Business {
  final String id;
  final String name;
  final String image_url;

  Business({this.id, this.name, this.image_url});

  factory Business.fromJson(Map<String, dynamic> json) {
    return Business(
      id: json['id'],
      name: json['name'],
      image_url: json['image_url'],
    );
  }
}
