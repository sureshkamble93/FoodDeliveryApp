

class RestaurantResponseModel {
  final bool success;
  final String message;
  final List<RestaurantModel> data;

  RestaurantResponseModel({
    required this.success,
    required this.message,
    required this.data,
  });

  factory RestaurantResponseModel.fromJson(
      Map<String, dynamic> json) {
    return RestaurantResponseModel(
      success: json['success'] ?? false,
      message: json['message'] ?? '',
      data: (json['data'] as List<dynamic>?)
          ?.map((item) => RestaurantModel.fromJson(item))
          .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'message': message,
      'data': data.map((item) => item.toJson()).toList(),
    };
  }
}



class RestaurantModel {
  final int id;
  final String image;
  final String name;
  final String type;
  final double rating;
  final String estDeliveryTime;

  RestaurantModel({
    required this.id,
    required this.image,
    required this.name,
    required this.type,
    required this.rating,
    required this.estDeliveryTime,
  });

  factory RestaurantModel.fromJson(Map<String, dynamic> json) {
    return RestaurantModel(
      id: json['id'] ?? 0,
      image: json['image'] ?? '',
      name: json['name'] ?? '',
      type: json['type'] ?? '',
      rating: (json['rating'] as num).toDouble(),
      estDeliveryTime: json['estDeliveryTime'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'image': image,
      'name': name,
      'type': type,
      'rating': rating,
      'estDeliveryTime': estDeliveryTime,
    };
  }
}
