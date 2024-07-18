part of 'core.dart';

// enum AppConfig {
//   ryanex,
//   alshams,
//   tabdil,
//   local,
//   demo,
//   demo2,
// }

// AppConfig _currentApp = AppConfig.ryanex;
String get appName => _getAppName();

String _getAppName() {
  return "ACAFiB";
  // switch (_currentApp) {
  //   case AppConfig.ryanex:
  //     return "رایانکس";
  //   case AppConfig.alshams:
  //     return "الشمس";
  //   case AppConfig.tabdil:
  //     return "تبدیل";
  //   case AppConfig.demo:
  //     return "تبدیل";
  //   case AppConfig.demo2:
  //     return "تبدیل";
  //   default:
  //     return "local";
  // }
}

String get urlBaseApi => "https://${getApiHost()}/api/admin";

String getApiHost() {
  return "localhost:7214";
  // switch (_currentApp) {
  //   case AppConfig.ryanex:
  //     return "panel.ryanex.ae";
  //   case AppConfig.alshams:
  //     return "panel.alshams.co";
  //   case AppConfig.tabdil:
  //     return "panel.tabdil.co";
  //   case AppConfig.demo:
  //     return "panel.tabdil.co";
  //   case AppConfig.demo2:
  //     return "panel2.tabdil.co";
  //   default:
  //     return "localhost:7264";
  // }
}

// final MainController _mainController = Get.find();

extension PtToPx on num {
  double get toPx => (this) * 1.333;
}

String imagePath(String image) => "assets/images/$image";
String iconPath(String image) => "assets/icons/$image";

class AppConst {
  static const EdgeInsets defaultPadding =
      EdgeInsets.symmetric(horizontal: 15, vertical: 10);
  static const EdgeInsets widgetPadding = EdgeInsets.only(bottom: 10);
  static const EdgeInsetsGeometry buttonPadding =
      EdgeInsets.only(top: 10, bottom: 10, left: 10, right: 10);
  static final ShapeBorder buttonShape1 = RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(5.0),
    // side: BorderSide(color: Colors.red)
  );

  static final OutlinedBorder buttonShape2 = RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(25),
  );
}

class AppColors {
  static const Color backgroundColor = Color(0xff1b1b1b);
  static const Color primary = Color(0xff48ff91);
  static const Color primaryLight = Color(0xff6e3fff);
  static const Color pink = Color.fromRGBO(255, 237, 237, 1.0);
  static const Color black = Colors.black;
  static const Color darkGray = Color.fromRGBO(108, 108, 108, 1.0);
  static const Color gray = Color(0xff979797);
  static const Color grayPrimary = Color(0xff9ea6be);
  static const Color lightGray = Color.fromARGB(255, 206, 206, 206);
  static const Color white2 = Color.fromRGBO(255, 255, 255, 1.0);
  static const Color white = Color(0xffeaeaea);
  static const Color textColor = Color(0xffeaeaea);
  static const Color textColor1 = Color(0xffeaeaec);
  static const Color textColor2 = Color(0xff858e9d);
  static const Color textColor3 = Color(0xff858d97);
  static const Color textColor4 = Color(0xff48ff91);
  static const Color buttonText = Color(0xff102117);
  static const Color buttonBackground = Color(0xff48ff91);
  static const Color buttonBackground2 = Color(0xff272727);
  static const Color background = Color(0xff1b1b1b);
  static const Color orange = Color.fromRGBO(255, 168, 37, 1.0);
  static const Color green = Color(0xff05A95C);
  static const Color green3 = Color(0xff77eb74);
  static const Color shadow =
      Color.fromRGBO(164, 189, 214, 0.30196078431372547);
  static const Color warning = Color(0xfff1b90c);
  static const Color success = Color(0xff46BD84);
  static const Color blue = Color.fromARGB(255, 33, 97, 216);
  static const Color red = Color(0xffea0606);
  static const Color secondary = Color(0xff000000);
  static const Color green2 = Color(0xff0d4b28);
  static const purple = Color.fromARGB(255, 169, 14, 216);
  static const yellow = Color.fromARGB(255, 221, 241, 106);
  static const yellowBackground = Color(0xff262219);
  static const blue2 = Color.fromARGB(255, 69, 207, 241);

}

class AppThemes {
  static final OutlineInputBorder inputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(5),
    borderSide: const BorderSide(color: AppColors.buttonBackground, width: 2),
  );

  static final OutlineInputBorder enabledBorder = inputBorder.copyWith(
    borderSide: const BorderSide(color: AppColors.gray),
  );
  static final OutlineInputBorder border = inputBorder.copyWith(
    borderSide: const BorderSide(color: AppColors.gray),
  );
  static final OutlineInputBorder errorBorder = inputBorder.copyWith(
    borderSide: const BorderSide(color: AppColors.red),
  );

  static final UnderlineInputBorder inputBorder2 = UnderlineInputBorder(
    borderRadius: BorderRadius.circular(5),
    borderSide: const BorderSide(color: AppColors.buttonBackground, width: 2),
  );

  static final UnderlineInputBorder enabledBorder2 = inputBorder2.copyWith(
    borderSide: const BorderSide(color: AppColors.gray),
  );
  static final UnderlineInputBorder border2 = inputBorder2.copyWith(
    borderSide: const BorderSide(color: AppColors.gray),
  );
  static final UnderlineInputBorder errorBorder2 = inputBorder2.copyWith(
    borderSide: const BorderSide(color: AppColors.red),
  );

  static final InputDecorationTheme inputDecorationTheme = InputDecorationTheme(
    contentPadding: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
    hintStyle: AppTextStyles.text1,
    filled: true,
    fillColor: Colors.white,
    hoverColor: Colors.white,
    border: border,
    focusColor: AppColors.buttonBackground,
    suffixStyle: AppTextStyles.base.copyWith(color: Colors.green),
  );

  static ThemeData defaultTheme = ThemeData(
    dividerColor: Colors.transparent,
    primaryColor: AppColors.primary,
    hintColor: AppColors.gray,
    fontFamily: AppTextStyles.fontFamily,
    // scaffoldBackgroundColor: AppColors.backgroundColor,
    inputDecorationTheme: inputDecorationTheme,
    appBarTheme: AppBarTheme(
      actionsIconTheme: const IconThemeData(color: AppColors.primary),
      centerTitle: true,
      shadowColor: Colors.transparent,
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      backgroundColor: AppColors.background,
      iconTheme: const IconThemeData(color: AppColors.white),
      titleTextStyle: AppTextStyles.appbarTitle,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: AppColors.secondary,
        backgroundColor: AppColors.primary,
        disabledForegroundColor: AppColors.primary.withOpacity(.5),
        disabledBackgroundColor: AppColors.secondary.withOpacity(.5),
        padding: AppConst.buttonPadding,
        textStyle: AppTextStyles.buttonText,
        shape: AppConst.buttonShape2,
      ),
    ),
    // textButtonTheme: TextButtonThemeData(
    //     style: ButtonStyle(
    //   overlayColor:
    //       MaterialStateColor.resolveWith((states) => AppColors.primary),
    // )),
    bottomNavigationBarTheme:
        const BottomNavigationBarThemeData(backgroundColor: AppColors.primary),
    floatingActionButtonTheme:
        const FloatingActionButtonThemeData(backgroundColor: AppColors.primary),
    checkboxTheme: CheckboxThemeData(
      fillColor: WidgetStateProperty.all(Colors.transparent),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2)),
      side: const BorderSide(color: AppColors.white, width: 2),
      checkColor: WidgetStateProperty.all(AppColors.primary),
      materialTapTargetSize: MaterialTapTargetSize.padded,
    ),
    tooltipTheme: const TooltipThemeData(
        decoration: BoxDecoration(color: AppColors.primary)),
    textTheme: TextTheme(
      bodyLarge: AppTextStyles.text1,
      bodyMedium: AppTextStyles.text2,
      bodySmall: AppTextStyles.caption,
    ),
    colorScheme: const ColorScheme.dark(
      surface: AppColors.background,
    ),
  );
}

class AppTextStyles {
  static String fontFamily = kIsWeb ? "GeneralSansWeb" : "GeneralSans";
  static TextStyle base = TextStyle(fontFamily: fontFamily);
  static TextStyle title = base.copyWith(
      fontSize: 25.toPx,
      color: AppColors.textColor,
      fontWeight: FontWeight.w600);
  // static TextStyle headline2 = base.copyWith(
  //     fontSize: 24.toPx,
  //     color: AppColors.textColor,
  //     fontWeight: FontWeight.w700);
  // static TextStyle headline3 = base.copyWith(
  //     fontSize: 25.toPx,
  //     color: AppColors.textColor,
  //     fontWeight: FontWeight.w600);
  // static TextStyle headline4 = base.copyWith(
  //     fontSize: 16.toPx,
  //     color: AppColors.textColor,
  //     fontWeight: FontWeight.w600);
  // static TextStyle headline5 = base.copyWith(
  //     fontSize: 14.toPx,
  //     color: AppColors.textColor,
  //     fontWeight: FontWeight.w600);
  // static TextStyle headline6 = base.copyWith(
  //     fontSize: 12.toPx,
  //     color: AppColors.textColor,
  //     fontWeight: FontWeight.w600);
  // static TextStyle headline7 = base.copyWith(
  //     fontSize: 10.toPx,
  //     color: AppColors.textColor,
  //     fontWeight: FontWeight.w600);

  // static TextStyle subtitle1 = base.copyWith(
  //     fontSize: 14.toPx,
  //     color: AppColors.textColor,
  //     fontWeight: FontWeight.w500);
  // static TextStyle subtitle2 = base.copyWith(
  //     fontSize: 12.toPx,
  //     color: AppColors.textColor,
  //     fontWeight: FontWeight.w500);
  // static TextStyle subtitle3 = base.copyWith(
  //     fontSize: 11.toPx,
  //     color: AppColors.darkGray,
  //     fontWeight: FontWeight.w500);
  static TextStyle subtitleSmallLight = base.copyWith(
    color: AppColors.gray,
    fontSize: 10.toPx,
  );

  static TextStyle label = base.copyWith(
    color: AppColors.grayPrimary,
    fontSize: 12.toPx,
  );

  static TextStyle text1 = base.copyWith(
      fontSize: 15.toPx,
      color: AppColors.textColor1,
      fontWeight: FontWeight.w500);
  static TextStyle bodyTextLargePrimary =
      text1.copyWith(color: AppColors.primary);
  static TextStyle bodyTextLargeDark = text1.copyWith(color: AppColors.black);

  static TextStyle text2 = base.copyWith(
      fontSize: 15.toPx,
      color: AppColors.textColor2,
      fontWeight: FontWeight.w400);

  static TextStyle text3 = base.copyWith(
      fontSize: 15.toPx,
      color: AppColors.textColor1,
      fontWeight: FontWeight.w400);

  static TextStyle buttonText = base.copyWith(
      fontSize: 16.toPx,
      color: AppColors.buttonText,
      fontWeight: FontWeight.w500);

  static TextStyle bodyTextSmallPrimary =
      text3.copyWith(color: AppColors.primary);

  static TextStyle appbarTitle = base.copyWith(
      fontSize: 18.toPx,
      color: AppColors.textColor,
      fontWeight: FontWeight.w500);

  static TextStyle caption = base.copyWith(
      fontSize: 11.toPx,
      color: AppColors.textColor,
      fontWeight: FontWeight.w300);

  static TextStyle navbar0 = base.copyWith(
      fontSize: 14.toPx,
      color: AppColors.textColor,
      fontWeight: FontWeight.w400);

  static TextStyle navbar1 = base.copyWith(
      fontSize: 14.toPx,
      color: AppColors.textColor4,
      fontWeight: FontWeight.w400);
}
