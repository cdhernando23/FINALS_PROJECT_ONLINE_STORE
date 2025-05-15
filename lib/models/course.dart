class Course {
  final String id;
  final String title;
  final String instructor;
  final String description;
  final double price;
  final String imageUrl;
  final String videoPreviewUrl;
  final List<String> topics;
  final Map<String, dynamic> details;
  final String level;
  final double rating;
  final int reviews;
  final int studentsEnrolled;
  final int totalHours;
  final List<String> requirements;
  final List<String> whatYouWillLearn;
  final DateTime lastUpdated;

  Course({
    required this.id,
    required this.title,
    required this.instructor,
    required this.description,
    required this.price,
    required this.imageUrl,
    required this.videoPreviewUrl,
    required this.topics,
    required this.details,
    required this.level,
    this.rating = 0.0,
    this.reviews = 0,
    this.studentsEnrolled = 0,
    required this.totalHours,
    required this.requirements,
    required this.whatYouWillLearn,
    required this.lastUpdated,
  });

  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(
      id: json['id'] as String,
      title: json['title'] as String,
      instructor: json['instructor'] as String,
      description: json['description'] as String,
      price: (json['price'] as num).toDouble(),
      imageUrl: json['imageUrl'] as String,
      videoPreviewUrl: json['videoPreviewUrl'] as String,
      topics: List<String>.from(json['topics'] as List),
      details: json['details'] as Map<String, dynamic>,
      level: json['level'] as String,
      rating: (json['rating'] as num?)?.toDouble() ?? 0.0,
      reviews: json['reviews'] as int? ?? 0,
      studentsEnrolled: json['studentsEnrolled'] as int? ?? 0,
      totalHours: json['totalHours'] as int,
      requirements: List<String>.from(json['requirements'] as List),
      whatYouWillLearn: List<String>.from(json['whatYouWillLearn'] as List),
      lastUpdated: DateTime.parse(json['lastUpdated'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'instructor': instructor,
      'description': description,
      'price': price,
      'imageUrl': imageUrl,
      'videoPreviewUrl': videoPreviewUrl,
      'topics': topics,
      'details': details,
      'level': level,
      'rating': rating,
      'reviews': reviews,
      'studentsEnrolled': studentsEnrolled,
      'totalHours': totalHours,
      'requirements': requirements,
      'whatYouWillLearn': whatYouWillLearn,
      'lastUpdated': lastUpdated.toIso8601String(),
    };
  }

  Course copyWith({
    String? id,
    String? title,
    String? instructor,
    String? description,
    double? price,
    String? imageUrl,
    String? videoPreviewUrl,
    List<String>? topics,
    Map<String, dynamic>? details,
    String? level,
    double? rating,
    int? reviews,
    int? studentsEnrolled,
    int? totalHours,
    List<String>? requirements,
    List<String>? whatYouWillLearn,
    DateTime? lastUpdated,
  }) {
    return Course(
      id: id ?? this.id,
      title: title ?? this.title,
      instructor: instructor ?? this.instructor,
      description: description ?? this.description,
      price: price ?? this.price,
      imageUrl: imageUrl ?? this.imageUrl,
      videoPreviewUrl: videoPreviewUrl ?? this.videoPreviewUrl,
      topics: topics ?? this.topics,
      details: details ?? this.details,
      level: level ?? this.level,
      rating: rating ?? this.rating,
      reviews: reviews ?? this.reviews,
      studentsEnrolled: studentsEnrolled ?? this.studentsEnrolled,
      totalHours: totalHours ?? this.totalHours,
      requirements: requirements ?? this.requirements,
      whatYouWillLearn: whatYouWillLearn ?? this.whatYouWillLearn,
      lastUpdated: lastUpdated ?? this.lastUpdated,
    );
  }
} 