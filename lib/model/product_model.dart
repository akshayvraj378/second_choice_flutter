class ProductModel {
  late String? productId;
  late List? carimage;
  late String? carname;
  late String? modelyear;
  late String? kms;
  late String? fuel;
  late String? prize;
  late String? color;
  late String? owner;
  late String? milage;
  late String? engine;
  late String? insure;
  late String? polution;

  late List? features;
  late List? specification;
  late List? overview;

  ProductModel(
      {this.productId,
        this.carimage,
      this.carname,
      this.modelyear,
      this.kms,
      this.fuel,
      this.prize,
      this.color,
      this.owner,
      this.milage,
      this.engine,
      this.insure,
      this.polution,
      this.features,
      this.specification,
      this.overview});

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
        productId: json['productId'],
        carimage: json['carimage'],
        carname: json['carname'],
        modelyear: json['modelyear'],
        kms: json['kms'],
        fuel: json['fuel'],
        prize: json['prize'],
        color: json['color'],
        owner: json['owner'],
        milage: json['milage'],
        engine: json['engine'],
        polution: json['polution'],
        features: json['features'],
        specification: json['specification'],
        overview: json['overview']);
  }
  Map<String, dynamic> toJson() {
    return {
      'productId':productId,
      'carimage': carimage,
      'carname': carname,
      'modelyear': modelyear,
      'kms': kms,
      'fuel': fuel,
      'prize': prize,
      'color': color,
      'owner': owner,
      'milage': milage,
      'engine': engine,
      'insure': insure,
      'polution': polution,
      'features': features,
      'specification': specification,
      'overview': overview,
    };
  }
}
