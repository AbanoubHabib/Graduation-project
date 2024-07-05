import 'dart:convert';

class OnboardingModel {
  String image;
  String headline;
  String description;
  OnboardingModel({
    required this.image,
    required this.headline,
    required this.description,
  });

  OnboardingModel copyWith({
    String? imageUrl,
    String? headline,
    String? description,
  }) {
    return OnboardingModel(
      image: image ?? this.image ,
      headline: headline ?? this.headline,
      description: description ?? this.description,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'image': image,
      'headline': headline,
      'description': description,
    };
  }

  factory OnboardingModel.fromMap(Map<String, dynamic> map) {
    return OnboardingModel(
      image: map['image'] ?? '',
      headline: map['headline'] ?? '',
      description: map['description'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory OnboardingModel.fromJson(String source) =>
      OnboardingModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'OnboardingData(imageUrl: $image, headline: $headline, description: $description)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is OnboardingModel &&
        other.image == image &&
        other.headline == headline &&
        other.description == description;
  }

  @override
  int get hashCode =>
      image.hashCode ^ headline.hashCode ^ description.hashCode;
}
