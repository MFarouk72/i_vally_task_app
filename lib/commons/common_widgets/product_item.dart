import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:i_vally_task_app/models/lowest_price_data.dart';
import 'package:i_vally_task_app/utilites/constants/app_assets.dart';
import 'package:i_vally_task_app/utilites/size_config.dart';
import 'package:provider/provider.dart';

class ProductItem extends StatelessWidget {
  double height;
  double width;

  ProductItem({required this.height, required this.width});

  @override
  Widget build(BuildContext context) {
    context.read<LowestPriceData>().fetchData;
    return Consumer<LowestPriceData>(
      builder: (context, value , child){
        return value.map.length == 0 && !value.error ?
            const CircularProgressIndicator():
            value.error ? Text("Some thing wrong ${value.errorMessage}") :
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Container(
                width: width,
                height: height,
                child: Column(
                  children: [
                    Stack(
                      alignment: Alignment.topLeft,
                      children: [
                        Image.asset(AppAssets.egypt),
                        Padding(
                          padding: EdgeInsets.only(
                            top: SizeConfig.padding / 2,
                            left: SizeConfig.padding / 2,
                            right: SizeConfig.padding / 2,
                          ),
                          child: favoriteIcon(),
                        ),
                      ],
                    ),
                    productDetails(value),
                  ],
                ),
              ),
            );
      },
    );
  }

  Widget favoriteIcon() {
    return Container(
        width: SizeConfig.safeBlockHorizontal * 10,
        height: SizeConfig.safeBlockVertical * 10,
        decoration: BoxDecoration(
            shape: BoxShape.circle, color: Colors.white.withOpacity(.6)),
        child: Icon(
          Icons.favorite_border,
          size: SizeConfig.iconSizeSmall,
          color: Colors.grey,
        ));
  }

  Widget productDetails(LowestPriceData data) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(
              top: SizeConfig.padding,
              right: SizeConfig.padding,
              bottom: SizeConfig.padding / 2),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                decoration: const BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(5),
                        bottomRight: Radius.circular(5))),
                child: Padding(
                  padding: EdgeInsets.only(
                      right: SizeConfig.padding / 2,
                      left: SizeConfig.padding / 2),
                  child: Text(
                    data.map['type']['name'].toString(),
                    style: const TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
               Text(
                  data.map['status'].toString(),
                style: const TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
              left: SizeConfig.padding,
              right: SizeConfig.padding,
              bottom: SizeConfig.padding / 2),
          child: Text(
            data.map['content'].toString(),
            textAlign: TextAlign.end,
            style:const TextStyle(
              fontSize: 15,
              color: Colors.lightBlueAccent,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
              left: SizeConfig.padding,
              right: SizeConfig.padding,
              bottom: SizeConfig.padding / 2),
          child:  Text(
            data.map['price'].toString(),
            textAlign: TextAlign.end,
            style:const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
              left: SizeConfig.padding, right: SizeConfig.padding , bottom: SizeConfig.padding),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
               Text(
                  data.map['address'].toString(),
                textAlign: TextAlign.end,
                style:const TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                ),
              ),
              SizedBox(
                width: SizeConfig.padding / 2,
              ),
              Image.asset(
                AppAssets.location,
                scale: 2,
              ),
            ],
          ),
        ),
        Padding(
          padding:  EdgeInsets.only(
              left: SizeConfig.padding, right: SizeConfig.padding),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
          data.map['bedrooms'].toString(),
                    style: const TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                    ),
                  ),
                  Image.asset(
                    AppAssets.bed,
                    scale: 2,
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    data.map['bathrooms'].toString(),
                    style:const TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                    ),
                  ),
                  Image.asset(
                    AppAssets.bath,
                    scale: 2,
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    data.map['size'].toString(),
                    style:const TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                    ),
                  ),
                  Image.asset(
                    AppAssets.space,
                    scale: 2,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
