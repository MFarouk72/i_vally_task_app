import 'package:flutter/material.dart';
import 'package:i_vally_task_app/commons/common_widgets/product_item.dart';
import 'package:i_vally_task_app/utilites/size_config.dart';

class ProductListView extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.safeBlockVertical*60,
      width: SizeConfig.screenWidth,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 3,
        itemBuilder: (context, index) {
          return ProductItem(height: SizeConfig.safeBlockVertical*60, width: SizeConfig.safeBlockHorizontal*50,
          );
        },
      ),
    );
  }
}
