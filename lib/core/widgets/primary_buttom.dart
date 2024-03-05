import 'package:fintech_test/core/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PrimaryButtom extends StatelessWidget {
  const PrimaryButtom({
    super.key, required this.title,
  });
final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.30,
            vertical: 15.h, // Ajusta la altura según tus preferencias
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
                10.0), // Ajusta el radio de los bordes según tus preferencias
          ),
        ),
        onPressed: () {},
        child: Text(title, style: 
        TextStyle(fontSize: 16.sp,
         fontWeight: FontWeight.w600, color: Colors.white),),
      ),
    );
  }
}