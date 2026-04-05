class DonateModel {
  final int? hospitalId;
  final String? donationDate;
  final String? donationTime;

  DonateModel({
    this.hospitalId,
    this.donationDate,
    this.donationTime
  });

  DonateModel copyWith({
    int? hospitalId,
    String? donationDate,
    String? donationTime
  }) {
    return DonateModel(
      hospitalId: hospitalId ?? this.hospitalId,
      donationDate: donationDate ?? this.donationDate,
      donationTime: donationTime ?? this.donationTime
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "hospitalId": hospitalId,
      "donationDate": donationDate,
    };
  }
}