import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/common/api/apis.dart';
import 'package:myapp/common/entitys/entitys.dart';
import 'package:myapp/common/utils/utils.dart';
import 'package:myapp/common/values/values.dart';
import 'package:myapp/common/widgets/widgets.dart';
import 'package:myapp/pages/avtivityhome/activityDetail.dart';
import 'package:myapp/pages/avtivityhome/commentDetail.dart';

class ActivityPage extends StatelessWidget {
  ActivityPage({Key? key}) : super(key: key);

  final liked = false.obs;
  final comments = 1.obs;
  final _commentList = CommentListResponseEntity().obs;
  // 读取所有数据
  _loadAllData() async {
    comments.value = Random().nextInt(20);
    _commentList.value = await CommentAPI.commentPageList();
  }

  PreferredSizeWidget _buildappbar(BuildContext context) {
    return transparentAppBar(
      context: context,
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back,
          color: AppColors.primaryText,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      actions: <Widget>[
        Obx(() => IconButton(
              icon: Icon(
                liked.isFalse ? Icons.favorite_border : Icons.favorite,
                color: AppColors.likeElement,
              ),
              onPressed: () {
                liked.value = !liked.value;
              },
            )),
      ],
      title: Text(
        'Activity',
        style: TextStyle(
          color: AppColors.primaryText,
          fontFamily: 'Montserrat',
          fontSize: duSetFontSize(18.0),
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    _loadAllData();
    Activity data = Get.arguments as Activity;
    return Scaffold(
      appBar: _buildappbar(context),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            activityDetailW(data),
            commentDetailW(_commentList.value),
            Center(
              child: Text("activity page${data.activityname}"),
            ),
          ],
        ),
      ),
    );
  }
}
