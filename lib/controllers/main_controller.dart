import 'dart:io';

import 'package:drtest/service/service_generator.dart';
import 'package:drtest/tools/core.dart';
import 'package:drtest/views/public/toc_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/public/login_model.dart';
import '../models/public/main_model.dart';
import '../models/public/response_model.dart';
import '../models/user/user_model.dart';
import '../response/public/dashboard_response.dart';
import '../response/public/main_response.dart';

import "package:universal_html/html.dart" as html;

class MainController extends GetxController {
  var isSplashReady = false;
  bool isInit = false, isInitRunning = false;

  String buildVersion = "1.0";
  String appVersion = "1";

  String token = "";
  Directory? tempDir;

  late PackageInfo packageInfo;
  late SharedPreferences prefs;

  // double spScale = 1.3333333333;
  late ServiceGenerator apiService;

  var headers = {
    "accept": 'application/json',
    "content-type": 'application/json; charset=UTF-8',
    "authorization": "Bearer ",
  }.obs;

  @override
  onInit() async {
    super.onInit();
    await init();
  }

  bool get termsChecked => mainResponse.content!.termsChecked;
  set termsChecked(bool v) =>
      _mainResponseObs.update((val) => val!.content!.termsChecked = v);

  final _mainResponseObs = MainResponse().obs;
  MainResponse get mainResponse => _mainResponseObs.value;
  set mainResponse(MainResponse val) => _mainResponseObs.value = val;

  bool get isloading => mainResponse.isLoading;
  set isloading(bool v) => _mainResponseObs.update((val) => val!.isLoading = v);

  UserModel get user => mainResponse.content!.user;
  bool get avatarLoading => user.avatarLoading;
  set avatarLoading(bool v) =>
      _mainResponseObs.update((val) => val!.content!.user.avatarLoading = v);

  Future<bool> init() async {
    if (isInitRunning) return false;
    if (isInit) return isInit;
    isInitRunning = true;

    prefs = await SharedPreferences.getInstance();
    await prefs.reload();

    fillUserToken();

    mainResponse.content = MainModel(user: UserModel(token: token));

    apiService = ServiceGenerator();
    apiService.updateDio(headers);

    packageInfo = await PackageInfo.fromPlatform();

    appVersion = packageInfo.version;
    buildVersion = packageInfo.buildNumber;

    termsChecked = prefs.getBool("termsChecked") ?? false;

    if (kIsWeb) {
      var localVersion = prefs.getString("buildVersion");
      if (localVersion != null && localVersion != buildVersion) {
        // Clear cache
        html.window.localStorage.clear();
        html.window.sessionStorage.clear();
        // Reload page
        html.window.location.reload();
        // return;
      }
      prefs.setString("appVersion", appVersion);
      prefs.setString("buildVersion", buildVersion);
    }
    isInit = true;
    isInitRunning = false;
    return true;
  }

  Future<BaseModel<LoginModel>> getSplash() async {
    isloading = true;
    // await init();
    var response = await apiService.splash();
    if (response.statusCode == 401) {
      clearUser();
    } else if (response.isSuccess && response.content != null) {
      fillData(response.content!);
      termsChecked = prefs.getBool("termsChecked") ?? false;
    }
    isloading = false;
    return response;
  }

  bool isUserLogin() {
    return token.isNotEmpty;
  }

  String? getToken() {
    // return "";
    return prefs.getString("token");
  }

  updateToken(String? t) {
    try {
      t ??= '';
      t = t.replaceAll("Bearer ", "");
      headers["authorization"] = "Bearer $t";
      prefs.setString("token", t);
      token = t;
    } catch (e) {
      // loggerNoStack.e(e);
    }
  }

  fillUserToken() {
    updateToken(getToken());
  }

  clearUser() {
    updateToken('');
    _mainResponseObs.update((val) => val!.content!.user = UserModel());
  }

  void doneIntro() {
    prefs.setBool("intro", true);
  }

  bool showIntro() {
    var intro = prefs.getBool("intro");
    return intro ?? false;
  }

  bool isUserFilledProfile() {
    if (user.name == "") return false;

    return true;
  }

  //Change Localization
  // void setLocalization(String languageCode, String countryCode) {
  //   prefs.setString("languageCode", languageCode);
  //   prefs.setString("countryCode", countryCode);
  //   submitLocalization();
  // }

  void fillData(LoginModel data) {
    _mainResponseObs.update((val) {
      val!.content = MainModel(
        user: UserModel(
          name: data.name,
          phone: data.phoneNumber,
          token: data.token,
        ),
      );
    });
    if (data.token != "") updateToken(data.token);
  }

  // void submitLocalization() {
  //   var languageCode = prefs.getString("languageCode");
  //   var countryCode = prefs.getString("countryCode");
  //   if (languageCode == null || countryCode == null) {
  //     setLocalization("fa", "IR");
  //     languageCode = "fa";
  //     countryCode = "IR";
  //   }
  //   Get.updateLocale(Locale(languageCode, countryCode));
  // }

  final _pages = PageIndexResponse().obs;

  List<PageIndexModel> get pages => _pages.value.pages;
  PageIndexModel get currentPage => _pages.value.current;
  int get tabIndex => _pages.value.selectedIndex;
  set tabIndex(int v) => _pages.update((val) => val!.selectedIndex = v);

  void initDashboard() {
    if (pages.isNotEmpty) {
      return;
    }
    _pages.value = PageIndexResponse(pages: [
      PageIndexModel(
        index: 0,
        title: "Home",
        appbarTitle: appName,
        icon: "home.png",
        page: DashboardScreen(),
        count: 0,
      ),
      PageIndexModel(
        index: 1,
        title: "Abbr",
        appbarTitle: appName,
        icon: "abbr.png",
        page: AbbreviationsScreen(),
        count: 0,
      ),
      PageIndexModel(
        index: 2,
        title: "Contents",
        appbarTitle: appName,
        icon: "contents.png",
        page: TocScreen(),
        count: 0,
      ),
      PageIndexModel(
        index: 3,
        title: "Contact",
        appbarTitle: appName,
        icon: "contactUS.png",
        page: const ContactusScreen(),
        count: 0,
      ),
      PageIndexModel(
        index: 4,
        title: "About",
        appbarTitle: appName,
        icon: "aboutUS.png",
        page: const AboutUsScreen(),
        count: 0,
      ),
    ]);
  }
}
