import 'package:flutter/material.dart';

abstract class BaseStateListener {
  BuildContext get viewContext;

  void onLoading();

  void onDismiss();

  void onError(Exception e);
}
