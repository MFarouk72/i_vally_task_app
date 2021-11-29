import 'package:flutter/material.dart';
import 'package:i_vally_task_app/utilites/size_config.dart';

class SectionTitleAndSeeAll extends StatelessWidget {
  String sectionTitle;
  SectionTitleAndSeeAll({required this.sectionTitle});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: SizeConfig.padding,
        bottom: SizeConfig.padding,
        right: SizeConfig.padding,
        left: SizeConfig.padding,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Text(
              "اظهار الكل",
              style: TextStyle(
                fontSize: SizeConfig.titleFontSize,
                color: Colors.blue,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Text(
            sectionTitle,
            style:TextStyle(
              fontSize: SizeConfig.titleFontSize,
              color: Colors.black,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
