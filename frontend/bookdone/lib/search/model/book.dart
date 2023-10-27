class Book {
  String title;
  String subtitle;

  Book({
    required this.title,
    required this.subtitle,
  });

  // Map<String, dynamic>을 전달받아 Book 클래스 인스턴스를 반환하는 함수
  // factory 키워드를 붙여서 생성자로 사용
  factory Book.fromJson(Map<String, dynamic> volumeInfo) {
    return Book(
      // title이 없는 경우 빈 문자열 할당
      title: volumeInfo["title"] ?? "",
      // subtitle이 없는 경우 빈 문자열 할당
      subtitle: volumeInfo["subtitle"] ?? "",
    );
  }
}
