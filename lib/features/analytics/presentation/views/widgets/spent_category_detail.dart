import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SpentCategoryDetail extends StatelessWidget {
  const SpentCategoryDetail({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      child: Column(
        children: [
          SizedBox(height: 20.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Operacion:',
                style: TextStyle(
                    fontSize: 16.sp,
                    color: Colors.black87,
                    fontWeight: FontWeight.w500),
              ),
              Text(
                'Restaurantes y bares',
                style: TextStyle(
                    fontSize: 16.sp,
                    color: Colors.black87,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
          SizedBox(height: 20.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Fecha:',
                style:
                    TextStyle(fontSize: 14.sp, color: Colors.black54),
              ),
              Text(
                '05/05/2021',
                style:
                    TextStyle(fontSize: 14.sp, color: Colors.black54),
              ),
            ],
          ),
          SizedBox(height: 20.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Hora:',
                style:
                    TextStyle(fontSize: 14.sp, color: Colors.black54),
              ),
              Text(
                '20:06 hs',
                style:
                    TextStyle(fontSize: 14.sp, color: Colors.black54),
              ),
            ],
          ),
          SizedBox(height: 20.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Cod. de referencia:',
                style:
                    TextStyle(fontSize: 14.sp, color: Colors.black54),
              ),
              Text(
                '123456',
                style:
                    TextStyle(fontSize: 14.sp, color: Colors.black54),
              ),
            ],
          ),
          SizedBox(height: 20.h),
        ],
      ),
    );
  }
}
