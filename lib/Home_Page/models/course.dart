class Course {
  String name;
  double completedPercentage;
  String author;
  String thumbnail;

  Course({
    required this.author,
    required this.completedPercentage,
    required this.name,
    required this.thumbnail,
  });
}

List<Course> courses = [
  Course(
    author: "Team-SoftX",
    completedPercentage: .75,
    name: "Lesson 1",
    thumbnail: "img/flutter.jpg",
  ),
  Course(
    author: "Team-SoftX",
    completedPercentage: .60,
    name: "Lesson 2",
    thumbnail: "img/flutter.jpg",
  ),
  Course(
    author: "Team-SoftX",
    completedPercentage: .75,
    name: "Lesson 3",
    thumbnail: "img/flutter.jpg",
  ),
  Course(
    author: "Team-SoftX",
    completedPercentage: .75,
    name: "Lesson 3",
    thumbnail: "img/flutter.jpg",
  ),
  Course(
    author: "Team-SoftX",
    completedPercentage: .60,
    name: "Lesson 4",
    thumbnail: "img/flutter.jpg",
  ),
  Course(
    author: "Team-SoftX",
    completedPercentage: .75,
    name: "Lesson 4",
    thumbnail: "img/flutter.jpg",
  ),
];
