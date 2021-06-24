class TravelCostModel {
  final String description;
  final String cost;
  final String minimumDeposit;

  TravelCostModel({this.description, this.cost, this.minimumDeposit});

  factory TravelCostModel.fromMap(travelCost) {
    return TravelCostModel(
      cost: travelCost['cost'].toString(),
      description: travelCost['description'],
      minimumDeposit: travelCost['minimum_deposit'].toString(),
    );
  }
}
