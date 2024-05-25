class AppVersionModel {
  AppVersionModel(this.version, this.buildNumber);

  String version = "";
  String buildNumber = "";

  factory AppVersionModel.fromJson(Map<String, dynamic> json) {
    return AppVersionModel(
      json['version'],
      json['build_number'],
    );
  }
}