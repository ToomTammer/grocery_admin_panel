import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {
  final Widget mobile;
  // final Widget? tablet;
  final Widget desktop;

  const Responsive({
    Key? key,
    required this.mobile,
    required this.desktop,
  }) : super(key: key);

  static bool isMobile(BuildContext context) =>
      //MediaQuery สร้างทรีย่อยที่แบบสอบถามสื่อแก้ไขข้อมูลที่กำหนด
      MediaQuery.of(context).size.width < 850;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1100;

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    // หากความกว้างของเรามากกว่า 1100 เราจะถือว่าเป็นเดสก์ท็อป
    if (_size.width >= 1100) {
      return desktop;
    }
    // ถ้าความกว้างน้อยกว่า 1100 และมากกว่า 850 เราจะถือว่าเป็น tablet
    // หรือน้อยกว่าที่เราเรียกว่า mobile
    else {
      return mobile;
    }
  }
}
