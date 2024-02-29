import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../models/public/login_model.dart';
import '../models/public/main_model.dart';
import '../models/public/response_model.dart';
import '../models/user/user_model.dart';
import '../response/public/dashboard_response.dart';
import '../response/public/main_response.dart';
import '../service/service_generator.dart';
import '../tools/core.dart';
import '../tools/logger.dart';

class MainController extends GetxController {
  var isSplashReady = false;
  bool isInit = false, isInitRunning = false;

  late PackageInfo packageInfo;
  String buildVersion = "1.0";
  String appVersion = "1";

  late SharedPreferences prefs;
  String token = "";
  Directory? tempDir;
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
    
    ever(headers, (Map<String, String> val) {
      apiService.updateDio(val);
    });
  }

  Future<String> getDeviceInfo() async {
    var info = "Flutter,ios";
    if (Platform.isAndroid) {
      info = "Flutter,android";
    }
    return info;
  }

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

    apiService = ServiceGenerator();
    apiService.updateDio(headers);

    fillUserToken();

    mainResponse.content =
        MainModel(user: UserModel(token: token), aboutus: "");

    packageInfo = await PackageInfo.fromPlatform();

    buildVersion = packageInfo.buildNumber;
    appVersion = packageInfo.version.toString();
    isInit = true;
    isInitRunning = false;
    return true;
  }

  Future<BaseModel<LoginModel>> getSplash() async {
    isloading = true;
    await init();
    var response = await apiService.splash();
    if (response.statusCode == 401) {
      clearUser();
    } else if (response.isSuccess && response.content != null) {
      fillData(response.content!);
    }
    isloading = false;
    return response;
  }

  bool isUserLogin() {
    return token.isNotEmpty;
  }

  String? getToken() {
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
      loggerNoStack.e(e);
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
  void setLocalization(String languageCode, String countryCode) {
    prefs.setString("languageCode", languageCode);
    prefs.setString("countryCode", countryCode);
    submitLocalization();
  }

  void fillData(LoginModel data) {
    _mainResponseObs.update((val) {
      val!.content = MainModel(
        user: UserModel(
          name: data.name,
          phone: data.phoneNumber,
          token: data.token,
        ),
        aboutus: data.aboutus,
      );
    });
    if (data.token != "") updateToken(data.token);
  }

  void submitLocalization() {
    var languageCode = prefs.getString("languageCode");
    var countryCode = prefs.getString("countryCode");
    if (languageCode == null || countryCode == null) {
      setLocalization("fa", "IR");
      languageCode = "fa";
      countryCode = "IR";
    }
    Get.updateLocale(Locale(languageCode, countryCode));
  }

  final _pages = PageIndexResponse().obs;
  List<PageIndexModel> get pages => _pages.value.pages;
  PageIndexModel get currentPage => _pages.value.current;
  int get tabIndex => _pages.value.selectedIndex;
  set tabIndex(int v) => _pages.update((val) => val!.selectedIndex = v);

  void initDashboard() {
    _pages.value = PageIndexResponse(pages: [
      PageIndexModel(
        title: "درخواست ها",
        appbarTitle: "درخواست ها",
        icon: Icons.format_list_bulleted,
        page: MoreScreen(),
        count: 0,
      ),
      PageIndexModel(
        title: "جعبه ابزار",
        appbarTitle: "جعبه ابزار",
        icon: FontAwesomeIcons.toolbox,
        page: MoreScreen(),
        count: 0,
      ),
      PageIndexModel(
        title: "بیشتر",
        appbarTitle: "بیشتر",
        icon: Icons.more_horiz,
        page: MoreScreen(),
        count: 0,
      ),
    ]);
  }
}
