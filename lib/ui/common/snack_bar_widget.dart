import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:test_bap/utils/assets/asset_routes.dart';
import 'package:test_bap/utils/constants/color_constants.dart';

class SnackBarWidget {
  const SnackBarWidget({
    required this.message,
    required this.snackBarColor,
    required this.snackBarTextColor,
    required this.assetRouteAnimation,
    required this.durationSnackBar,
  });
  final String message;
  final Color snackBarColor;
  final Color snackBarTextColor;
  final String assetRouteAnimation;
  final int durationSnackBar;

  static void show(
    BuildContext context,
    String message,
    Color snackbarColor,
    Color snackbarTextColor,
    String assetRouteAnimation,
    int durationSnackBar,
  ) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        padding: EdgeInsets.only(
          left: MediaQuery.of(context).size.width * .03,
          right: MediaQuery.of(context).size.width * .01,
          top: MediaQuery.of(context).size.height * .01,
          bottom: MediaQuery.of(context).size.height * .01,
        ),
        elevation: 0,
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.symmetric(horizontal: 16),
        content: Row(
          children: [
            Expanded(
              flex: 8,
              child: Text(
                message,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: snackbarTextColor),
              ),
            ),
            Expanded(
              flex: 2,
              child: GestureDetector(
                onTap: () =>
                    ScaffoldMessenger.of(context).hideCurrentSnackBar(),
                child: LottieBuilder.asset(
                  assetRouteAnimation,
                ),
              ),
            ),
          ],
        ),
        duration: Duration(seconds: durationSnackBar),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(4)),
        ),
        backgroundColor: snackbarColor,
      ),
    );
  }

  static void showError(
    BuildContext context,
    String message,
    int durationSnackBar,
  ) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        padding: EdgeInsets.only(
          left: MediaQuery.of(context).size.width * .03,
          right: MediaQuery.of(context).size.width * .01,
          top: MediaQuery.of(context).size.height * .01,
          bottom: MediaQuery.of(context).size.height * .01,
        ),
        elevation: 0,
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.symmetric(horizontal: 16),
        content: Row(
          children: [
            Expanded(
              flex: 8,
              child: Text(
                message,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: ColorConstants.onError),
              ),
            ),
            Expanded(
              flex: 2,
              child: GestureDetector(
                onTap: () =>
                    ScaffoldMessenger.of(context).hideCurrentSnackBar(),
                child: LottieBuilder.asset(
                  errorAnimation,
                  height: 32,
                ),
              ),
            ),
          ],
        ),
        duration: Duration(seconds: durationSnackBar),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(4)),
        ),
        backgroundColor: ColorConstants.error,
      ),
    );
  }

  static void showSuccess(
    BuildContext context,
    String message,
    int durationSnackBar,
  ) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        padding: EdgeInsets.only(
          left: MediaQuery.of(context).size.width * .03,
          right: MediaQuery.of(context).size.width * .01,
          top: MediaQuery.of(context).size.height * .01,
          bottom: MediaQuery.of(context).size.height * .01,
        ),
        elevation: 0,
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.symmetric(horizontal: 16),
        content: Row(
          children: [
            Expanded(
              flex: 8,
              child: Text(
                message,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: ColorConstants.onRecibido),
              ),
            ),
            Expanded(
              flex: 2,
              child: GestureDetector(
                onTap: () =>
                    ScaffoldMessenger.of(context).hideCurrentSnackBar(),
                child: LottieBuilder.asset(
                  confirmAnimation,
                  height: 32,
                ),
              ),
            ),
          ],
        ),
        duration: Duration(seconds: durationSnackBar),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(4)),
        ),
        backgroundColor: ColorConstants.recibido,
      ),
    );
  }

  static void showGeneral(
    BuildContext context,
    String message,
    int durationInSeconds,
    bool isFloating, {
    String? messageAction,
    VoidCallback? actionCallback,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        action: actionCallback != null
            ? SnackBarAction(
                label: messageAction ?? 'OK',
                onPressed: () => actionCallback.call(),
              )
            : null,
        padding: isFloating
            ? EdgeInsets.only(
                left: MediaQuery.of(context).size.width * .03,
                right: MediaQuery.of(context).size.width * .01,
                top: MediaQuery.of(context).size.height * .01,
                bottom: MediaQuery.of(context).size.height * .01,
              )
            : null,
        elevation: 0,
        behavior: isFloating ? SnackBarBehavior.floating : null,
        margin: isFloating ? const EdgeInsets.symmetric(horizontal: 16) : null,
        content: Row(
          children: [
            Expanded(
              flex: 8,
              child: Text(
                message,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: ColorConstants.ultramarine),
              ),
            ),
          ],
        ),
        duration: Duration(seconds: durationInSeconds),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(4)),
        ),
        backgroundColor: ColorConstants.onSurface,
      ),
    );
  }

  static void hideSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
  }
}
