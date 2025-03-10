

import 'package:flutter/material.dart';

const num FIGMA_DESIGN_WIDTH=375;
const num FIGMA_DESIGN_HEIGHT=812;
const num FIGMA_DESIGN_STATUS_BAR=0;

extension ResponsiveExtenstion on num{
  double get _with => SizeUtils.width;
  double get h => ((this * _with)/FIGMA_DESIGN_WIDTH);
  double get fSize => ((this*_with)/FIGMA_DESIGN_WIDTH);
}

extension FormatExtension on double{
  double? toDoubleValue({int factionDigits=2}){
    return double.tryParse(this.toStringAsFixed(factionDigits));
  }

  double isNonZero({num defaultvalue=0.0}){
    return this > 0 ? this : defaultvalue.toDouble();
  }
}


 enum DeviceType{mobile,tablet,desktop}

typedef ResponsiveBuild = Widget Function(
  BuildContext context, Orientation orientation,DeviceType deviceType
);

class Sizer extends StatelessWidget{
  const Sizer({super.key,required this.builder});
  final ResponsiveBuild builder;
  @override
  Widget build(BuildContext context){
    return LayoutBuilder(builder: (context,constraints){
      return OrientationBuilder(builder: (context,orientation){
        SizeUtils.setScreenSize(constraints, orientation);
        return builder(context,orientation,SizeUtils.deviceType);
      });
    });
  }  
}

class SizeUtils{
  static late BoxConstraints boxConstraints;
  static late Orientation orientation;
  static late DeviceType deviceType;
  static late double height;
  static late double width;

  static void setScreenSize(
    BoxConstraints constraints,
    Orientation currentOrientation
  ){
    boxConstraints=constraints;
    orientation=currentOrientation;
    if(orientation==Orientation.portrait){
      width=boxConstraints.maxWidth.isNonZero(defaultvalue: FIGMA_DESIGN_WIDTH);
      height=boxConstraints.maxHeight.isNonZero();
    } else{
      width=boxConstraints.maxHeight.isNonZero(defaultvalue: FIGMA_DESIGN_WIDTH);
      height=boxConstraints.maxWidth.isNonZero();
    }
    deviceType=DeviceType.mobile;
  }
}