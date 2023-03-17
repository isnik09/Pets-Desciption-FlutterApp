class pets_model {
  List<PetsModel>? data;
  int? total;

  pets_model({this.data, this.total});

  pets_model.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <PetsModel>[];
      json['data'].forEach((v) {
        data!.add(new PetsModel.fromJson(v));
      });
    }
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['total'] = this.total;
    return data;
  }
}

class PetsModel {
  String? imageUrl;
  String? title;
  String? description;
  String? contentUrl;
  String? dateAdded;

  PetsModel(
      {this.imageUrl,
      this.title,
      this.description,
      this.contentUrl,
      this.dateAdded});

  PetsModel.fromJson(Map<String, dynamic> json) {
    imageUrl = json['image_url'];
    title = json['title'];
    description = json['description'];
    contentUrl = json['content_url'];
    dateAdded = json['date_added'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image_url'] = imageUrl;
    data['title'] = title;
    data['description'] = description;
    data['content_url'] = contentUrl;
    data['date_added'] = dateAdded;
    return data;
  }
}
