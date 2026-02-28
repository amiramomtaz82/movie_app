class UserDM {
  final String id;
  final String email;
  final String name;
  final String phone;
  final String? image;
  final List<String> favoriteMovies;
  final List<String> historyMovies;

  UserDM({
    required this.id,
    required this.email,
    required this.name,
    required this.phone,
    this.image,
    required this.favoriteMovies,
    required this.historyMovies
  });

  factory UserDM.fromJson(Map<String, dynamic> json) {
    return UserDM(
      id: json['id'],
      email: json['email'],
      name: json['name'],
      phone: json['phone'],
      image: json['image'],
      favoriteMovies: List<String>.from(json['favoriteMovies'] ?? []),
      historyMovies: List<String>.from(json['historyMovies'] ?? []),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "email": email,
      "name": name,
      "phone": phone,
      "image": image,
      "favoriteMovies": favoriteMovies,
      "historyMovies":historyMovies
    };
  }
}