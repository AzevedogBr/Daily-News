import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class FeedbackHelper {
  FeedbackHelper._({
    @required String message,
    @required FeedbackType feedbackType,
    String title,
    String actionLabel,
    Function action,
    bool shortFeedback = true,
    bool showClose = false,
    bool showOkCloseButton = false,
    bool showAboveNavBar = true,
  }) {
    IconData feedbackIcon;
    Color feedbackColor;
    switch (feedbackType) {
      case FeedbackType.success:
        feedbackIcon = Icons.check;
        feedbackColor = Colors.green;
        break;
      case FeedbackType.error:
        feedbackIcon = Icons.close;
        feedbackColor = Colors.red;
        break;
      case FeedbackType.warning:
        feedbackIcon = Icons.add_alert_sharp;
        feedbackColor = Colors.orange;
        break;
      case FeedbackType.info:
        feedbackIcon = Icons.info;
        feedbackColor = Colors.blue;
        break;
    }
    BotToast.showCustomText(
      clickClose: true,
      ignoreContentClick: false,
      onlyOne: true,
      crossPage: true,
      align: Alignment.bottomCenter,
      duration: shortFeedback ? const Duration(seconds: 5) : const Duration(seconds: 10),
      toastBuilder: (closeFunction) => Container(
        margin: EdgeInsets.fromLTRB(8, 0, 8, showAboveNavBar ? 56 : 16),
        padding: const EdgeInsets.fromLTRB(12, 12, 16, 12),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(4), color: feedbackColor),
        width: MediaQuery.of(Modular.navigatorKey.currentContext).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: Icon(feedbackIcon, color: Colors.white, size: 24),
                ),
                Expanded(
                  child: Text(
                    title ?? message ?? '',
                    maxLines: 2,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                      fontWeight: title == null ? FontWeight.normal : FontWeight.bold,
                    ),
                  ),
                ),
                showClose
                    ? GestureDetector(
                  onTap: () => closeFunction(),
                  child: showOkCloseButton
                      ? Container(alignment: Alignment.center, height: 24, child: Text("OK", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)))
                      : Icon(Icons.close, color: Colors.white),
                )
                    : Container(),
              ],
            ),
            title != null
                ? Container(
              margin: EdgeInsets.only(left: 32, top: 4),
              width: MediaQuery.of(Modular.navigatorKey.currentContext).size.width,
              child: Text(
                message,
                style: TextStyle(
                    fontSize: 12,
                    color: Colors.white),
              ),
            )
                : Container(),
            action != null
                ? GestureDetector(
              onTap: () {
                action();
                closeFunction();
              },
              child: Container(
                height: 18,
                margin: const EdgeInsets.only(top: 16),
                child: Text(
                  actionLabel ?? "TENTAR NOVAMENTE",
                  style: TextStyle(
                      fontSize: 12,
                      color: Color(0xffD9D9D9), fontWeight: FontWeight.bold),
                ),
              ),
            )
                : Container(),
          ],
        ),
      ),
    );
  }

  factory FeedbackHelper.simpleFeedback({
    @required String message,
    @required FeedbackType feedbackType,
    bool showClose = false,
    bool showOkCloseButton = false,
    bool showAboveNavBar = true,
  }) =>
      FeedbackHelper._(
        message: message,
        feedbackType: feedbackType,
        showClose: showClose,
        showOkCloseButton: showOkCloseButton,
        showAboveNavBar: showAboveNavBar,
      );

  factory FeedbackHelper.titleFeedback({
    @required String title,
    @required String message,
    @required FeedbackType feedbackType,
    bool showAboveNavBar = true,
  }) =>
      FeedbackHelper._(
        title: title,
        message: message,
        feedbackType: feedbackType,
        showClose: true,
        shortFeedback: false,
        showAboveNavBar: showAboveNavBar,
      );

  factory FeedbackHelper.actionFeedback({
    @required String title,
    @required String message,
    @required FeedbackType feedbackType,
    @required Function action,
    String actionLabel = "TENTAR NOVAMENTE",
    bool showAboveNavBar = true,
  }) =>
      FeedbackHelper._(
        title: title,
        message: message,
        feedbackType: feedbackType,
        showClose: true,
        action: action,
        actionLabel: actionLabel,
        shortFeedback: false,
        showAboveNavBar: showAboveNavBar,
      );
}

enum FeedbackType {
  success,
  error,
  warning,
  info,
}
