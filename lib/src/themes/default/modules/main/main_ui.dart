import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nukeviet/src/include/main_key.dart';

import 'package:get/get.dart';
import 'package:nukeviet/src/modules/dashboard_item.dart';
import 'package:nukeviet/src/modules/main_vm.dart';
import 'package:nukeviet/src/themes/default/color.dart';
import 'package:nukeviet/src/themes/default/modules/sample/sample.dart';
import 'package:nukeviet/src/themes/default/styles.dart';
import 'package:nukeviet/src/vendor/commons/utils.dart';
import 'package:nukeviet/src/vendor/components/gradient_view.dart';
import 'package:nukeviet/src/vendor/network/global.dart';
import 'package:nukeviet/src/vendor/network/response/mapping/user.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'main_item_view.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key key}) : super(key: key);

  _MainPage createState() => _MainPage();
}

class _MainPage extends State<MainPage> with TickerProviderStateMixin {
  AnimationController animationController;

  int _selectedIndex = 0;
  List<DashboardItem> dashboardData = [];
  List<DrawerItemData> drawerData = [];

  final _refreshCtrl = RefreshController(initialRefresh: false);
  final viewModel = MainViewModel();

  @override
  void initState() {
    animationController = AnimationController(
      duration: Duration(milliseconds: 1000),
      vsync: this,
    );

    // TODO: Hiển thị menu item theo tài khoản đăng nhập
    drawerData = DrawerItemData.items();

    super.initState();

    getDashboardPublicData();
  }

  void _onItemTapped(int index) {
    setState(() => _selectedIndex = index);
  }

  void tapOnDrawerItem(DrawerItem item) {
    mainKey.currentState.openEndDrawer();
    switch (item) {

      default:
        final title = item.toString().split('.').last;
        Get.to(() => SamplePage(title: title));
        break;
    }
  }

  void getDashboardPublicData() async {
    dashboardData.clear();
    var summary = await viewModel.getSummary();

    if (summary != null) {
      dashboardData.add(
        DashboardItem(
          title: r'Đối tượng đăng ký tiêm',
          icon: 'assets/svg/ic_register_people.svg',
          unit: r'lượt',
          value: summary.totalVaccinationRegistration,
        ),
      );

      ///
      var dashboard = await viewModel.getDashboard();

      if (dashboard != null) {
        dashboardData.addAll([
          DashboardItem(
            title: r'Số mũi tiêm hôm qua',
            icon: 'assets/svg/ic_injection.svg',
            unit: r'mũi',
            value: dashboard.totalPopulation,
          ),
          DashboardItem(
            title: r'Số mũi đã tiêm toàn quốc',
            icon: 'assets/svg/ic_injected_people.svg',
            unit: r'mũi',
            value: dashboard.objectInjection,
          ),
        ]);
        setState(() {
          _refreshCtrl.refreshCompleted();
        });
      }
    }
  }

  Widget dashboardWidget() {
    if (dashboardData.isEmpty) {
      return SizedBox.shrink();
    }

    final grid = GridView(
      padding: EdgeInsets.all(24),
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.vertical,
      children: List.generate(
        dashboardData.length,
            (index) {
          var count = dashboardData.length;
          var animation = Tween(begin: 0.0, end: 1.0).animate(
            CurvedAnimation(
              parent: animationController,
              curve: Interval((1 / count) * index, 1.0,
                  curve: Curves.fastOutSlowIn),
            ),
          );
          animationController.forward();
          return MainItemView(
            index: index,
            animation: animation,
            animationController: animationController,
            callBack: () {},
          );
        },
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1,
        mainAxisSpacing: 16.0,
        crossAxisSpacing: 24.0,
        childAspectRatio: 5,
      ),
    );

    return SmartRefresher(
      enablePullDown: true,
      enablePullUp: false,
      header: WaterDropHeader(
        complete: Utils.completeRefreshWidget,
      ),
      footer: CustomFooter(
        builder: (BuildContext context, LoadStatus mode) {
          return SizedBox();
        },
      ),
      controller: _refreshCtrl,
      onRefresh: getDashboardPublicData,
      child: grid,
    );
  }

  @override
  Widget build(BuildContext context) {
    final user = Global.shared.currentUser;

    List<Widget> tabPage = <Widget>[
      Container(),
      Container(),
      Container(),
      Container(),
    ];

    final drawerWidget = Drawer(
      child: Column(
        children: [
          SizedBox(
            height: AppBar().preferredSize.height * 2.2,
            child: GradientView(
              child: DrawerHeader(
                margin: EdgeInsets.zero,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      child: Icon(
                        Icons.person_pin,
                        color: Colors.white,
                        size: 44,
                      ),
                      backgroundColor: Colors.transparent,
                    ),
                    SizedBox(width: 8),
                    Expanded(
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              '${user.first_name}',
                              style: GoogleFonts.merriweather(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                              maxLines: 1,
                            ),
                            RichText(
                              text: TextSpan(
                                text: '${user.username} - ',
                                style: GoogleFonts.openSans(
                                  color: AppColor.nearlyWhite,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w300,
                                ),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: '${user.roleName}',
                                    style: GoogleFonts.openSans(
                                      color: Colors.limeAccent,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(vertical: 8),
              children: ListTile.divideTiles(
                context: context,
                tiles: List.generate(
                  drawerData.length,
                      (int index) {
                    return ListTile(
                      title: Text(
                        drawerData[index].title,
                        style: GoogleFonts.roboto(),
                      ),
                      onTap: () => tapOnDrawerItem(drawerData[index].item),
                    );
                  },
                ),
              ).toList(),
            ),
          ),
        ],
      ),
    );

    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        key: mainKey,
        drawer: drawerWidget,
        appBar: Utils.gradientAppBar(
          child: AppBar(
            backgroundColor: Colors.transparent,
            title: Text(
              r'Dashboard',
              style: AppStyle.appBarTitle,
            ),
            actions: [
              IconButton(
                icon: Icon(
                  Icons.logout,
                  color: Colors.white,
                  size: 22,
                ),
                onPressed: () => Utils.showAwesomeDialog(
                  context,
                  title: 'confirm'.tr,
                  message: 'confirm_logout'.tr,
                  isDestructive: true,
                  dismissOnTouchOutside: true,
                  onPressedOK: () => Utils.logout(),
                ),
              )
            ],
          ),
        ),
        body: tabPage[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          items: NBottomBar.items(),
          currentIndex: _selectedIndex,
          unselectedItemColor: Colors.grey,
          selectedItemColor: AppColor.main,
          onTap: _onItemTapped,
          type: BottomNavigationBarType.fixed,
        ),
        // floatingActionButton: FloatingActionButton(
        //   child: Container(
        //     width: 60,
        //     height: 60,
        //     child: Icon(
        //       Icons.add,
        //       size: 30,
        //     ),
        //     decoration: BoxDecoration(
        //       shape: BoxShape.circle,
        //       gradient: LinearGradient(colors: AppConstant.gradientColor),
        //     ),
        //   ),
        //   onPressed: () => Get.toNamed(GetRouter.register_injection),
        // ),
      ),
    );
  }
}



class NBottomBar {
  static List<BottomNavigationBarItem> items() {
    final userLoggedIn = Global.shared.currentUser;
    List<BottomNavigationBarItem> items = [
      BottomNavigationBarItem(
        icon: Icon(Icons.library_add_check_outlined),
        label: r'Checkin',
      ),
    ];

    if (userLoggedIn.nRole == NRoles.USER) {
      items.addAll([
        BottomNavigationBarItem(
          icon: Icon(Icons.history),
          label: r'Lịch sử tiêm',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.qr_code),
          label: 'QR của bạn',
        ),
      ]);
    } else {
      items.addAll([
        BottomNavigationBarItem(
          icon: Icon(Icons.domain_verification),
          label: r'Chính thức',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.icecream),
          label: r'Tiêm chủng',
        ),
      ]);
    }

    items.add(BottomNavigationBarItem(
      icon: Icon(Icons.more),
      label: r'Thêm',
    ));

    return items;
  }
}

///
class DrawerItemData {
  String title = '';
  Function onTap = () => {};
  DrawerItem item;

  DrawerItemData({this.title, this.onTap, this.item});

  static DrawerItemData home = DrawerItemData(
    title: r'Trang chủ',
    item: DrawerItem.home,
  );

  static DrawerItemData news = DrawerItemData(
    title: r'Tin Tức',
    item: DrawerItem.news,
  );

  static DrawerItemData about = DrawerItemData(
    title: r'Giới thiệu',
    item: DrawerItem.about,
  );

  static DrawerItemData member = DrawerItemData(
    title: r'Thành viên',
    item: DrawerItem.member,
  );

  static DrawerItemData votting = DrawerItemData(
    title: r'Thăm dò ý kiên',
    item: DrawerItem.votting,
  );

  static DrawerItemData contact = DrawerItemData(
    title: r'Liên hệ',
    item: DrawerItem.contact,
  );

  static DrawerItemData sendnew = DrawerItemData(
    title: r'Gửi bài viết',
    item: DrawerItem.sendnew,
  );

  static DrawerItemData adminpage = DrawerItemData(
    title: r'Quản trị hệ thống',
    item: DrawerItem.adminpage,
  );

  static DrawerItemData config = DrawerItemData(
    title: r'Cấu hình hệ thống',
    item: DrawerItem.config,
  );

  static DrawerItemData clearcache = DrawerItemData(
    title: r'Xóa cache hệ thống',
    item: DrawerItem.clearcache,
  );

  static List<DrawerItemData> items() {
    List<DrawerItemData> users = [
      home,
      news,
      about,
      votting,
      contact,
      sendnew,
    ];

    List<DrawerItemData> admin = [
      adminpage,
    ];

    List<DrawerItemData> sadmin = [
      clearcache,
    ];
    List<DrawerItemData> goldadmin = [
      config,
    ];
    List<DrawerItemData> items = users;

    final userLoggedIn = Global.shared.currentUser;
    switch (userLoggedIn.nRole) {
      case NRoles.USER:
        break;
      case NRoles.ADMIN:
        items = users + admin;
        break;
      case NRoles.SADMIN:
        items = users + admin + sadmin;
            break;
      case NRoles.GOLDADMIN:
        items = users + admin + sadmin + goldadmin;
    }

    return items;
  }
}

enum DrawerItem {
  home,
  news,
  about,
  member,
  votting,
  contact,
  sendnew,
  adminpage,
  clearcache,
  config
}