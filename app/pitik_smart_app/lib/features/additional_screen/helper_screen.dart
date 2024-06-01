import 'package:flutter/material.dart';
import 'package:pitik_app_depedencies/pitik_app_depedencies.dart';

///@author DICKY
///@email <dicky.maulana@pitik.idd>
///@create date 06/10/2023

class HelpScreen extends StatelessWidget {
  const HelpScreen({super.key});

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
          'Bantuan',
          style: PitikTextStyle.custom(fontSize: 16, fontWeight: FontWeight.w500),
        ),
      );
    }

    Widget customWidget(double topMargin, PitikSvg imagepath, String text) {
      return Container(
        margin: EdgeInsets.only(top: topMargin),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PitikAsset.icon(svg: imagepath, size: 24),
            const SizedBox(
              width: 16,
            ),
            Expanded(child: Text(text, style: PitikTextStyle.custom(color: PitikColors.black)))
          ],
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  'Bantuan\nPitik Digital Indonesia',
                  style: PitikTextStyle.custom(fontSize: 16, fontWeight: FontWeight.w500, color: PitikColors.primaryOrange),
                  textAlign: TextAlign.center,
                ),
              ),
              customWidget(27, PitikSvg.helpLocation, 'Icon 5 Business Park Blok G5 - G6, Jl. BSD Raya Utama, Sampora, Kec. Cisauk, Kabupaten Tangerang, Banten 15345'),
              customWidget(32, PitikSvg.helpCall, '(+62) 812 8070 9907'),
              customWidget(16, PitikSvg.helpEmail, 'info@pitik.id'),
              customWidget(16, PitikSvg.helpIg, '@pitikdigital'),
              customWidget(16, PitikSvg.helpIn, 'Pitik Digital Indonesia')
            ],
          ),
        ),
      ),
    );
  }
}
