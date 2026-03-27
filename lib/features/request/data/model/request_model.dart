class RequestModel {
  final String? name;
  final String? bloodType;
  final String? phone;

  final String? hospital;
  final String? date;
  final String? address;
  final String? unit;
  final String? relationPatient;
  final String? reason;
  final bool? isEmergencyRequest;

  RequestModel({
    this.name,
    this.bloodType,
    this.phone,
    this.hospital,
    this.date,
    this.address,
    this.unit,
    this.relationPatient,
    this.reason,
    this.isEmergencyRequest
  });

  RequestModel copyWith({
    String? name,
    String? bloodType,
    String? phone,
    String? hospital,
    String? date,
    String? address,
    String? unit,
    String? relationPatient,
    String? reason,
    bool? isEmergencyRequest
  }) {
    return RequestModel(
      name: name ?? this.name,
      bloodType: bloodType ?? this.bloodType,
      phone: phone ?? this.phone,
      hospital: hospital ?? this.hospital,
      date: date ?? this.date,
      address: address ?? this.address,
      unit: unit ?? this.unit,
      relationPatient: relationPatient ?? this.relationPatient,
      reason: reason ?? this.reason,
      isEmergencyRequest: isEmergencyRequest ?? this.isEmergencyRequest
    );
  }
}