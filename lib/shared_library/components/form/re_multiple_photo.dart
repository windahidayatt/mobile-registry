import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:mobile_registry/shared_library/components/button/re_button.dart';
import 'package:mobile_registry/shared_library/utils/color_tone.dart';

class REMultiplePhoto extends StatelessWidget {
  const REMultiplePhoto({
    Key? key,
    required this.title,
    required this.images,
    required this.onAdd,
  }) : super(key: key);
  final String title;
  final List<PlatformFile>? images;
  final Function()? onAdd;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 4,
        horizontal: 8,
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: ColorTone.reDarkGrey,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(16),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: Text(title),
          ),
          Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: 90,
                  child: (images?.length ?? 0) > 0
                      ? ListView.builder(
                          itemCount: images?.length ?? 0,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Stack(
                              children: [
                                Image.file(
                                  File.fromUri(
                                    Uri.file(images![index].path!),
                                  ),
                                  width: 90,
                                  height: 90,
                                  fit: BoxFit.cover,
                                ),
                                GestureDetector(
                                  child: const Icon(Icons.close),
                                  onTap: () => images?.removeAt(index),
                                )
                              ],
                            );
                          },
                        )
                      : const Text('Empty Images'),
                ),
              ),
              const SizedBox(
                width: 12,
              ),
              REButton(
                label: 'Add Files',
                onTap: onAdd,
              )
            ],
          )
        ],
      ),
    );
  }
}
