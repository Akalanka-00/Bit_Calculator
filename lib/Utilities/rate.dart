/* import 'dart:io';
import 'package:flutter/material.dart';
import 'package:rate_my_app/rate_my_app.dart';
import 'package:url_launcher/url_launcher.dart';

class RateApp {
  RateMyApp rateMyApp = RateMyApp(
    preferencesPrefix: 'rateMyApp_',
    minDays: 1,
    minLaunches: 1,
    remindLaunches: 1,
    remindDays: 1,
    googlePlayIdentifier: 'com.saverpkg.whatsapp_status_saver',
  );

  rateNow(BuildContext context) {
    rateMyApp.showStarRateDialog(
      context,
      title: "Rate this App!",
      message:
          "Do you like this app ? \nThen take a little bit of your time to leave a rating",
      actionsBuilder: (context, stars) {
        // Triggered when the user updates the star rating.
        return [
          // Return a list of actions (that will be shown at the bottom of the dialog).
          FlatButton(
            child: Text('OK'),
            onPressed: () async {
              int rate = stars.round();
              if (rate>0) {
                print('Thanks for the ' +
                    (stars == null ? '0' : stars.round().toString()) +
                    ' star(s) !');
                // You can handle the result as you want (for instance if the user puts 1 star then open your contact page, if he puts more then open the store page, etc...).
                // This allows to mimic the behavior of the default "Rate" button. See "Advanced > Broadcasting events" for more information :
                await rateMyApp.callEvent(RateMyAppEventType.rateButtonPressed);
                if (rate >= 3) {
                  /* OpenAppstore.launch(
                    androidAppId: "com.saverpkg.whatsapp_status_saver"
                    ); */
                
                  try {
                    String url =
                        "https://play.google.com/store/apps/details?id=com.saverpkg.whatsapp_status_saver";
                    if (await canLaunch(url)) {
                      await launch(url);
                    }
                  } catch (e) {}
                }
                
                Navigator.pop<RateMyAppDialogButton>(
                    context, RateMyAppDialogButton.rate);
              }
            },
          ),

          FlatButton(
              onPressed: () async {
                await rateMyApp
                    .callEvent(RateMyAppEventType.laterButtonPressed);
                Navigator.pop(context);
              },
              child: Text(
                "Later",
                style: TextStyle(color: Colors.white),
              ))
        ];
      },
      ignoreNativeDialog: Platform
          .isAndroid, // Set to false if you want to show the Apple's native app rating dialog on iOS or Google's native app rating dialog (depends on the current Platform).
      dialogStyle: DialogStyle(
        // Custom dialog styles.
        titleAlign: TextAlign.center,
        messageAlign: TextAlign.center,
        messagePadding: EdgeInsets.only(bottom: 20),
      ),
      starRatingOptions: StarRatingOptions(), // Custom star bar rating options.
      onDismissed: () =>
          rateMyApp.callEvent(RateMyAppEventType.laterButtonPressed),
    );
  }

  rateApp(BuildContext context) {
    rateMyApp.init().then((_) {
     //  if (rateMyApp.shouldOpenDialog) {
      rateNow(context);
     //  }
    });
  }
}
 */