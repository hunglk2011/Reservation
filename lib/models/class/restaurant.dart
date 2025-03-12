class Restaurant {
  String? id;
  String? nameRestaurant;
  String? descriptionRestaurant;
  String? address;
  String? image;

  Restaurant({
    this.id,
    this.nameRestaurant,
    this.descriptionRestaurant,
    this.address,
    this.image,
  });

  static Restaurant fromJson(Map<String, dynamic> json) {
    return Restaurant(
      id: json["id"],
      nameRestaurant: json["name"],
      address: json["address"],
      image: json["image"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": nameRestaurant,
      "address": address,
      "image": image,
    };
  }
}
