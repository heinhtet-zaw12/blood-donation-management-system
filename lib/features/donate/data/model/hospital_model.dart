class HospitalModel {
  final int id;
  final String name;

  HospitalModel({
    required this.id,
    required this.name,
  });

  factory HospitalModel.fromJson(Map<String, dynamic> json) {
    return HospitalModel(
      id: json['id'],
      name: json['name'],
    );
  }
}