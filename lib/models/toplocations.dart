class TopLocation {
  final String name;
  final String iconPath;

  TopLocation({required this.name, required this.iconPath});

  static List<TopLocation> getTopLocations() {
    List<TopLocation> topLocations = [];

    topLocations.add(
      TopLocation(name: 'Jubilee Hills', iconPath: 'assets/icons/jubilee.png'),
    );

    topLocations.add(
      TopLocation(name: 'Banjara Hills', iconPath: 'assets/icons/banjara.png'),
    );

    topLocations.add(
      TopLocation(name: 'Gachibowli', iconPath: 'assets/icons/gachibowli.png'),
    );

    return topLocations;
  }
}
