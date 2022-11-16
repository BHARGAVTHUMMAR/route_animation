class categoriesModel {
  String? categoriesName;
  String? Image;
  String? Counter;
  List<dataModels>? datalist;
  categoriesModel(
      {this.categoriesName, this.Image, this.Counter, this.datalist});

  categoriesModel.fromJson(Map<String, dynamic> json) {
    categoriesName = json['categoriesList'];
    Image = json['Image'];
    Counter = json["Counter"];
    if (json['datalist'] != null) {
      datalist = <dataModels>[];
      json['datalist'].forEach((v) {
        datalist!.add(new dataModels.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['categoriesList'] = this.categoriesName;
    data['Image'] = this.Image;
    data['Counter'] = this.Counter;
    if (this.datalist != null) {
      data['datalist'] = this.datalist!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class dataModels {
  int? id;
  String? ItemName;
  String? categoriesName;
  String? Duration;
  String? Ditails;
  String? Date;
  String? expiredDate;
  String? Image;
  String? Bill;

  dataModels(
      {this.ItemName,
      this.Duration,
      this.id,
      this.Ditails,
      this.Date,
      this.Image,
      this.Bill,
      this.expiredDate,
      this.categoriesName});

  dataModels.fromJson(Map<String, dynamic> json) {
    ItemName = json['categoriesList'];
    id = json['id'];
    categoriesName = json["categoriesName"];
    Date = json["Date"];
    Duration = json['Duration'];
    Ditails = json["Ditails"];
    Image = json["Image"];
    Bill = json["Bill"];
    expiredDate = json["expiredDate"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['categoriesList'] = this.ItemName;
    data['categoriesName'] = this.categoriesName;
    data['id'] = this.id;
    data['Date'] = this.Date;
    data['Duration'] = this.Duration;
    data['Ditails'] = this.Ditails;
    data['Image'] = this.Image;
    data['expiredDate'] = this.expiredDate;
    data['Bill'] = this.Bill;
    return data;
  }
}