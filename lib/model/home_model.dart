class Loginmodel{
  late  List? carimage;
  late  String? carname;
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


  Loginmodel({
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
      this.polution});

  factory Loginmodel.fromJson(Map<String, dynamic> json) {
    return Loginmodel(
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
        polution: json['polution']

    );
  }
  Map<String, dynamic> toJson() {
    return {
      'carimage': carimage,
      'carname': carname,
      'modelyear': modelyear,
      'kms': kms,
      'fuel': fuel,
      'prize': prize,
      'color':color,
      'owner':owner,
      'milage':milage,
      'engine':engine,
      'insure':insure,
      'polution':polution

    };
  }

}