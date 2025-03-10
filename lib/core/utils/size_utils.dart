

import 'package:flutter/material.dart';

const num FIGMA_DESIGN_WIDTH=375;
const num FIGMA_DESIGN_HEIGHT=812;
const num FIGMA_DESIGN_STATUS_BAR=0;

extension ResponsiveExtenstion on num{
  double get _with => SizeUtils.width;
}

 enum DeviceType{mobile,tablet,desktop}

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
      width=boxConstraints.maxWidth.isNonZero
    }
  }
}