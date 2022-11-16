class categoriesModel {
  String? categoriesName;
  String? Image;
  String? Dis;
  String? vag;
  categoriesModel({
    this.categoriesName,
    this.Image,
    this.Dis,
    this.vag,
  });

  categoriesModel.fromJson(Map<String, dynamic> json) {
    categoriesName = json['categoriesList'];
    Image = json['Image'];
    Dis = json['Dis'];
    vag = json['vag'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['categoriesList'] = this.categoriesName;
    data['Image'] = this.Image;
    data['Dis'] = this.Dis;
    data['vag'] = this.vag;
    return data;
  }
}
