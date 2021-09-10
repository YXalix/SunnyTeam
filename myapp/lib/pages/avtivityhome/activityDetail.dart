import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myapp/common/entitys/activity.dart';
import 'package:myapp/common/utils/utils.dart';

Widget activityDetailW(Activity item) {
  return Container(
      width: 340.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset("assets/images/Girl_1.JPG"),
          ),

          //activityname
          Container(
            margin: EdgeInsets.fromLTRB(5, 10, 0, 0),
            child: Text("${item.activityname}",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600)),
          ),
          //activity deadline
          Container(
            margin: EdgeInsets.fromLTRB(10, 15, 0, 0),
            child: Row(
              children: <Widget>[
                Icon(Icons.schedule),
                Container(
                  margin: EdgeInsets.only(left: duSetHeight(10)),
                  child: Text("${item.deadline}"),
                ),
              ],
            ),
          ),
          //activity place
          Container(
            margin: EdgeInsets.only(left: duSetHeight(10)),
            child: Row(
              children: <Widget>[
                Icon(Icons.place),
                Container(
                  margin: EdgeInsets.only(left: duSetHeight(10)),
                  child: Text("${item.position}"),
                ),
              ],
            ),
          ),
          //user
          Container(
            margin: EdgeInsets.fromLTRB(5, 15, 0, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("主办方",
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
                Container(
                  margin: EdgeInsets.only(top: duSetHeight(5)),
                  child: Row(
                    children: <Widget>[
                      ClipOval(
                        child: Image.asset("assets/images/Girl_2.JPG",
                            width: 50, height: 50, fit: BoxFit.cover),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: duSetHeight(10)),
                        child: Text("${item.username}"),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          //activity content
          Container(
            margin: EdgeInsets.fromLTRB(5, 15, 0, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("活动内容",
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
                Container(
                  margin: EdgeInsets.fromLTRB(15, 5, 0, 0),
                  child: Text("${item.content}"),
                ),
              ],
            ),
          ),
        ],
      ));
}
