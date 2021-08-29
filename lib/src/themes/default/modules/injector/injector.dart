import 'package:flutter/material.dart';

import 'package:loading_indicator/loading_indicator.dart';
import 'package:nukeviet/src/modules/search_query.dart';
import 'package:nukeviet/src/vendor/commons/toast.dart';
import 'package:nukeviet/src/vendor/commons/utils.dart';
import 'package:nukeviet/src/vendor/components/base_scaffold.dart';
import 'package:nukeviet/src/vendor/components/paging_footer.dart';
import 'package:nukeviet/src/vendor/network/response/mapping/nguoitiemchung.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../color.dart';
import 'injector_cell.dart';
import 'injector_vm.dart';

/// Danh sách người tiêm chủng
class InjectorPage extends StatefulWidget {
  const InjectorPage();

  @override
  _InjectorPageState createState() => _InjectorPageState();
}

class _InjectorPageState extends State<InjectorPage>
    with TickerProviderStateMixin {
  AnimationController animationController;
  ScrollController _scrollController = new ScrollController();

  List<NguoiTiemChung> dataArray = [];
  final _refreshCtrl = RefreshController(initialRefresh: false);

  final viewModel = InjectorViewModel();
  var searchQuery = SearchQuery();
  bool isFirstLoading = true;
  bool _isPageLoading = false;
  int numberOfPage = 1;

  @override
  void initState() {
    _scrollController.addListener(() => Utils.hideKeyboard());

    animationController =
        AnimationController(duration: Duration(milliseconds: 300), vsync: this);
    super.initState();

    viewModel.injectorsStream.listen((list) {
      if (list != null && list.data.isNotEmpty) {
        setState(() {
          dataArray = list.data;
          numberOfPage = list.total ~/ searchQuery.size;
          _refreshCtrl.refreshCompleted();
          _isPageLoading = false;
          if (isFirstLoading) {
            isFirstLoading = false;
          }
        });
      }
    });

    getData();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  void getData() async {
    await Future.delayed(Duration(milliseconds: 300));
    viewModel.getInjectors(param: searchQuery);
  }

  void reloadStock({bool pageLoading = true}) async {
    viewModel.getInjectors(param: searchQuery);
    if (pageLoading) {
      setPageLoading();
    }
  }

  void setPageLoading() => setState(() => _isPageLoading = true);

  @override
  Widget build(BuildContext context) {
    visibleWidget() {
      if (isFirstLoading) {
        return Center(
          child: SizedBox(
            width: 40,
            height: 40,
            child: LoadingIndicator(
              indicatorType: Indicator.circleStrokeSpin,
              colors: [AppColor.main],
            ),
          ),
        );
      } else {
        return Column(
          children: [
            Expanded(
              child: Container(
                color: AppColor.backgroundWhite,
                child: SmartRefresher(
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
                  onRefresh: _refresh,
                  child: dataArray.length > 0
                      ? ListView.builder(
                          itemCount: dataArray.length,
                          padding: EdgeInsets.symmetric(vertical: 8),
                          scrollDirection: Axis.vertical,
                          itemBuilder: (context, index) {
                            var count = dataArray.length;
                            var animation = Tween(begin: 0.2, end: 1.0).animate(
                              CurvedAnimation(
                                parent: animationController,
                                curve: Interval((1 / count) * index, 1.0,
                                    curve: Curves.fastOutSlowIn),
                              ),
                            );
                            animationController.forward();
                            final item = dataArray[index];
                            return InjectorCell(
                              item: item,
                              animation: animation,
                              animationController: animationController,
                              onTap: (item) {
                                Toast.show(text: item.hoVaTen);
                              },
                              action: (ac, item) {
                                Toast.show(
                                  text: ac.toString() + ' - ' + item.hoVaTen,
                                );
                              },
                            );
                          },
                        )
                      : Utils.emptyDataWidget(),
                ),
              ),
            ),
            PagingFooter(
              isLoading: _isPageLoading,
              numberOfPage: numberOfPage,
              onNext: () {
                searchQuery.page += 1;
                reloadStock();
              },
              onPrevious: () {
                searchQuery.page -= 1;
                reloadStock();
              },
              onPage: (page) {
                searchQuery.page = page;
                reloadStock();
              },
              onSize: (size) {
                searchQuery.size = size;
                reloadStock();
              },
            ),
            SizedBox(height: MediaQuery.of(context).padding.bottom),
          ],
        );
      }
    }

    return BaseScaffoldWidget(
      title: r'Người tiêm chủng',
      child: visibleWidget(),
    );
  }

  /// PRIVATE METHOD

  Future<Null> _refresh() async {
    reloadStock(pageLoading: false);
  }
}
