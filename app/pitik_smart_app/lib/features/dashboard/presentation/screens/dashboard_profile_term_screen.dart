import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:pitik_app_depedencies/pitik_app_depedencies.dart';

@RoutePage()
class TermScreen extends StatelessWidget {
  const TermScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Widget appBar() {
      return AppBar(
        elevation: 0,
        leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              Navigator.pop(context);
            }),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(8), bottomRight: Radius.circular(8)),
        ),
        backgroundColor: PitikColors.primaryOrange,
        centerTitle: true,
        title: Text(
          'Syarat & Ketentuan',
          style: PitikTextStyle.custom(fontSize: 16, fontWeight: PitikTextStyle.medium),
        ),
      );
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: appBar(),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(top: 16),
          margin: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Center(
                child: Text(
                  'Syarat & Ketentuan\nPitik Digital Indonesia',
                  style: PitikTextStyle.custom(fontSize: 16, fontWeight: FontWeight.w500, color: PitikColors.primaryOrange),
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 4),
                child: Center(
                  child: Text(
                    'Terakhir di perbarui 20 Des 2022 - 10:00',
                    style: PitikTextStyle.custom(fontSize: 12, color: PitikColors.greyText),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 32),
                child: Html(data: PitikString.htmlTermsConditionsIndonesia),
              )
            ],
          ),
        ),
      ),
    );
  }
}
