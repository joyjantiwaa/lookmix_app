import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:lookmix_design_system/lookmix_design_system.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  String selectedImage = 'assets/img.png'; 

  final List<Map<String, String>> outfitList = [
    {'thumb': 'assets/1.1.png', 'full': 'assets/2.1.png'},
    {'thumb': 'assets/1.2.png', 'full': 'assets/2.2.png'},
    {'thumb': 'assets/1.3.png', 'full': 'assets/2.3.png'},
    {'thumb': 'assets/1.4.png', 'full': 'assets/2.4.png'}, 
  ];

  int activeMenu = 0;

  void toggleMenu(int id) {
    setState(() {
      activeMenu = (activeMenu == id) ? 0 : id;
    });
  }

  @override
  Widget build(BuildContext context) {
    final tokens = JpjoyTokens.light();

    return Scaffold(
      body: Stack(
        children: [
          // Background
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xFFF9F9F8), Color(0xFFE9E9E9)],
              ),
            ),
          ),
          
          // Main Image
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 70.0),
              child: Image.asset(
                selectedImage, 
                fit: BoxFit.contain,
                height: MediaQuery.of(context).size.height * 0.75,
                key: ValueKey(selectedImage),
              ),
            ),
          ),

          SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: tokens.layoutGutter, 
                vertical: tokens.spaceMedium
              ),
              child: Column(
                children: [
                  JpjoyInput(
                    placeholder: 'Search...',
                    radius: JpjoyInputRadius.pill,
                    trailingIcon: const Icon(Icons.search_rounded),
                  ),
                  Expanded(
                    child: Stack(
                      children: [
                        // ✅ ปุ่มฝั่งซ้าย: ใช้ไอคอน Flutter ปกติ
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              _sideBtn(Icons.bookmark_border_rounded, tokens),
                              SizedBox(height: tokens.spaceSmall),
                              _sideBtn(Icons.file_download_outlined, tokens),
                            ],
                          ),
                        ),
                        // ปุ่มฝั่งขวา
                        Align(
                          alignment: Alignment.bottomRight,
                          child: _buildRightMenu(tokens),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 160), 
                ],
              ),
            ),
          ),
          _buildBottomGlassBox(tokens),
        ],
      ),
    );
  }

  Widget _buildRightMenu(JpjoyTokens tokens) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
          decoration: BoxDecoration(
            color: tokens.colorSurfaceSecondary, 
            borderRadius: BorderRadius.circular(tokens.radiusPill),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // ชุด Secondary สำหรับเมนูที่ 1 (เสื้อ)
              if (activeMenu == 1) ...[
                _secondaryBtn(Icons.refresh_rounded, tokens),
                const SizedBox(height: 8),
                _secondaryBtn(Icons.palette_outlined, tokens),
                const SizedBox(height: 8),
                _secondaryBtn(Icons.straighten_rounded, tokens),
                const SizedBox(height: 8),
                _secondaryBtn(Icons.info_outline_rounded, tokens),
                const SizedBox(height: 12),
              ],
              if (activeMenu == 0 || activeMenu == 1)
                _mainMenuBtn(Icons.checkroom, 1, tokens),

              if (activeMenu == 0) const SizedBox(height: 16),

              // ชุด Secondary สำหรับเมนูที่ 2 (กางเกง/สไตล์)
              if (activeMenu == 2) ...[
                _secondaryBtn(Icons.refresh_rounded, tokens),
                const SizedBox(height: 8),
                _secondaryBtn(Icons.palette_outlined, tokens),
                const SizedBox(height: 8),
                _secondaryBtn(Icons.straighten_rounded, tokens),
                const SizedBox(height: 8),
                _secondaryBtn(Icons.info_outline_rounded, tokens),
                const SizedBox(height: 12),
              ],
              if (activeMenu == 0 || activeMenu == 2)
                _mainMenuBtn(Icons.style, 2, tokens),

              if (activeMenu == 0) const SizedBox(height: 16),

              // ชุด Secondary สำหรับเมนูที่ 3 (กระเป๋า)
              if (activeMenu == 3) ...[
                _secondaryBtn(Icons.refresh_rounded, tokens),
                const SizedBox(height: 8),
                _secondaryBtn(Icons.palette_outlined, tokens),
                const SizedBox(height: 8),
                _secondaryBtn(Icons.straighten_rounded, tokens),
                const SizedBox(height: 8),
                _secondaryBtn(Icons.info_outline_rounded, tokens),
                const SizedBox(height: 12),
              ],
              if (activeMenu == 0 || activeMenu == 3)
                _mainMenuBtn(Icons.shopping_bag, 3, tokens),
            ],
          ),
        ),
        const SizedBox(height: 40),
        JpjoyIconButton(
          icon: Icons.grid_view_rounded, 
          variant: IconButtonVariant.primary,
          color: tokens.colorSurfaceSecondary,
          onPressed: () {},
        ),
      ],
    );
  }

  // ✅ ปุ่มหลัก: พื้นหลังเป็นสี Subtle (จาก Variant) ไอคอนเป็นสี Surface Secondary
  Widget _mainMenuBtn(IconData icon, int id, JpjoyTokens tokens) {
    return JpjoyIconButton(
      icon: icon,
      variant: IconButtonVariant.primary, 
      color: tokens.colorSurfaceSecondary,
      onPressed: () => toggleMenu(id),
    );
  }

  Widget _sideBtn(IconData icon, JpjoyTokens tokens) {
    return JpjoyIconButton(
      icon: icon,
      variant: IconButtonVariant.primary,
      size: IconButtonSize.sm,
      color: tokens.colorSurfaceSecondary,
      onPressed: () {},
    );
  }

  Widget _secondaryBtn(IconData icon, JpjoyTokens tokens) {
    return JpjoyIconButton(
      icon: icon,
      variant: IconButtonVariant.secondary,
      color: tokens.colorSurfaceSecondary,
      onPressed: () => setState(() => activeMenu = 0),
    );
  }

  Widget _buildBottomGlassBox(JpjoyTokens tokens) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: tokens.blurDefault, sigmaY: tokens.blurDefault),
          child: Container(
            height: 177,
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 20),
            decoration: BoxDecoration(
              gradient: tokens.gradientGlass,
              border: Border(top: BorderSide(color: Colors.white.withOpacity(0.3))),
            ),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              itemCount: outfitList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 12.0),
                  child: _selectableImage(
                    outfitList[index]['thumb']!, 
                    outfitList[index]['full']!, 
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _selectableImage(String thumbPath, String fullPath) {
    return GestureDetector(
      onTap: () => setState(() => selectedImage = fullPath),
      child: JpjoyImage(
        src: thumbPath,
        alt: 'outfit',
        width: 98,
        height: 118,
        fit: BoxFit.cover,
        radius: JpjoyImageRadius.medium,
      ),
    );
  }
}