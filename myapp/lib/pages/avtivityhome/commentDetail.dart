import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myapp/common/entitys/entitys.dart';

Widget commentDetailW(CommentListResponseEntity comments) {
  return Container(
    margin: EdgeInsets.fromLTRB(5, 10, 0, 0),
    width: 340.w,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          '评论',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        ),
        Column(
          children: comments.comments == null
              ? [Text('no comment')]
              : comments.comments!.map((item) {
                  return Column(
                    children: <Widget>[
                      commentItem(item),
                      Divider(
                        height: 20,
                      ),
                    ],
                  );
                }).toList(),
        ),
      ],
    ),
  );
}

Widget commentItem(Comment item) {
  return Container(
    child: Column(
      children: <Widget>[
        Container(
          width: 340,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                '${item.username}:',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w300),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(5, 10, 0, 0),
                child: Text(
                  '${item.content}',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
              ),
              Row(
                children: <Widget>[
                  Spacer(),
                  Text(
                    '${item.publishtime}',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w200),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
