import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:todo_app/data/repositories/firestore_crud.dart';

class TaskContainer extends StatelessWidget {
  final String id;
  final Color color;
  final String title;
  final String starttime;
  final String endtime;
  final String note;

  const TaskContainer({
    Key? key,
    required this.id,
    required this.color,
    required this.title,
    required this.starttime,
    required this.endtime,
    required this.note,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(id),
      onDismissed: (direction) {
        FireStoreCrud().deleteTask(docid: id);
      },
      background: Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.red,
        ),
        child: const Icon(
          Icons.delete,
          color: Colors.white,
          size: 40,
        ),
        alignment: Alignment.centerLeft,
      ),
      child: Container(
        width: 100.w,
        height: 20.h,
        margin: EdgeInsets.symmetric(vertical: 1.h),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3),
          color: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
          Container(
          width: 1.w,
          height: 20.h,
          padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 3),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(3),
            color: color,
          ),
          ),
            SizedBox(
              width: 2.w,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.headline1!.copyWith(
                    color: Colors.black,
                    fontSize: 14.sp,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.watch_later_outlined,
                      color: Colors.black,
                      size: 15.sp,
                    ),
                    SizedBox(
                      width: 2.w,
                    ),
                    Text(
                      '$starttime - $endtime',
                      style: Theme.of(context).textTheme.headline1!.copyWith(
                        color: Colors.black,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
                Text(
                  note,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.headline1!.copyWith(
                    color: Colors.black,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
