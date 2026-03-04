class FeaturedModel {
  final String name;
  final String iconPath;
  final String place;

  const FeaturedModel({
    required this.name,
    required this.iconPath,
    required this.place,
  });

  static List<FeaturedModel> getFeaturedModels() {
    List<FeaturedModel> featuredModels = [];

    featuredModels.add(
      FeaturedModel(
        name: 'Headline',
        iconPath: 'assets/icons/phil.png',
        place: 'Location',
      ),
    );

    featuredModels.add(
      FeaturedModel(
        name: 'Headline',
        iconPath: 'assets/icons/mask1_group.png',
        place: 'Location',
      ),
    );

    return featuredModels;
  }
}
