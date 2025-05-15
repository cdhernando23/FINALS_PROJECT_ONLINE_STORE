import 'course.dart';

class CartItem {
  final Course course;
  final DateTime addedAt;

  CartItem({
    required this.course,
    DateTime? addedAt,
  }) : addedAt = addedAt ?? DateTime.now();

  double get price => course.price;

  factory CartItem.fromJson(Map<String, dynamic> json) {
    return CartItem(
      course: Course.fromJson(json['course'] as Map<String, dynamic>),
      addedAt: DateTime.parse(json['addedAt'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'course': course.toJson(),
      'addedAt': addedAt.toIso8601String(),
    };
  }

  CartItem copyWith({
    Course? course,
    DateTime? addedAt,
  }) {
    return CartItem(
      course: course ?? this.course,
      addedAt: addedAt ?? this.addedAt,
    );
  }
} 