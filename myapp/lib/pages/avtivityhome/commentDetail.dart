import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:glassmorphism_ui/glassmorphism_ui.dart';
import 'package:myapp/common/entitys/entitys.dart';
import 'package:myapp/common/values/values.dart';

Widget commentDetailW(CommentListResponseEntity item) {
  return Container(
    height: 400.h,
    width: 340.w,
    color: AppColors.uiColor2,
    child: Column(
      children: <Widget>[
        GlassContainer(
          height: 130,
          blur: 5,
          shadowStrength: 10,
          opacity: 0.7,
          width: 350,
          //--code to remove border
          border: Border.fromBorderSide(BorderSide.none),
          borderRadius: BorderRadius.circular(20),
          child: Center(
            child: Text(
              "${item.comments?.first.username}",
            ),
          ),
        ),
      ],
    ),
  );
}
