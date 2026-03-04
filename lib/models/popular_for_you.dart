class PopularModel {
  final String name;
  final String iconPath;
  final String locationIconPath;
  final String address;

  PopularModel({
    required this.name,
    required this.iconPath,
    required this.locationIconPath,
    required this.address,
  });

  static List<PopularModel> getPopularModels() {
    List<PopularModel> popularModels = [];

    popularModels.add(
      PopularModel(
        name: 'Takatea Homestay',
        iconPath: 'assets/icons/popular_img1.png',
        locationIconPath: 'assets/icons/loc_icon.png',
        address: 'Jl. Tentara Pelajar No.47, RW.001',
      ),
    );

    popularModels.add(
      PopularModel(
        name: 'Maharani Villa Yogyakarta',
        iconPath: 'assets/icons/nearby_img1.png',

        locationIconPath: 'assets/icons/loc_icon.png',
        address:
            'Benhil, Jl. Bendungan Hilir Karet Tengsin, Bendungan Hilir, Tanah Abang, Central Jakarta City,',
      ),
    );

    popularModels.add(
      PopularModel(
        name: 'Bali Komang Guest',
        iconPath: 'assets/icons/popular_img3.png',
        locationIconPath: 'assets/icons/loc_icon.png',
        address: 'Nusa Penida, Bali',
      ),
    );

    popularModels.add(
      PopularModel(
        name: 'Batavia Apartments',
        iconPath: 'assets/icons/popular_img4.png',
        locationIconPath: 'assets/icons/loc_icon.png',
        address:
            'Benhil, Jl. Bendungan Hilir Karet Tengsin, Bendungan Hilir, Tanah Abang, Central Jakarta City,',
      ),
    );

    popularModels.add(
      PopularModel(
        name: 'Manhattan Hotel',
        iconPath: 'assets/icons/popular_img5.png',
        locationIconPath: 'assets/icons/loc_icon.png',
        address:
            'Jl. Prof. DR. Satrio No.Kav.19-24, RT.7/RW.4, Kuningan, Karet Kuningan, Kecamatan Setiabudi, Kota Jakarta Selatan',
      ),
    );

    return popularModels;
  }
}
