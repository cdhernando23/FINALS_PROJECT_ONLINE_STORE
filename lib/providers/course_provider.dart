import 'package:flutter/foundation.dart';
import '../models/course.dart';

class CourseProvider with ChangeNotifier {
  final List<Course> _courses = [
    Course(
      id: '1',
      title: 'Complete Flutter Development Bootcamp',
      instructor: 'Dr. Angela Yu',
      description: 'Learn Flutter and Dart from scratch, build real-world apps, and become a professional mobile developer.',
      price: 89.99,
      imageUrl: 'https://example.com/flutter-course.jpg',
      videoPreviewUrl: 'https://example.com/flutter-preview.mp4',
      topics: ['Flutter', 'Dart', 'Mobile Development', 'iOS', 'Android'],
      details: {
        'sections': 28,
        'lectures': 185,
        'assignments': 15,
        'resources': 42,
      },
      level: 'Beginner to Advanced',
      rating: 4.8,
      reviews: 4521,
      studentsEnrolled: 12500,
      totalHours: 65,
      requirements: [
        'No programming experience needed',
        'Basic computer skills',
        'Mac or PC capable of running Flutter',
      ],
      whatYouWillLearn: [
        'Build beautiful, fast, and native-quality apps with Flutter',
        'Understand Dart programming from scratch',
        'Learn Flutter state management techniques',
        'Create complex animations and custom UI components',
      ],
      lastUpdated: DateTime.now().subtract(const Duration(days: 15)),
    ),
    Course(
      id: '2',
      title: 'Machine Learning A-Z™',
      instructor: 'Kirill Eremenko',
      description: 'Learn Machine Learning using Python & R. Master Data Science, Machine Learning, Neural Networks & Deep Learning.',
      price: 129.99,
      imageUrl: 'https://example.com/ml-course.jpg',
      videoPreviewUrl: 'https://example.com/ml-preview.mp4',
      topics: ['Machine Learning', 'Python', 'R', 'Data Science', 'AI'],
      details: {
        'sections': 42,
        'lectures': 320,
        'assignments': 25,
        'resources': 85,
      },
      level: 'All Levels',
      rating: 4.9,
      reviews: 8750,
      studentsEnrolled: 25000,
      totalHours: 85,
      requirements: [
        'High school mathematics',
        'Basic Python or R knowledge helpful but not required',
        'Computer with minimum 8GB RAM',
      ],
      whatYouWillLearn: [
        'Master Machine Learning algorithms',
        'Handle specific topics like Deep Learning, NLP and Reinforcement Learning',
        'Learn to create powerful Neural Networks',
        'Make accurate predictions and perform complex analyses',
      ],
      lastUpdated: DateTime.now().subtract(const Duration(days: 7)),
    ),
    // Add more courses here
  ];

  List<Course> get courses => List.unmodifiable(_courses);

  List<Course> get featuredCourses => _courses.where((course) => course.rating >= 4.5).toList();

  List<Course> get newCourses => _courses
      .where((course) => course.lastUpdated.isAfter(DateTime.now().subtract(const Duration(days: 30))))
      .toList();

  List<String> get allTopics {
    final Set<String> topics = {};
    for (var course in _courses) {
      topics.addAll(course.topics);
    }
    return topics.toList()..sort();
  }

  List<Course> filterCourses({
    String? searchQuery,
    String? topic,
    String? level,
    double? minPrice,
    double? maxPrice,
    double? minRating,
  }) {
    return _courses.where((course) {
      if (searchQuery != null &&
          !course.title.toLowerCase().contains(searchQuery.toLowerCase()) &&
          !course.description.toLowerCase().contains(searchQuery.toLowerCase())) {
        return false;
      }
      if (topic != null && !course.topics.contains(topic)) return false;
      if (level != null && course.level != level) return false;
      if (minPrice != null && course.price < minPrice) return false;
      if (maxPrice != null && course.price > maxPrice) return false;
      if (minRating != null && course.rating < minRating) return false;
      return true;
    }).toList();
  }

  Course getCourseById(String id) {
    return _courses.firstWhere(
      (course) => course.id == id,
      orElse: () => throw Exception('Course not found'),
    );
  }
} 