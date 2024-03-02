import 'package:fintech_test/core/theme/theme.dart';
import 'package:fintech_test/features/home/presentation/logic/logic.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var _showBalance = false;
    return Scaffold(
        body: CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          backgroundColor: Colors.transparent,
          expandedHeight: 300,
          collapsedHeight: 300,
          pinned: true,
          automaticallyImplyLeading: false,
          flexibleSpace: FlexibleSpaceBar(
            title: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      width: 20.w,
                    ),
                    Text('eCLUB',
                        style: TextStyle(color: Colors.white, fontSize: 20.sp)),
                    SizedBox(
                      width: 20.w,
                    ),
                    Icon(
                      Icons.menu_rounded,
                      color: Colors.white,
                      size: 24.sp,
                    ),
                    //SizedBox(width: 5,)
                  ],
                ),
                SizedBox(
                  height: 70.h,
                ),
                Padding(
                  padding: EdgeInsets.only(right: 50.w),
                  child: Text(
                    'Disponible',
                    style: TextStyle(color: Colors.white, fontSize: 15.sp),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 50.w, top: 20.h),
                  child: BlocBuilder<HeaderBloc, HeaderState>(
                    builder: (context, state) {
                      if (state.balanceStatus == BalanceStatus.hidden) {
                        _showBalance = false;
                      } else {
                        _showBalance = true;
                      }
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            state.balanceStatus == BalanceStatus.hidden
                                ? 'Gs. 2.300.000'
                                : '**********',
                            style:TextStyle(
                              color: Colors.white,
                              fontSize: 25.sp,
                              fontWeight: FontWeight.w600,
                          ),),
                          SizedBox(
                            width: 10.w,
                          ),
                          GestureDetector(
                              onTap: () {
                                context
                                    .read<HeaderBloc>()
                                    .add(ToggleBalance(_showBalance));
                              },
                              child: Icon(
                                state.balanceStatus == BalanceStatus.hidden
                                    ? Icons.visibility_off_rounded
                                    : Icons.visibility_rounded,
                                color: Colors.white,
                              ))
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
            background: Container(
              decoration: const BoxDecoration(
                gradient: AppColors.primaryGradient,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return ListTile(
                title: Text('Item #$index'),
              );
            },
            childCount: 100,
          ),
        ),
      ],
    ));
  }
}
