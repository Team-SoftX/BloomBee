class Category {
  String thumbnail;
  String name;
  int noOfCourses;
  String page;

  Category({
    required this.name,
    required this.noOfCourses,
    required this.thumbnail,
    required this.page,
  });
}

List<Category> categoryList = [
  Category(
    name: 'Image Based Learning',
    noOfCourses: 55,
    thumbnail: 'img/imagelearning.jpg',
    page: '1',
  ),
  Category(
    name: 'Academic Basic Learning',
    noOfCourses: 20,
    thumbnail: 'img/academicbasiclearning.jpg',
    page: '2',
  ),
  Category(
    name: 'Parent Tasks',
    noOfCourses: 5,
    thumbnail: 'img/dailytask.jpg',
    page: '3',
  ),
  Category(
    name: 'Video Based Learning',
    noOfCourses: 25,
    thumbnail: 'img/videobasedlearning.jpg',
    page: '4',
  ),
];
