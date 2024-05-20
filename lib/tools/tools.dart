part of 'core.dart';

toRPage(String name, {dynamic argument, bool preventDuplicates = true}) {
  route.navigateToPushReplacement(name, argument,
      preventDuplicates: preventDuplicates);
}

toCPage(String name, {dynamic argument}) {
  route.navigateToPushAndRemoveUntil(name, argument);
}

toPage(String name,
    {dynamic argument, Function? then, bool preventDuplicates = true}) {
  route.navigateToPush(name, argument, then,
      preventDuplicates: preventDuplicates);
}

pop([dynamic data]) {
  route.navigatePop(data);
}

toMain({bool isIntro = false, bool isForce = false}) {
  var page = "/home";

  // if (!isForce) {
  // try {
  // final MainController mainController = Get.find();
  // if (isIntro) mainController.doneIntro();
  // if (!mainController.showIntro()) {
  //   page = "/intro";
  // } else
  // if (!mainController.isUserLogin()) {
  // page = "/login";
  // }
  // } catch (e) {
  // page = "/login";
  // }
  // }
  Get.offAndToNamed(page);
}

bool isPhone(String tel) {
  if (tel.length == 11 && isNumeric(tel)) {
    return true;
  }
  return false;
}

bool isNumeric(String? s) {
  if (s == null) {
    return false;
  }
  return double.tryParse(s) != null;
}

bool isUrl(String url) {
  return Uri.parse(url).isAbsolute;
}

// extension Jalali2 on Jalali {
//   String toStr() {
//     var f = formatter;
//     return "${f.yyyy}/${f.mm}/${f.dd}";
//   }

//   Jalali fromString(String txt) {
//     List<int> s = [];
//     if (txt.contains("/")) {
//       s = txt.split("/").map((e) => int.parse(e)).toList();
//     } else if (txt.contains("-")) {
//       s = txt.split("-").map((e) => int.parse(e)).toList();
//     } else {
//       return Jalali.now();
//     }

//     return Jalali(s[0], s[1], s[2]);
//   }

//   String cDate([int type = 1]) {
//     return toDateTime().cDate(type);
//   }
// }

// extension MDateTime on DateTime {
//   DateTime addDays(days) =>
//       Jalali.fromDateTime(this).addDays(days).toDateTime();

//   String toDate() => dateTimeFormatter.format(this);
//   Jalali toJalali() => Jalali.fromDateTime(this);

//   String formatter(String format) => DateFormat(format).format(this);
//   int getTimeDuration() {
//     return Duration(hours: hour, minutes: minute).inMinutes;
//   }

//   String cDate([int type = 1]) {
//     var c = Jalali.fromDateTime(this);
//     final f = c.formatter;

//     switch (type) {
//       case 1:
//         return '${f.wN} ${f.d} ${f.mN} ${f.yy}';
//       case 2:
//         return '${f.d} ${f.mN}';
//       case 3:
//         return '${f.mN} ${f.yy}';
//       case 4:
//         return '${f.wN} ${f.d} ${f.mN} ${f.yyyy}';
//       case 5:
//         return '${f.wN} ${f.d} ${f.mN} ${f.yyyy} ساعت $hour:$minute';
//       case 6:
//         return '${f.wN} ${f.d} ${f.mN} ${f.yyyy} - $hour:$minute';
//       case 7:
//         return '${f.yyyy}-${f.mm}-${f.dd}';
//       case 8:
//         return '${f.yyyy}/${f.mm}/${f.dd}';
//       default:
//         return '${f.wN} ${f.d} ${f.mN} ${f.yy}';
//     }
//   }
// }

extension MyStringExtension on String {
  int toNumber(String seprator) => int.parse(replaceAll(seprator, ""));
  Color get statusColor => this == "success"
      ? AppColors.success
      : AppColors.warning.withOpacity(this == "secondary" ? .5 : 1);
  String get toCurrency {
    var n = int.tryParse(this) ?? 0;
    return n.toCurrency;
  }

  String get fromCurrency => replaceAll(",", "");
}

extension MyIntExtension on int {
  String get toCurrency {
    var cf = NumberFormat('###,###', 'en_US');
    return cf.format(this);
  }
}

extension MyDoubleExtension on double {
  String get toCurrency {
    // var cf = NumberFormat('###,###', 'en_US');
    // return cf.format(this);
    return NumberFormat().format(this);
  }
}

// Jalali jalaliParse(String txt) {
//   var s = txt.split("/").map((e) => int.parse(e)).toList();
//   return Jalali(s[0], s[1], s[2]);
// }

wrapWB(void Function(Duration) f) {
  WidgetsBinding.instance.addPostFrameCallback(f);
}

String t1tl(String t, int l) {
  return t.length < l ? t1tl('0$t', l) : t;
}

class ShowMSG {
  static error(String title, String msg) {
    Get.snackbar(
      title,
      msg,
      animationDuration: const Duration(milliseconds: 400),
      duration: const Duration(seconds: 3),
      backgroundColor: Colors.red,
    );
  }

  static warning(String title, String msg) {
    Get.snackbar(
      title,
      msg,
      animationDuration: const Duration(milliseconds: 400),
      duration: const Duration(seconds: 3),
      backgroundColor: Colors.orange,
    );
  }

  static info(String title, String msg) {
    Get.snackbar(
      title,
      msg,
      animationDuration: const Duration(milliseconds: 400),
      duration: const Duration(seconds: 3),
    );
  }

  static fromResponse(ResponseModel response) {
    Get.snackbar(
      response.isSuccess ? "موفق" : "خطا",
      response.message,
      animationDuration: const Duration(milliseconds: 400),
      duration: const Duration(seconds: 3),
    );
  }

  static errorWithButton(
      {String title = "",
      String msg = "",
      required Widget btn,
      Function? onClose}) {
    Get.showSnackbar(
      GetSnackBar(
        title: title,
        message: msg == "" ? "بروز خطا" : msg,
        isDismissible: false,
        animationDuration: const Duration(milliseconds: 400),
        mainButton: btn,
        snackPosition: SnackPosition.BOTTOM,
      ),
    ).future.then((_) {
      onClose!.call();
    });
    // return Get.snackbar(
    //   title,
    //   msg,
    //   animationDuration: Duration(milliseconds: 400),
    //   // backgroundColor: Colors.black54,
    //   mainButton: btn,
    //   isDismissible: false,
    //   snackPosition: SnackPosition.BOTTOM,
    // );
  }

  static showBar(GetSnackBar bar) {
    Get.showSnackbar(bar);
  }

  GetSnackBar snackBarWidget(
      {String title = "", String msg = "", required Widget btn}) {
    return GetSnackBar(
      title: title,
      message: msg,
      isDismissible: false,
      animationDuration: const Duration(milliseconds: 400),
      mainButton: btn,
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}

final DateFormat dateTimeFormatter = DateFormat('yyyy-MM-dd');

Widget simpleLoading([Color color = AppColors.primary]) {
  return Center(
    child: loading(color),
  );
}

Widget loading([Color color = AppColors.primary]) {
  return CircularProgressIndicator(
    color: color,
  );
}

Widget simpleEmptyBox({
  VoidCallback? onPressed,
  String title = "مقداری یافت نشد",
  String buttonText = "",
  String subtitle = "",
  String image = "",
}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.end,
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      if (image != "") Expanded(child: Image.asset(image)),
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: AppTextStyles.headline1,
        ),
      ),
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Text(
          subtitle,
          textAlign: TextAlign.center,
        ),
      ),
      const SizedBox(height: 10),
      if (onPressed != null)
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ElevatedButton(onPressed: onPressed, child: Text(buttonText)),
        ),
      const SizedBox(height: 30),
    ],
  );
}

Widget simpleButtonLoading() {
  return const ElevatedButton(
    onPressed: null,
    child: SizedBox(
      height: 26,
      child: Center(
        child: CircularProgressIndicator(
          backgroundColor: Colors.transparent,
        ),
      ),
    ),
  );
}

String getFontUri(ByteData data, String mime) {
  final buffer = data.buffer;
  return Uri.dataFromBytes(
          buffer.asUint8List(data.offsetInBytes, data.lengthInBytes),
          mimeType: mime)
      .toString();
}

Future<String> addFontToHtml(
    String htmlContent, String fontAssetPath, String fontMime) async {
  final fontData = await rootBundle.load(fontAssetPath);
  final fontUri = getFontUri(fontData, fontMime).toString();
  final fontCss =
      '@font-face { font-family: customFont; src: url($fontUri); } * {direction:rtl;text-align:right;font-family: customFont!important; }';
  return '<style>$fontCss</style>$htmlContent';
}

Future<Uri> getUriFromString(String html) async {
  String completeHtml =
      await addFontToHtml(html, "assets/fonts/IRANSansWeb.woff", "font/woff");

  return Uri.dataFromString(completeHtml,
      mimeType: 'text/html', encoding: Encoding.getByName('utf-8'));
}

lostFocus(BuildContext context) {
  FocusScope.of(context).requestFocus(FocusNode());
}

launchURL(String url) async {
  Uri uri = Uri.parse(url);
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  } else {
    throw 'Could not launch $url';
  }
}

openGoogleDirection(
    {required String mapx, required String mapy, required String title}) {
  var uri =
      Uri.parse("https://maps.google.com/maps?f=s&hl=fa&daddr=$mapx,$mapy");
  launchURL(uri.toString());
}

openGoogleMap({
  required double latitude,
  required double longitude,
  required String title,
}) {
  String googleUrl = 'https://maps.google.com/?q=$latitude,$longitude';
  var uri = Uri.parse(googleUrl);

  launchURL(uri.toString());
}

List<int> minutesToHM(int minutes) {
  final int hour = minutes ~/ 60;
  final int m = minutes % 60;
  return [hour, m];
}

int stringTimeToMinutes(String time) {
  try {
    List<String> parts = time.split(':');
    return ((int.parse(parts[0]) * 60) + int.parse(parts[1]));
  } catch (e) {
    //sss
  }
  return 0;
}

// void shareApp() {
//   var body = "برنامه $appName";
//   Share.share('$body\n${ServerConfig.urlMain}');
// }

String dTS(int minutes) {
  var d = Duration(minutes: minutes);
  List<String> parts = d.toString().split(':');
  return '${parts[0]}:${parts[1]}';
}

String durationToMS(Duration d) {
  List<String> parts = d.toString().split(':');
  return '${parts[1]}:${parts[2].split('.')[0]}';
}

String getWDbyIndex(int index, [bool isShort = true]) {
  String r = "خالی";
  switch (index) {
    case 0:
      r = "شنبه";
      break;
    case 1:
      r = "یکشنبه";
      break;
    case 2:
      r = "دوشنبه";
      break;
    case 3:
      r = "سه شنبه";
      break;
    case 4:
      r = "چهار شنبه";
      break;
    case 5:
      r = "پنج شنبه";
      break;
    case 6:
      r = "جمعه";
      break;
    default:
      r = "خالی";
  }

  return isShort ? r[0] : r;
}

int timeStringToMin(String t) {
  List<String> parts = t.split(':');
  return ((int.parse(parts[0]) * 60) + int.parse(parts[1]));
}

String toENGNumber(String txt) {
  return txt
      .replaceAll("۱", "1")
      .replaceAll("۲", "2")
      .replaceAll("۳", "3")
      .replaceAll("۴", "4")
      .replaceAll("۵", "5")
      .replaceAll("۶", "6")
      .replaceAll("۷", "7")
      .replaceAll("۸", "8")
      .replaceAll("۹", "9")
      .replaceAll("۰", "0");
}

DateTime dateZeroTime(DateTime date) {
  return DateTime(date.year, date.month, date.day);
}

String toCurrency(number) {
  if (number is double) {
    // return NumberFormat.decimalPattern().format(number);
  }
  return NumberFormat().format(number);
}

int selectionIndexFromTheRight(int nvLength, int nvOffset, int nsLength) =>
    nsLength - (nvLength - nvOffset);

TextSelection getTextSelection(int p) => TextSelection.collapsed(offset: p);

// printError(dynamic val) {
//   loggerNoStack.e(val);
// }

Color colorByState(int state) {
  switch (state) {
    case -1:
      return AppColors.red;
    case 1:
      return AppColors.green;
    case 2:
      return AppColors.primary;
    default:
      return AppColors.green;
  }
}

bool resultChecker(dynamic v) {
  if (v is bool) {
    return v;
  }
  return false;
}
