import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_dialogs/flutter_dialogs.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
  final TextEditingController _ReasonController = TextEditingController();
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

  _showAlert(BuildContext context) {
    showPlatformDialog(
      context: context,
      builder: (_) => BasicDialogAlert(
        title: Text("Reason"),
        content: inputTextEdit(controller: _ReasonController),
        actions: <Widget>[
          BasicDialogAction(
            title: Text("OK"),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildfeet(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(8, 0, 8, 0),
      width: 359.w,
      child: TextButton(
        style: TextButton.styleFrom(backgroundColor: Colors.blue[100]),
        child: Text('报名参加'),
        onPressed: () => {_showAlert(context)},
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
            TextButton(onPressed: _loadAllData, child: Text("change")),
            activityDetailW(data),
            Divider(
              height: 10,
            ),
            Obx(() => commentDetailW(_commentList.value)),
            Container(
              height: 40.h,
            )
          ],
        ),
      ),
      bottomSheet: _buildfeet(context),
    );
  }
}
