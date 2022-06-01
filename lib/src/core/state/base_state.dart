import 'dart:io';

import 'package:flutter/material.dart';
import 'package:todo_app/src/core/state/base_state_listener.dart';
import 'package:todo_app/src/presentation/components/dialog/todo_alert_dialog.dart';

abstract class BaseState<T extends StatefulWidget> extends State<T>
    implements BaseStateListener {
  GlobalKey<ScaffoldState> get scaffoldKey => _scaffoldKey;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final FocusNode _focusNode = FocusNode();

  String appBarTitle = '';
  bool _isLoading = false;

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

  @override
  BuildContext get viewContext => throw UnimplementedError();

  @override
  void onLoading() {}

  @override
  void onDismiss() {}

  @override
  void onError(Exception e) {}

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
