// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:parkmanager/utils/constants/constant_strings.dart';
import 'constants/constant_colors.dart';

class AppTheme {
  static final lightTheme = ThemeData.light().copyWith(
    // brightness: Brightness.light,
    listTileTheme: ListTileThemeData(
        textColor: Colors.black,
        style: ListTileStyle.drawer,
        iconColor: Colors.black),
    appBarTheme: AppBarTheme(
      titleSpacing: 0,
      elevation: 0,
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
      titleTextStyle: TextStyle(
        fontFamily: ConstantString.policeApp,
        color: Colors.black,
      ),
    ),

    bottomAppBarTheme: BottomAppBarTheme(
      color: Colors.white,
    ),
    colorScheme: const ColorScheme.light().copyWith(
      primary: ConstantColors.primaryColor,
      secondary: ConstantColors.primaryColor,
      onPrimary: Colors.white,
    ),
    inputDecorationTheme: InputDecorationTheme(
      isDense: true, // this will remove the default content padding
      // now you can customize it here or add padding widget
      contentPadding: EdgeInsets.symmetric(horizontal: 0, vertical: 4),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: ConstantColors.primaryColor,
      foregroundColor: Colors.white,
    ),
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: Colors.transparent,
    ),
    radioTheme: RadioThemeData(
      fillColor: MaterialStateProperty.all(ConstantColors.primaryColor),
    ),
    tabBarTheme: TabBarTheme(
      indicator: UnderlineTabIndicator(
        borderSide: BorderSide(
          color: ConstantColors.primaryColor,
          width: 2,
        ),
      ),
      labelColor: ConstantColors.primaryColor,
      unselectedLabelColor: Colors.black,
      labelStyle: TextStyle(
        color: ConstantColors.primaryColor,
        fontFamily: ConstantString.policeApp,
        fontWeight: FontWeight.w700,
        fontSize: 15,
      ),
      unselectedLabelStyle: TextStyle(
        color: ConstantColors.primaryColor,
        fontFamily: ConstantString.policeApp,
        fontWeight: FontWeight.w400,
        fontSize: 15,
      ),
    ),
    dialogTheme: DialogTheme(
      contentTextStyle: TextStyle(
        color: Colors.black,
        fontFamily: ConstantString.policeApp,
        fontSize: 20,
      ),
      titleTextStyle: TextStyle(
        color: Colors.black,
        fontFamily: ConstantString.policeApp,
        fontSize: 20,
      ),
    ),
    cardTheme: CardTheme(color: Colors.white),
    shadowColor: Colors.grey.withOpacity(0.1),
    textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
      textStyle: MaterialStateProperty.all(
        TextStyle(
          fontFamily: ConstantString.policeApp,
          fontWeight: FontWeight.w500,
          color: ConstantColors.primaryColor,
          fontSize: 16,
        ),
      ),
    )),
    textTheme: TextTheme(
      titleMedium: TextStyle(
        fontSize: 16,
        color: Colors.black,
        fontWeight: FontWeight.w300,
      ),
      displayLarge: TextStyle(
        fontFamily: ConstantString.policeApp,
        // fontWeight: FontWeight.bold,
        fontSize: 25,
        color: Colors.black,
      ),
      displayMedium: TextStyle(
        fontFamily: ConstantString.policeApp,
        // fontWeight: FontWeight.bold,
        fontSize: 20,
        color: Colors.black,
      ),
      titleLarge: TextStyle(
        fontFamily: ConstantString.policeApp,
        // fontWeight: FontWeight.bold,
        fontSize: 20,
        color: Colors.black,
      ),
      bodyLarge: TextStyle(
        fontFamily: ConstantString.policeApp,
        fontSize: 13,
        color: Colors.black,
      ),
      bodyMedium: TextStyle(
        fontFamily: ConstantString.policeApp,
        color: Colors.black,
      ),
    ),
  );
}
