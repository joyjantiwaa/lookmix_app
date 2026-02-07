import 'package:flutter/material.dart';
import 'package:lookmix_design_system/lookmix_design_system.dart';
import 'package:lookmix_app/screens/main_page.dart';

void main() {
  runApp(const LookmixApp());
}

class LookmixApp extends StatelessWidget {
  const LookmixApp({super.key});

  @override
  Widget build(BuildContext context) {
    // ต้องมี JpjoyThemeProvider ครอบเสมอเพื่อให้ดึงค่า Token ได้
    return JpjoyThemeProvider(
      tokens: JpjoyTokens.light(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        // ✅ รันเปิดหน้า Main ทันทีตามที่พี่ต้องการ
        home: const MainPage(), 
        // ถ้าอนาคตมีหลายหน้า ค่อยกลับมาเปิดใช้ routes ครับ
        /*
        initialRoute: '/main',
        routes: {
          '/main': (context) => const MainPage(),
          // '/daily_style': (context) => const DailyStylePage(),
        },
        */
      ),
    );
  }
}