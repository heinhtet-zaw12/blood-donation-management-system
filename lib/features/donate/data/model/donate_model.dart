class DonateModel {
  final String? name;
  final String? bloodType;
  final String? phone;

  final String? hospital;
  final String? date;
  final String? time;

  final List<bool?> answers;

  DonateModel({
    this.name,
    this.bloodType,
    this.phone,
    this.hospital,
    this.date,
    this.time,
    this.answers = const [null, null, null],
  });

  DonateModel copyWith({
    String? name,
    String? bloodType,
    String? phone,
    String? hospital,
    String? date,
    String? time,
    List<bool?>? answers,
  }) {
    return DonateModel(
      name: name ?? this.name,
      bloodType: bloodType ?? this.bloodType,
      phone: phone ?? this.phone,
      hospital: hospital ?? this.hospital,
      date: date ?? this.date,
      time: time ?? this.time,
      answers: answers ?? this.answers,
    );
  }
}