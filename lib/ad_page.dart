import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdPage extends StatefulWidget {
  const AdPage({Key? key}) : super(key: key);

  @override
  _AdPageState createState() => _AdPageState();
}

class _AdPageState extends State<AdPage> {
  BannerAd? myBanner;
  @override
  void initState() {
    super.initState();
    myBanner = BannerAd(
      adUnitId: "ca-app-pub-3940256099942544/6300978111",
      request: AdRequest(),
      size: AdSize.banner,
      listener: BannerAdListener(
        onAdClicked: (ad) {},
        onAdClosed: (ad) {},
        onAdLoaded: (ad) {
          print('Ad Loaded!!');
        },
        onAdImpression: (ad) {},
        onAdFailedToLoad: (ad, error) {
          print("Loading Add Failed ${error.message}");
        },
      ),
    )..load();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ad Page'),
      ),
      body: Container(
        child: myBanner != null
            ? Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  width: myBanner!.size.width.toDouble(),
                  height: myBanner!.size.height.toDouble(),
                  child: AdWidget(ad: myBanner!),
                ),
              )
            : Container(),
      ),
    );
  }
}
