class QariListModel{
  String? name;
  String? path;
  String? format;

  QariListModel({this.name, this.path, this.format});

  factory QariListModel.fromjson(Map<String, dynamic> json){
    return QariListModel(
      name: json['name'],
      path: json['relative_path'],
      format: json['file_formats']
    );
  }

}