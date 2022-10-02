class MovieModel {
  MovieModel({
      this.data, 
      this.status, 
      this.message,});

  MovieModel.fromJson(dynamic json) {
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(MovieData.fromJson(v));
      });
    }
    status = json['status'];
    message = json['message'];
  }
  List<MovieData>? data;
  String? status;
  String? message;
MovieModel copyWith({  List<MovieData>? data,
  String? status,
  String? message,
}) => MovieModel(  data: data ?? this.data,
  status: status ?? this.status,
  message: message ?? this.message,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    map['status'] = status;
    map['message'] = message;
    return map;
  }

}

class MovieData {
  MovieData({
      this.title, 
      this.imagePath, 
      this.details,});

  MovieData.fromJson(dynamic json) {
    title = json['title'];
    imagePath = json['imagePath'];
    details = json['details'];
  }
  String? title;
  String? imagePath;
  String? details;
MovieData copyWith({  String? title,
  String? imagePath,
  String? details,
}) => MovieData(  title: title ?? this.title,
  imagePath: imagePath ?? this.imagePath,
  details: details ?? this.details,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['title'] = title;
    map['imagePath'] = imagePath;
    map['details'] = details;
    return map;
  }

}