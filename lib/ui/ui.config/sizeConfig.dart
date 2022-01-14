import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class SizeConfig {
    static double screenWidth = 0;
    static double screenHeight = 0;

    static double textMultiplier =0;
    static double imageSizeMultiplier =0;
    static double heightMultiplier = 0;
    static double widthMultiplier= 0;
    static bool isPortrait = true;
    static bool isMobilePortrait = false;
    
    void init(BoxConstraints constraints, Orientation orientation) {

        if (orientation == Orientation.portrait) {
            screenWidth = constraints.maxWidth;
            screenHeight = constraints.maxHeight;
            isPortrait = true;

        } else {
            screenWidth = constraints.maxHeight;
            screenHeight = constraints.maxWidth;
            isPortrait = false;
            isMobilePortrait = false;
        }

    }
}