
class Dashboard {
  Dashboard({
    this.allocatedDate,
    this.vaccineTotal,
    this.vaccineAllocation,
    this.objectInjection,
    this.totalPopulation,
    this.totalOneInjected,
    this.totalTwiceInjected,
  });

  DateTime allocatedDate;
  int vaccineTotal;
  int vaccineAllocation;
  int objectInjection;
  int totalPopulation;
  int totalOneInjected;
  int totalTwiceInjected;

  factory Dashboard.fromJson(Map<String, dynamic> json) => Dashboard(
    allocatedDate: DateTime.parse(json["allocatedDate"]),
    vaccineTotal: json["vaccineTotal"],
    vaccineAllocation: json["vaccineAllocation"],
    objectInjection: json["objectInjection"],
    totalPopulation: json["totalPopulation"],
    totalOneInjected: json["totalOneInjected"],
    totalTwiceInjected: json["totalTwiceInjected"],
  );
}