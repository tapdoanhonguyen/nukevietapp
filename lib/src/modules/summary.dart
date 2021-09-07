import 'dart:convert';

Summary summaryFromJson(String str) => Summary.fromJson(json.decode(str));

String summaryToJson(Summary data) => json.encode(data.toJson());

class Summary {
  Summary({
    this.totalVaccine,
    this.totalVaccineAllocated,
    this.totalVaccinationRegistration,
    this.totalInjected,
  });

  int totalVaccine;
  int totalVaccineAllocated;
  int totalVaccinationRegistration;
  int totalInjected;

  factory Summary.fromJson(Map<String, dynamic> json) => Summary(
    totalVaccine: json["totalVaccine"],
    totalVaccineAllocated: json["totalVaccineAllocated"],
    totalVaccinationRegistration: json["totalVaccinationRegistration"],
    totalInjected: json["totalInjected"],
  );

  Map<String, dynamic> toJson() => {
    "totalVaccine": totalVaccine,
    "totalVaccineAllocated": totalVaccineAllocated,
    "totalVaccinationRegistration": totalVaccinationRegistration,
    "totalInjected": totalInjected,
  };
}