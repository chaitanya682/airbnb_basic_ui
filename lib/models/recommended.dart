class RecommendedModel {
  final String iconPath;

  RecommendedModel({required this.iconPath});

  static List<RecommendedModel> getRecommendedModels() {
    List<RecommendedModel> recommendedModels = [];

    recommendedModels.add(RecommendedModel(iconPath: 'assets/icons/card.png'));

    recommendedModels.add(
      RecommendedModel(iconPath: 'assets/icons/card_1.png'),
    );

    return recommendedModels;
  }
}
