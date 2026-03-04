import 'package:flutter/material.dart';
import '/tabs/home_tab.dart';
import '/tabs/comingsoon_tab.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  final pages = [
    const HomeTab(),
    const ComingSoonTab(),
    const ComingSoonTab(),
    const ComingSoonTab(),
    const ComingSoonTab(),
  ];

  final List<Map<String, String>> navItems = [
    {'icon': 'assets/icons/home.png', 'label': 'Home'},
    {'icon': 'assets/icons/explore.png', 'label': 'Explore'},
    {'icon': 'assets/icons/favorite.png', 'label': 'Saved'},
    {'icon': 'assets/icons/chat.png', 'label': 'Alerts'},
    {'icon': 'assets/icons/profile.png', 'label': 'Profile'},
  ];

  void onTap(int index) {
    setState(() => selectedIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[selectedIndex],
      bottomNavigationBar: _buildCustomNavBar(),
    );
  }

  Widget _buildCustomNavBar() {
    return Container(
      height: 86,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            blurRadius: 12,
            offset: const Offset(0, -3),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(navItems.length, (index) {
          final item = navItems[index];
          final bool isSelected = selectedIndex == index;

          return GestureDetector(
            onTap: () => onTap(index),
            behavior: HitTestBehavior.opaque,
            child: SizedBox(
              width: 60,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ColorFiltered(
                    colorFilter: ColorFilter.mode(
                      isSelected ? const Color(0xff007AFF) : Colors.black,
                      BlendMode.srcIn,
                    ),
                    child: Image.asset(
                      item['icon']!,
                      width: 24,
                      height: 24,

                      errorBuilder: (context, error, stackTrace) {
                        return Icon(
                          Icons.circle_outlined,
                          size: 24,
                          color: isSelected
                              ? const Color(0xff007AFF)
                              : Colors.grey,
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    item['label']!,
                    style: GoogleFonts.inter(
                      fontSize: 10,
                      fontWeight: isSelected
                          ? FontWeight.w500
                          : FontWeight.w500,
                      color: isSelected
                          ? const Color(0xff007AFF)
                          : Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
