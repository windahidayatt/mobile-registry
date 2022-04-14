import 'package:flutter/material.dart';
import 'package:mobile_registry/shared_library/utils/color_tone.dart';

class InfoPatientWidget extends StatelessWidget {
  const InfoPatientWidget({
    Key? key,
    required this.title,
    required this.subTitle,
    required this.childSubTitle,
    required this.rightContent,
    required this.subRightContent,
    this.onTap,
  }) : super(key: key);
  final String title;
  final String subTitle;
  final String childSubTitle;
  final String rightContent;
  final String subRightContent;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        child: Row(
          children: [
            Expanded(
              flex: 8,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    Text(
                      subTitle,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    Text(
                      childSubTitle,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      rightContent,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 2.0, horizontal: 8.0),
                      child: Text(
                        subRightContent,
                        style: const TextStyle(color: ColorTone.reWhite),
                      ),
                      decoration: BoxDecoration(
                        color: (subRightContent.toUpperCase() ==
                                'Male'.toUpperCase())
                            ? ColorTone.reBlue
                            : ColorTone.reOrange,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(8),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
