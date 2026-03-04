class NearbyModel {
  final String name;
  final String iconPath;
  final String locationIconPath;
  final String location;

  NearbyModel({
    required this.name,
    required this.iconPath,
    required this.locationIconPath,
    required this.location,
  });

  static List<NearbyModel> getNearbyModels() {
    List<NearbyModel> nearbyModels = [];

    nearbyModels.add(
      NearbyModel(
        name: 'Maharani Villa Yogyakarta',
        iconPath: 'assets/icons/nearby_img1.png',
        locationIconPath: 'assets/icons/loc_icon.png',
        location:
            'Benhil, Jl. Bendungan Hilir Karet Tengsin, Bendungan Hilir, Tanah Abang, Central Jakarta City,',
      ),
    );

    nearbyModels.add(
      NearbyModel(
        name: 'House of Mormon vv',
        iconPath: 'assets/icons/nearby_img3.png',
        locationIconPath: 'assets/icons/loc_icon.png',
        location: 'Denpasar, Bali',
      ),
    );

    nearbyModels.add(
      NearbyModel(
        name: 'Apartement land house',
        iconPath: 'assets/icons/nearby_img2.png',
        locationIconPath: 'assets/icons/loc_icon.png',
        location: 'Jl. Tentara Pelajar No.47, RW.001',
      ),
    );

    nearbyModels.add(
      NearbyModel(
        name: 'Palm Hotel',
        iconPath: 'assets/icons/nearby_img4.png',
        locationIconPath: 'assets/icons/loc_icon.png',
        location: 'Jl. Seturan Yohyakarta',
      ),
    );

    return nearbyModels;
  }
}
