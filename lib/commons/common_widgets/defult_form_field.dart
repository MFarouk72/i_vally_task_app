import 'package:flutter/material.dart';
import 'package:i_vally_task_app/utilites/size_config.dart';

class DefaultFormField extends StatelessWidget {
  final String? label;

  DefaultFormField({
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      width: SizeConfig.blockSizeHorizontal * 70,
      height: SizeConfig.blockSizeVertical*8,
      padding: EdgeInsets.only(
          left: SizeConfig.padding,
          right: SizeConfig.padding,
          top: SizeConfig.padding / 2,
          bottom: SizeConfig.padding / 2),
      child: TextFormField(
        textAlign: TextAlign.right,
        keyboardType: TextInputType.text,
        onChanged: (String input) {},
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.search , color: Colors.black,),
          filled: true,
          fillColor: Colors.white,
          hintText:label,
          hintStyle: TextStyle(
            color: Colors.red,
            fontWeight: FontWeight.w600,
            fontSize: SizeConfig.textFontSize,
          ),
          border: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.only(topLeft: Radius.circular(10),bottomLeft:Radius.circular(10) )
          ),
          focusedBorder:const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.only(topLeft: Radius.circular(10),bottomLeft:Radius.circular(10) ),
          ),
          enabledBorder:const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius:  BorderRadius.only(topLeft: Radius.circular(10),bottomLeft:Radius.circular(10) ),
          ),
        ),
      ),
    );
  }
}
