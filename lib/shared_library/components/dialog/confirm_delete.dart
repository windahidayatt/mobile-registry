import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:mobile_registry/gen/fonts.gen.dart';
import 'package:mobile_registry/shared_library/components/button/re_button.dart';
import 'package:mobile_registry/shared_library/utils/color_tone.dart';
import 'package:sizer/sizer.dart';

class ConfirmDelete extends StatelessWidget {
  const ConfirmDelete({
    Key? key,
    this.onCancel,
    this.onDelete,
  }) : super(key: key);
  final void Function()? onCancel;
  final void Function()? onDelete;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: ColorTone.reLightBlack.withOpacity(0.4),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 30.h),
        child: Card(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.all(2.h),
                child: Text(
                  'Confirm Delete',
                  style: TextStyle(
                    fontFamily: FontFamily.inter,
                    fontWeight: FontWeight.w800,
                    color: ColorTone.reDarkGrey,
                    fontSize: 14.sp,
                  ),
                ),
              ),
              Text(
                'Are you sure delete this data?',
                style: TextStyle(
                  fontFamily: FontFamily.inter,
                  fontSize: 12.sp,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(2.h),
                child: Row(
                  children: [
                    Expanded(
                      child: REButton(
                        colorBackground: ColorTone.reDarkGrey,
                        label: 'Cancel',
                        onTap: () {
                          Get.back();
                          onCancel?.call();
                        },
                      ),
                    ),
                    const SizedBox(width: 8.0),
                    Expanded(
                      child: REButton(
                        label: 'Delete',
                        onTap: () {
                          Get.back();
                          onDelete?.call();
                        },
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
