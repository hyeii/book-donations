class UnderRegion {
  int code;
  String name;
  String second;

  UnderRegion({
    required this.code,
    required this.name,
    required this.second,
  });

  factory UnderRegion.fromJson(Map<String, dynamic> volumeInfo) {
    return UnderRegion(
      code: volumeInfo["code"] ?? 0,
      name: volumeInfo["name"] ?? "",
      second: volumeInfo["second"] ?? "",
    );
  }
}
