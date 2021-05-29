import 'package:flutter/material.dart';

//4.Define seperate list widget and use it as template
Widget customListView({
  String title,
  String singer,
  String image,
  onTap,
}) {
  return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.all(20.0),
        child: Row(
          children: [
            Stack(children: [
              Container(
                height: 80.0,
                width: 80.0,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network(
                    image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                height: 80.0,
                width: 80.0,
                child: Icon(
                  Icons.play_circle_filled,
                  color: Colors.white.withOpacity(0.7),
                  size: 42.0,
                ),
              )
            ]),
            SizedBox(width: 16.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                    title,
                  style: TextStyle(
                      color: Colors.white60,
                      fontWeight: FontWeight.normal,
                      fontSize: 20.0
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  singer,
                  style: TextStyle(
                      color: Colors.white.withOpacity(0.5), fontSize: 14.0),
                ),
              ],
            ),
            Spacer(),
            Icon(
              Icons.more_horiz,
              color: Colors.white.withOpacity(0.6),
              size: 32.0,
            )
          ],
        ),
      ),
  );
}
