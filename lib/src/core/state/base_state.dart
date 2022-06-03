import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/src/presentation/components/dialog/todo_alert_dialog.dart';

abstract class BaseState<T extends StatefulWidget> extends State<T> {
  GlobalKey<ScaffoldState> get scaffoldKey => _scaffoldKey;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final FocusNode _focusNode = FocusNode();

  String appBarTitle = '';

  static TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (Navigator.of(context).userGestureInProgress) {
          return Platform.isIOS;
        }
        return true;
      },
      child: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(_focusNode),
        child: Scaffold(
          key: _scaffoldKey,
          appBar: buildAppBar(),
          drawer: buildDrawer(),
          bottomNavigationBar: buildBottomNavigationBar(),
          floatingActionButton: buildFloatingActionButton(),
          body: buildBody(),
        ),
      ),
    );
  }

  void showLoading() {}

  void dismissLoading() {}

  PreferredSizeWidget? buildAppBar() => AppBar(
        title: Text(appBarTitle),
        centerTitle: false,
      );

  Drawer? buildDrawer() => null;

  BottomNavigationBar? buildBottomNavigationBar() => null;

  FloatingActionButton? buildFloatingActionButton() => null;

  Widget buildBody();

  PreferredSizeWidget buildSearchAppBar({
    Function? onSearch,
  }) =>
      AppBar(
        title: TextField(
          onChanged: (value) {
            if (onSearch != null) {
              onSearch(value);
            }
          },
          controller: searchController,
          cursorColor: Colors.white,
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
            hintText: 'Search',
            hintStyle: const TextStyle(color: Colors.grey),
            focusedBorder:
                const OutlineInputBorder(borderSide: BorderSide.none),
            border: const OutlineInputBorder(borderSide: BorderSide.none),
            prefixIcon: const Icon(CupertinoIcons.search, color: Colors.white),
            suffix: GestureDetector(
              onTap: () {
                if (onSearch != null) {
                  searchController.clear();
                  onSearch('');
                }
              },
              child: const Icon(
                Icons.cancel,
                color: Colors.white,
                size: 18.0,
              ),
            ),
          ),
        ),
        actions: [
          IconButton(
            key: const Key('addButton'),
            onPressed: () => Navigator.pushNamed(context, '/create-task'),
            icon: const Icon(CupertinoIcons.add),
          ),
        ],
      );

  void showAlertDialog({
    String message = '',
    String actionLabel = 'OK',
    bool isSuccess = true,
    VoidCallback? onPressed,
  }) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return ToDoAlertDialog(
          message: message,
          actionLabel: actionLabel,
          isSuccess: isSuccess,
          onPressed: onPressed,
        );
      },
    );
  }
}
