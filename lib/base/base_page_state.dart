import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../app/navigation/routes.dart';
import '../core/utils/colors.dart';
import '../core/utils/dimensions.dart';
import '../core/utils/image_constants.dart';
import '../core/utils/is_zebra_device.dart';
import '../core/utils/strings.dart';

abstract class CoreBasePageState<VM, T extends StatefulWidget> extends State<T>
    with WidgetsBindingObserver {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  bool subscribeVisibilityEvents = false;

  VM? _viewModel;

  bool get attached => _viewModel != null;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return getLayout();
  }

  /// Returns viewModel of the screen
  VM getViewModel() {
    return attached
        ? _viewModel!
        : throw Exception("View model is not attached");
  }

  GlobalKey<ScaffoldState> get scaffoldKey => _scaffoldKey;

  /// Actual Screen which load scaffold and load UI
  Widget getLayout() {
    return WillPopScope(
      onWillPop: onBackPressed,
      child: Scaffold(
        key: _scaffoldKey,
        backgroundColor: scaffoldBackgroundColor(),
        appBar: buildAppbar(),
        extendBodyBehindAppBar: extendBodyBehindAppBar(),
        body: buildScaffoldBody(context, _viewModel as VM),
        drawer: buildDrawer(),
        floatingActionButton: buildFloatingActionButton(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        drawerEnableOpenDragGesture: drawerEnableOpenDragGesture(),
        bottomNavigationBar: buildBottomNavigationBar(),
        bottomSheet: buildBottomSheet(),
        resizeToAvoidBottomInset: true,
      ),
    );
  }

  /// Building a appbar of screen
  PreferredSizeWidget? buildAppbar() {
    return null;
  }

  /// Building a appbar of screen
  Color? scaffoldBackgroundColor() {
    return null;
  }

  /// Building a drawer of screen
  Widget? buildDrawer() {
    return Drawer(
      //backgroundColor: Theme.of(context).primaryColor,
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft, // Start position
                end: Alignment.topRight, // End position
                colors: [
                  AppColors.bodyBackGroundColorGradient1, // Deep Sky Blue
                  AppColors.bodyBackGroundColorGradient2, // Light Sky Blue
                ],
              ),
            ),
          ),
          FutureBuilder<bool>(
            future: IsZebraDevice.isZebraDevice(),
            builder: (context, snapshot) {
              return Positioned(
                top: 0.21.sh,
                bottom: 0,
                child: Container(
                  width: snapshot.data==true? 0.85.sw: 0.78.sw,
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25),
                          topRight: Radius.circular(25))),
                  child: Padding(
                    padding: EdgeInsets.all(AppDimensions.paddingLarge),
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, RoutePaths.settingView);
                          },
                          child: Row(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 10.0, right: 12.0),
                                child: Icon(
                                  Icons.settings,
                                  color: AppColors.iconColor,
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  AppStrings.settings.tr(),
                                  style: TextStyle(
                                      fontSize: AppDimensions.fontLarge,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: GoogleFonts.notoSans().fontFamily),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            }
          )
        ],
      ),
    );
  }

  /// Building a floating action button
  Widget? buildFloatingActionButton() {
    return null;
  }

  /// Building a bottom-sheet
  Widget? buildBottomSheet() {
    return null;
  }

  /// Building a bottomNaviagtion Bar
  Widget? buildBottomNavigationBar() {
    return null;
  }

  bool extendBodyBehindAppBar() {
    return false;
  }

  bool drawerEnableOpenDragGesture() {
    return false;
  }



  Widget buildScaffoldBody(BuildContext context, VM model) {
    return SingleChildScrollView(

      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight: headText() == AppStrings.welcome.tr() ? 1.0.sh:  1.12.sh,

        ),
        child: Stack(
          children: [
            Container(
              width: 1.sw,
              height: 1.4.sh,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft, // Start position
                  end: Alignment.topRight, // End position
                  colors: [
                    AppColors.bodyBackGroundColorGradient1, // Deep Sky Blue
                    AppColors.bodyBackGroundColorGradient2, // Light Sky Blue
                  ],
                ),
              ),
              child: SafeArea(
                child: Padding(
                  padding: EdgeInsets.all(AppDimensions.paddingMedium),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 15,
                    children: [
                      headText() == AppStrings.articleEnquiry.tr()
                          ? SizedBox.shrink()
                          : Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                showBackButton() == true
                                    ? FutureBuilder<bool>(
                                      future: IsZebraDevice.isZebraDevice(),
                                      builder: (context, snapshot) {
                                        return Padding(
                                            padding:  EdgeInsets.only(
                                                top: snapshot.data==true? 2.0:4.0, right: 6.0, left: 8.0),
                                            child: InkWell(
                                              onTap: () {
                                                Navigator.pop(context);
                                              },
                                              child: Icon(
                                                Icons.arrow_back_ios,
                                                color: AppColors.backGroundColorLight,
                                                size: AppDimensions.iconMedium,
                                              ),
                                            ),
                                          );
                                      }
                                    )
                                    : SizedBox.shrink(),
                                Padding(
                                  padding: showBackButton() == false
                                      ? const EdgeInsets.only(left: 10.0)
                                      : EdgeInsets.zero,
                                  child: Text(
                                    headText(),
                                    style: TextStyle(
                                        color: AppColors.backGroundColorLight,
                                        fontSize: AppDimensions.fontLarge,
                                        fontWeight: FontWeight.bold,
                                        fontFamily:
                                            GoogleFonts.notoSans().fontFamily),
                                  ),
                                ),
                              ],
                            ),
                      SizedBox(
                        height: 0.2.h,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                                onTap: () {
                                  scaffoldKey.currentState!.openDrawer();
                                },
                                child: Image.asset(
                                  AppImageStrings.homeDrawerIcon,
                                  height: 0.032.sh,
                                  width: 0.1.sw,
                                )),
                            GestureDetector(
                              onTap: () {
                                headText() == AppStrings.welcome.tr()||headText() == AppStrings.lulu.tr()
                                    ? null
                                    : Navigator.of(context).pushNamedAndRemoveUntil(
                                        RoutePaths.homeView,
                                        (Route<dynamic> route) => false);
                              },
                              child: Icon(
                                Icons.home,
                                size: AppDimensions.iconMedium,
                                color: AppColors.backGroundColorLight,
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            FutureBuilder<bool>(
              future: IsZebraDevice.isZebraDevice(),
              builder: (context, snapshot) {
                return Positioned(
                  top: headText() == AppStrings.articleEnquiry.tr()
                      ? 0.15.sh
                      : snapshot.data==true ?
                           0.25.sh
                          : 0.20.sh,
                  bottom: 0,
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(35),topRight: Radius.circular(35)),
                    child: Container(
                      width: 1.sw,
                      decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(25),
                              topRight: Radius.circular(25))),
                      child: buildView(context, model),
                    ),
                  ),
                );
              }
            )
          ],
        ),
      ),
    );
  }

  @mustCallSuper
  Widget buildView(BuildContext context, VM model);

  @mustCallSuper
  String headText();

  @mustCallSuper
  bool showBackButton();

  void onBaseModelReady(VM model) {
    _viewModel = model;
    onModelReady(model);
  }

  Future<bool> onBackPressed({dynamic param}) {
    return _onWillPop(param);
  }

  Future<bool> _onWillPop(dynamic param) {
    if (Navigator.canPop(context)) {
      if (param != null) {
        Navigator.pop(context, param);
        return Future.value(false);
      } else {
        Navigator.pop(
          context,
        );
        return Future.value(false);
      }
    }
    return Future.value(true);
  }

  /*Mandatory*/

  /// You can setup load something when model is ready, Ex: Load or fetch some data from remote layer
  void onModelReady(VM model) {}
}
