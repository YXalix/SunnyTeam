import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/common/entitys/entitys.dart';
import 'package:myapp/common/utils/screen.dart';
import 'package:myapp/common/utils/utils.dart';
import 'package:myapp/common/values/values.dart';

Widget activityItem(Activity item) {
  return Container(
    height: duSetHeight(161),
    padding: EdgeInsets.all(duSetWidth(20)),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.asset("assets/images/Girl_1.JPG"),
        ),
        InkWell(
          child: SizedBox(
            width: duSetWidth(220), //194
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                //username
                Container(
                    margin: EdgeInsets.all(0),
                    child: Row(
                      children: <Widget>[
                        Text(
                          item.username,
                          style: TextStyle(
                            fontFamily: 'Avenir',
                            fontWeight: FontWeight.normal,
                            color: AppColors.thirdElementText,
                            fontSize: duSetFontSize(14),
                            height: 1,
                          ),
                        ),
                      ],
                    )),
                // 标题
                Container(
                  margin: EdgeInsets.only(top: duSetHeight(10)),
                  child: Text(
                    item.activityname,
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w500,
                      color: AppColors.primaryText,
                      fontSize: duSetFontSize(16),
                      height: 1,
                    ),
                    overflow: TextOverflow.clip,
                    maxLines: 3,
                  ),
                ),

                // 活动开始时间
                Container(
                  margin: EdgeInsets.only(top: duSetHeight(20)),
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.schedule,
                        size: 12,
                      ),
                      Text(
                        item.deadline,
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w500,
                          color: AppColors.primaryText,
                          fontSize: duSetFontSize(10),
                          height: 1,
                        ),
                        overflow: TextOverflow.clip,
                        maxLines: 3,
                      ),
                    ],
                  ),
                ),
                // 活动地点
                Container(
                  margin: EdgeInsets.only(top: duSetHeight(1)),
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.place,
                        size: 12,
                      ),
                      Text(
                        item.position,
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w500,
                          color: AppColors.primaryText,
                          fontSize: duSetFontSize(10),
                          height: 1,
                        ),
                        overflow: TextOverflow.clip,
                        maxLines: 3,
                      ),
                    ],
                  ),
                ),
                // Spacer
                Spacer(),
                // 一行 3 列
                Container(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      // 发布时间
                      ConstrainedBox(
                        constraints: BoxConstraints(
                          maxWidth: duSetWidth(60),
                        ),
                        child: Text(
                          item.activitytime,
                          style: TextStyle(
                            fontFamily: 'Avenir',
                            fontWeight: FontWeight.normal,
                            color: AppColors.secondaryElementText,
                            fontSize: duSetFontSize(14),
                            height: 1,
                          ),
                          overflow: TextOverflow.clip,
                          maxLines: 1,
                        ),
                      ),

                      // like
                      Spacer(),
                      // 更多

                      /*InkWell(
                      child: Icon(
                        Icons.favorite,
                        color: AppColors.likeElement,
                        size: 24,
                      ),
                      onTap: () {
                        print("hello");
                      },
                    ),*/
                      // 活动地点
                      Container(
                        child: Row(
                          children: <Widget>[
                            Icon(
                              Icons.favorite,
                              color: AppColors.likeElement,
                              size: 24,
                            ),
                            Text(
                              item.likes,
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w500,
                                color: AppColors.primaryText,
                                fontSize: duSetFontSize(10),
                                height: 1,
                              ),
                              overflow: TextOverflow.clip,
                              maxLines: 3,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          onTap: () {
            Get.toNamed('/activity/777', arguments: item);
          },
        )
      ],
    ),
  );
}
