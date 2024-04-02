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
  return "GymTrainer";
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
    borderRadius: BorderRadius.circular(5.0),
  );
}

class AppColors {
  static const Color primary = Color(0xff7165e3);
  static const Color primaryLight = Color(0xff6e3fff);
  static const Color pink = Color.fromRGBO(255, 237, 237, 1.0);
  static const Color black = Colors.black;
  static const Color darkGray = Color.fromRGBO(108, 108, 108, 1.0);
  static const Color gray = Color(0xff979797);
  static const Color grayPrimary = Color(0xff9ea6be);
  static const Color lightGray = Color.fromARGB(255, 206, 206, 206);
  static const Color white = Color.fromRGBO(255, 255, 255, 1.0);
  static const Color background = Color.fromRGBO(30, 36, 41, 1);
  static const Color orange = Color.fromRGBO(255, 168, 37, 1.0);
  static const Color green = Color(0xff05A95C);
  static const Color green3 = Color(0xff77eb74);
  static const Color shadow =
      Color.fromRGBO(164, 189, 214, 0.30196078431372547);
  static const Color warning = Color(0xffFBA63C);
  static const Color success = Color(0xff46BD84);
  static const Color blue = Color(0xff17c1e8);
  static const Color red = Color(0xffea0606);
  static const Color secondary = Color(0xff000000);
  static const Color green2 = Color(0xff0d4b28);
  static const purple = Color(0xffA784FF);
  static const blue2 = Color(0xff0CC9DA);
}

class AppThemes {
  static final OutlineInputBorder inputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(5),
    borderSide: const BorderSide(color: AppColors.primary, width: 2),
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
    borderSide: const BorderSide(color: AppColors.primary, width: 2),
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
    hintStyle: AppTextStyles.bodyText1,
    filled: true,
    fillColor: Colors.white,
    hoverColor: Colors.white,
    border: border,
    focusColor: AppColors.primary,
    suffixStyle: AppTextStyles.base.copyWith(color: Colors.green),
  );

  static ThemeData defaultTheme = ThemeData(
    dividerColor: Colors.transparent,
    primaryColor: AppColors.primary,
    hintColor: AppColors.gray,
    fontFamily: 'IRANYekan',
    // scaffoldBackgroundColor: Colors.white,
    inputDecorationTheme: inputDecorationTheme,
    appBarTheme: AppBarTheme(
      actionsIconTheme: const IconThemeData(color: AppColors.primary),
      centerTitle: true,
      shadowColor: Colors.transparent,
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      backgroundColor: AppColors.background,
      iconTheme: const IconThemeData(color: AppColors.white),
      titleTextStyle: AppTextStyles.headline3
          .copyWith(fontFamily: 'IRANYekan', color: AppColors.white),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: AppColors.secondary,
        backgroundColor: AppColors.primary,
        disabledForegroundColor: AppColors.primary.withOpacity(.5),
        disabledBackgroundColor: AppColors.secondary.withOpacity(.5),
        padding: AppConst.buttonPadding,
        textStyle: AppTextStyles.headline4,
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
      fillColor: MaterialStateProperty.all(Colors.transparent),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2)),
      checkColor: MaterialStateProperty.all(AppColors.primary),
      side: const BorderSide(color: AppColors.gray),
      materialTapTargetSize: MaterialTapTargetSize.padded,
    ),
    tooltipTheme: const TooltipThemeData(
        decoration: BoxDecoration(color: AppColors.primary)),
    textTheme: TextTheme(
      displayLarge: AppTextStyles.headline1,
      displayMedium: AppTextStyles.headline2,
      displaySmall: AppTextStyles.headline3,
      headlineMedium: AppTextStyles.headline4,
      headlineSmall: AppTextStyles.headline5,
      titleLarge: AppTextStyles.headline6,
      titleMedium: AppTextStyles.subtitle1,
      titleSmall: AppTextStyles.subtitle2,
      bodyLarge: AppTextStyles.bodyText1,
      bodyMedium: AppTextStyles.bodyText2,
      bodySmall: AppTextStyles.caption,
    ),
    colorScheme: const ColorScheme.dark(
      background: AppColors.background,
    ),
  );
}

class AppTextStyles {
  static TextStyle base = const TextStyle(fontFamily: "IRANYekan");
  static TextStyle headline1 = base.copyWith(
      fontSize: 28, color: AppColors.white, fontWeight: FontWeight.w800);
  static TextStyle headline2 = base.copyWith(
      fontSize: 24, color: AppColors.white, fontWeight: FontWeight.w800);
  static TextStyle headline3 = base.copyWith(
      fontSize: 18, color: AppColors.white, fontWeight: FontWeight.w700);
  static TextStyle headline4 = base.copyWith(
      fontSize: 16, color: AppColors.white, fontWeight: FontWeight.w700);
  static TextStyle headline5 = base.copyWith(
      fontSize: 14, color: AppColors.white, fontWeight: FontWeight.w700);
  static TextStyle headline6 = base.copyWith(
      fontSize: 12, color: AppColors.white, fontWeight: FontWeight.w700);
  static TextStyle headline7 = base.copyWith(
      fontSize: 10, color: AppColors.white, fontWeight: FontWeight.w700);

  static TextStyle subtitle1 = base.copyWith(
      fontSize: 14, color: AppColors.white, fontWeight: FontWeight.w400);
  static TextStyle subtitle2 = base.copyWith(
      fontSize: 12, color: AppColors.white, fontWeight: FontWeight.w400);
  static TextStyle subtitle3 = base.copyWith(
      fontSize: 11, color: AppColors.darkGray, fontWeight: FontWeight.w400);
  static TextStyle subtitleSmallLight = base.copyWith(
    color: AppColors.gray,
    fontSize: 10,
  );
  static TextStyle label = base.copyWith(
    color: AppColors.grayPrimary,
    fontSize: 12,
  );

  static TextStyle bodyText1 = base.copyWith(
      fontSize: 16, color: AppColors.white, fontWeight: FontWeight.w400);
  static TextStyle bodyTextLargePrimary =
      bodyText1.copyWith(color: AppColors.primary);
  static TextStyle bodyTextLargeDark =
      bodyText1.copyWith(color: AppColors.black);

  static TextStyle bodyText2 = base.copyWith(
      fontSize: 14, color: AppColors.white, fontWeight: FontWeight.w400);

  static TextStyle bodyText3 = base.copyWith(
      fontSize: 12, color: AppColors.white, fontWeight: FontWeight.w400);
  static TextStyle bodyTextSmallPrimary =
      bodyText3.copyWith(color: AppColors.primary);

  static TextStyle caption = base.copyWith(
      fontSize: 10, color: AppColors.white, fontWeight: FontWeight.w400);
}
