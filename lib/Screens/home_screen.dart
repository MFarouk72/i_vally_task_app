import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:i_vally_task_app/commons/common_widgets/defult_form_field.dart';
import 'package:i_vally_task_app/commons/common_widgets/drop_down_widget.dart';
import 'package:i_vally_task_app/commons/common_widgets/product_item.dart';
import 'package:i_vally_task_app/commons/common_widgets/product_list_view.dart';
import 'package:i_vally_task_app/commons/common_widgets/section_title_and_see_all.dart';
import 'package:i_vally_task_app/utilites/constants/app_assets.dart';
import 'package:i_vally_task_app/utilites/size_config.dart';

class HomeScreenView extends StatefulWidget {
  @override
  State<HomeScreenView> createState() => _HomeScreenViewState();
}

class _HomeScreenViewState extends State<HomeScreenView> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        toolbarHeight: SizeConfig.blockSizeVertical * 45,
        flexibleSpace: Stack(
          alignment: Alignment.topCenter,
          children: [
            Image.asset(AppAssets.egypt),
            Positioned(
              top: 40,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: SizeConfig.blockSizeHorizontal * 35,
                    child: Image.asset(AppAssets.logo),
                  ),
                  SizedBox(
                    height: SizeConfig.padding,
                  ),
                  Text(
                    'اكتشف منزلك الجديد بسهولة',
                    style: TextStyle(
                      fontSize: SizeConfig.titleFontSize,
                      color: Colors.red,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.padding*8,
                  ),
                  Row(
                    children: [
                      DefaultFormField(label: "ابحث عن",),
                      DropdownWidget(),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SectionTitleAndSeeAll(sectionTitle: 'الأقل سعرا'),
            ProductListView(),
          ],
        ),
      ),
    );
  }
}