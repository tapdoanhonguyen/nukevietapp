import 'package:flutter/material.dart';

// import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:loading_indicator/loading_indicator.dart';

class PagingFooter extends StatefulWidget {
  final Function(int) onPage;
  final Function(int) onSize;
  final Function onNext;
  final Function onPrevious;
  final int numberOfPage;
  final bool isLoading;

  const PagingFooter({
    this.onNext,
    this.onPrevious,
    this.onPage,
    this.onSize,
    this.numberOfPage = 5,
    this.isLoading = false,
  });

  @override
  State<StatefulWidget> createState() => PagingFooterState();
}

class PagingFooterState extends State<PagingFooter> {
  int page = 0;
  int size = 25;
  List<int> allPages = [];

  bool isKeyboardVisible = false;

  @override
  void initState() {
    allPages = List<int>.generate(widget.numberOfPage, (i) => i);
    super.initState();

    // Subscribe
    // KeyboardVisibilityController().onChange.listen((bool isVisible) {
    //   if (mounted) {
    //     setState(() => isKeyboardVisible = isVisible);
    //   }
    // });
  }

  @override
  Widget build(BuildContext context) {
    if (isKeyboardVisible) {
      return SizedBox();
    }

    return SizedBox(
      height: kToolbarHeight,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(width: 16),
          // DropdownButton<int>(
          //   value: size,
          //   icon: const Icon(Icons.arrow_drop_down),
          //   iconSize: 24,
          //   elevation: 16,
          //   style: const TextStyle(color: Colors.black87),
          //   underline: Divider(color: Colors.transparent),
          //   onChanged: (int newValue) {
          //     setState(() => size = newValue);
          //     widget.onSize(size);
          //   },
          //   items: <int>[].map<DropdownMenuItem<int>>((int value) {
          //     return DropdownMenuItem<int>(
          //       value: value,
          //       child: Padding(
          //         padding: const EdgeInsets.symmetric(vertical: 8),
          //         child: Text('$value'),
          //       ),
          //     );
          //   }).toList(),
          // ),
          IconButton(onPressed: null, icon: SizedBox()),
          IconButton(
            icon: Icon(Icons.navigate_before),
            onPressed: widget.isLoading ? null : () {
              var prevPage = page - 1;
              if (prevPage >= 0) {
                setState(() {
                  page = prevPage;
                });
                widget.onPage(page);
              }
            },
          ),
          Stack(
            children: [
              CircleAvatar(
                child: Text(
                  '${page + 1}/${widget.numberOfPage}',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 13,
                  ),
                ),
              ),
              widget.isLoading
                  ? SizedBox(
                      width: 40,
                      height: 40,
                      child: LoadingIndicator(
                        indicatorType: Indicator.circleStrokeSpin,
                        colors: [Colors.amber],
                      ),
                    )
                  : SizedBox(),
            ],
          ),
          IconButton(
            icon: Icon(Icons.navigate_next),
            onPressed: widget.isLoading ? null : () {
              var nextPage = page + 1;
              if (nextPage < allPages.length) {
                setState(() {
                  page = nextPage;
                });
                widget.onPage(page);
              }
            },
          ),
          DropdownButton<int>(
            value: page,
            icon: Icon(
              Icons.arrow_drop_down,
              color: (allPages.length > 0) ? null : Colors.transparent,
            ),
            iconSize: 24,
            elevation: 16,
            style: const TextStyle(color: Colors.black87),
            underline: Divider(color: Colors.transparent),
            onChanged: (int newValue) {
              if (!widget.isLoading) {
                setState(() => page = newValue);
                widget.onPage(page);
              }
            },
            items: allPages.map<DropdownMenuItem<int>>((int value) {
              return DropdownMenuItem<int>(
                value: value,
                child: Text('${value + 1}'),
              );
            }).toList(),
          ),
          SizedBox(width: 16),
        ],
      ),
    );
  }
}
