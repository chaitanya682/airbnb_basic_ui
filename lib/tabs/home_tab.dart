import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '/models/featured.dart';
import '/models/recommended.dart';
import '/models/nearby.dart';
import '/models/popular_for_you.dart';
import '/models/toplocations.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  late final List<FeaturedModel> featured;
  late final List<RecommendedModel> recommended;
  late final List<NearbyModel> nearby;
  late final List<PopularModel> popular;
  late final List<TopLocation> locations;
  int selectedLocationIndex = -1;

  @override
  void initState() {
    super.initState();

    featured = FeaturedModel.getFeaturedModels();
    recommended = RecommendedModel.getRecommendedModels();
    nearby = NearbyModel.getNearbyModels();
    popular = PopularModel.getPopularModels();
    locations = TopLocation.getTopLocations();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _topBar(),

              _searchBar(),

              SizedBox(height: 10),
              sectionTitle("Featured"),
              _featuredSection(),

              SizedBox(height: 10),
              sectionTitle("Categories"),
              categoriesSection(),

              SizedBox(height: 10),
              sectionTitle("Recommended"),
              _recommendedSection(),

              SizedBox(height: 10),
              sectionTitle("Nearby"),
              _nearbySection(),

              SizedBox(height: 10),
              sectionTitle("Popular for you"),
              _pfuSection(),

              SizedBox(height: 10),
              sectionTitle("Top Locations"),
              _topLocationsSection(),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  SizedBox _topLocationsSection() {
    return SizedBox(
      height: 56,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: locations.length,
        itemBuilder: (_, i) {
          final item = locations[i];
          final isSelected = i == selectedLocationIndex;

          return GestureDetector(
            onTap: () => setState(() => selectedLocationIndex = i),
            child: Container(
              margin: const EdgeInsets.only(right: 10),
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: isSelected
                      ? const Color(0xff007AFF)
                      : Colors.grey.shade300,
                  width: isSelected ? 2 : 1,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.05),
                    blurRadius: 6,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      item.iconPath,
                      width: 36,
                      height: 36,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 8),

                  Text(
                    item.name,
                    style: GoogleFonts.inter(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: isSelected
                          ? const Color(0xff0A68FF)
                          : const Color(0xff1A1C29),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  ListView _pfuSection() {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      //padding: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.only(left: 15, right: 60),
      itemCount: popular.length,
      itemBuilder: (_, i) {
        final item = popular[i];
        return Column(
          children: [
            Container(
              // // // margin: const EdgeInsets.only(bottom: 12),
              // // // padding: const EdgeInsets.all(10),
              //  decoration: BoxDecoration(
              // //   //color: Colors.white,
              // //   //borderRadius: BorderRadius.circular(12),
              //    boxShadow: [
              //     BoxShadow(
              //        color: Colors.black.withValues(alpha: 0.06),
              //      blurRadius: 8,
              //        offset: const Offset(0, 3),
              //      ),
              //    ],
              //  ),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      item.iconPath,
                      width: 80,
                      height: 62,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 14),

                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.name,
                          style: GoogleFonts.inter(
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xff1A1C29),
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 6),
                        Row(
                          children: [
                            Image.asset(item.locationIconPath, width: 14),
                            const SizedBox(width: 4),
                            Expanded(
                              child: Text(
                                item.address,
                                style: GoogleFonts.inter(
                                  fontSize: 13,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.grey,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            if (i != popular.length)
              const Divider(height: 28, thickness: 1, color: Color(0xffE5E7EB)),
          ],
        );
      },
    );
  }

  GridView _nearbySection() {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 15),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 2.0,
      ),
      itemCount: nearby.length,
      itemBuilder: (_, i) {
        final item = nearby[i];
        return Container(
          padding: const EdgeInsets.all(8),

          decoration: BoxDecoration(
            color: Colors.white,
            //color: Color(0xffE5E7EB),
            borderRadius: BorderRadius.circular(5),

            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.07),
                blurRadius: 10,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.8),
                      blurRadius: 6,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    item.iconPath,
                    width: 80,
                    height: 62,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 12),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      item.name,
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Image.asset(item.locationIconPath, width: 10),
                        const SizedBox(width: 3),
                        Expanded(
                          child: Text(
                            item.location,
                            style: GoogleFonts.inter(
                              fontSize: 13,
                              fontWeight: FontWeight.normal,
                              color: Color(0xff9DA4AE),
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  SizedBox _recommendedSection() {
    return SizedBox(
      height: 164,

      child: ListView.builder(
        scrollDirection: Axis.horizontal,

        itemCount: recommended.length,

        itemBuilder: (_, i) {
          final item = recommended[i];

          return Container(
            width: 224,
            margin: const EdgeInsets.only(left: 15),

            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),

              image: DecorationImage(
                image: AssetImage(item.iconPath),
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }

  SizedBox _featuredSection() {
    return SizedBox(
      height: 375,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),

        itemCount: featured.length,
        itemBuilder: (_, i) {
          final item = featured[i];
          return Container(
            width: 256,
            //height: 365,
            margin: const EdgeInsets.only(right: 16, bottom: 5, top: 4),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Color(0xffF3F3F8), width: 2),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.08),
                  blurRadius: 2,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(14),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.asset(
                      item.iconPath,
                      width: 226,
                      height: 268,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.fromLTRB(12, 4, 12, 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.name,
                        style: GoogleFonts.inter(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff000000),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        item.place,
                        style: GoogleFonts.inter(
                          fontSize: 15,
                          color: Color(0xff000000),
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Padding _searchBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        height: 52,

        padding: const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.3),
              blurRadius: 5,
              offset: const Offset(2, 5),
            ),
          ],
        ),
        child: Row(
          children: [
            //  Icon(Icons.search, color: Color(0xff007AFF)),
            SvgPicture.asset(
              'assets/icons/search.svg',
              colorFilter: ColorFilter.mode(Color(0xff0A68FF), BlendMode.srcIn),
            ),
            SizedBox(width: 10),
            Expanded(
              child: Text(
                "Search Property",
                style: GoogleFonts.inter(
                  fontSize: 15,
                  fontWeight: FontWeight.normal,
                  color: Color(0xff9DA4AE),
                ),
              ),
            ),

            SizedBox(
              width: 100,
              child: IntrinsicHeight(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const VerticalDivider(
                      color: Colors.black,
                      indent: 10,
                      endIndent: 10,
                      thickness: 0.4,
                    ),
                    SizedBox(width: 0),
                    Padding(
                      padding: const EdgeInsets.all(9),
                      child: Image.asset('assets/icons/filter.png'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Padding _topBar() {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    "Location",
                    style: GoogleFonts.inter(
                      color: Color(0xff9DA4AE),
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                  ),

                  SizedBox(width: 5),

                  Image.asset('assets/icons/live_area.png'),
                ],
              ),

              Row(
                children: [
                  Image.asset(
                    'assets/icons/location_pin.png',
                    width: 24,
                    height: 24,
                  ),
                  SizedBox(width: 4),
                  Text(
                    "Hyderabad, Telangana",
                    style: GoogleFonts.inter(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Image.asset(
            'assets/icons/notification_frame.png',
            height: 44,
            width: 44,
          ),
        ],
      ),
    );
  }

  Widget sectionTitle(String title, {TextStyle? style}) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 20, 16, 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style:
                style ??
                GoogleFonts.inter(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff1A1C29),
                ),
          ),
          Row(
            children: [
              Text(
                "See All",
                style: GoogleFonts.inter(
                  color: const Color(0xff007AFF),
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(width: 2),
              const Icon(
                Icons.arrow_forward_ios,
                color: Color(0xff007AFF),
                size: 12,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget categoriesSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Expanded(child: categoryTile("Apartment")),
          const SizedBox(width: 10),
          Expanded(child: categoryTile("Flat")),
        ],
      ),
    );
  }

  Widget categoryTile(String title) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 15),
      decoration: BoxDecoration(
        color: Color(0xffF2F2F7),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.3),
            blurRadius: 1,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: GoogleFonts.inter(
              fontSize: 17,
              fontWeight: FontWeight.normal,
              color: Color(0xff000000),
            ),
          ),
          Image.asset('assets/icons/arrow.png', height: 24, width: 24),
        ],
      ),
    );
  }
}
