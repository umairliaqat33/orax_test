import 'package:flutter/material.dart';
import 'package:orax_test/core/common_widgets/asset_view_widget.dart';
import 'package:orax_test/core/constants/app_strings.dart';
import 'package:orax_test/core/constants/colors.dart';

class Header extends StatelessWidget {
  final bool showEdit;
  final String title;
  final String image;
  final bool isEditing;
  final VoidCallback onAdd;
  final VoidCallback onToggleEdit;

  const Header({
    super.key,
    required this.title,
    required this.isEditing,
    required this.onAdd,
    required this.onToggleEdit,
    required this.image,
    required this.showEdit,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(top: 16.0),
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: AppColors.appScaffoldColor,
                  ),
                  height: 60,
                  width: 60,
                  child: Center(
                    child: AssetView(
                      imagePath: image,
                      isForAsset: true,
                      height: 30,
                      width: 30,
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      if (showEdit)
                        GestureDetector(
                          onTap: onToggleEdit,
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 15,
                              vertical: 2,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color: isEditing
                                    ? Colors.green.shade400
                                    : Colors.black54,
                              ),
                            ),
                            child: Text(
                              isEditing ? AppStrings.save : AppStrings.edit,
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 8,
                                color: isEditing
                                    ? Colors.green.shade400
                                    : Colors.black54,
                              ),
                            ),
                          ),
                        )
                      else
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.grey,
                          ),
                          child: Text(
                            AppStrings.noProducts,
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 10,
                              color: Colors.white,
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),

        GestureDetector(
          onTap: onAdd,
          child: Container(
            height: 75,
            width: 60,
            padding: EdgeInsets.only(left: 5, right: 0, bottom: 5, top: 0),
            decoration: BoxDecoration(
              color: AppColors.appScaffoldColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(6),
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(6),
                topRight: Radius.circular(20),
              ),
            ),
            child: Container(
              height: 75,
              width: 60,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(6),
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(6),
                  topRight: Radius.circular(20),
                ),
              ),
              child: const Icon(Icons.add, color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
