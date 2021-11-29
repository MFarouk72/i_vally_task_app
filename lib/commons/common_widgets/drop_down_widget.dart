import 'package:flutter/material.dart';
import 'package:i_vally_task_app/utilites/size_config.dart';

class DropdownWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      width: SizeConfig.blockSizeHorizontal*30,
      height: SizeConfig.blockSizeVertical *6,
      padding: EdgeInsets.only(right: SizeConfig.padding),
      child: DropdownButtonFormField(
        value: 'للبيع',
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: SizeConfig.textFontSize,
        ),
        decoration: const InputDecoration(
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
              borderRadius: BorderRadius.only(topRight: Radius.circular(10),bottomRight:Radius.circular(10) )
          ),
          focusedBorder:OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.only(topRight: Radius.circular(10),bottomRight:Radius.circular(10) ),
          ),
          enabledBorder:UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius:  BorderRadius.only(topRight: Radius.circular(10),bottomRight:Radius.circular(10) ),
          ),
        ),
        items:<String>['للبيع', 'للشراء'].map((e) {
          return DropdownMenuItem<String>(
              value: e,
              child: Text(e));
        }).toList(),
        onChanged: (value) {
        },
      ),
    );
  }
}


