
// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';
// import 'package:url_launcher/url_launcher.dart';

// class LicenseScreen extends StatelessWidget {
//   const LicenseScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     Widget appBar() {
//       return AppBar(
//         elevation: 0,
//         leading: IconButton(
//             icon: const Icon(Icons.arrow_back, color: Colors.white),
//             onPressed: () {
//               Navigator.pop(context);
//             }),
//         shape: const RoundedRectangleBorder(
//           borderRadius: BorderRadius.only(bottomLeft: Radius.circular(8), bottomRight: Radius.circular(8)),
//         ),
//         backgroundColor: AppColors.primaryOrange,
//         centerTitle: true,
//         title: Text(
//           'Lisensi',
//           style: AppTextStyle.whiteTextStyle.copyWith(fontSize: 16, fontWeight: AppTextStyle.medium),
//         ),
//       );
//     }

//     Widget customExpandale(String title, String text, String url) {
//       return Container(
//         margin: const EdgeInsets.only(top: 24),
//         child: Expandable(
//           controller: GetXCreator.putAccordionController(url),
//           headerText: title,
//           child: RichText(
//               text: TextSpan(children: [
//             TextSpan(text: '$text\n', style: AppTextStyle.blackTextStyle),
//             TextSpan(
//               text: url,
//               style: const TextStyle(
//                 color: AppColors.primaryOrange,
//                 decoration: TextDecoration.underline,
//               ),
//               recognizer: TapGestureRecognizer()
//                 ..onTap = () {
//                   _launchUrl(url);
//                 },
//             ),
//           ])),
//         ),
//       );
//     }

//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: PreferredSize(
//         preferredSize: const Size.fromHeight(60),
//         child: appBar(),
//       ),
//       body: SingleChildScrollView(
//         child: Container(
//           margin: const EdgeInsets.symmetric(horizontal: 16),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Container(margin: const EdgeInsets.only(top: 16), child: Text('Credit Penggunaan Aset Visual', style: AppTextStyle.primaryTextStyle.copyWith(fontSize: 16, fontWeight: FontWeight.w500))),
//               customExpandale('Icon', 'Seluruh Icon (symbol) dalam aplikasi ini menggunakan lisensi gratis dari:', 'https://remixicon.com/'),
//               customExpandale('Illustrasi', 'Penggunaan illustrasi pada aplikasi ini seluruhnya menggunakan lisensi dari:', 'https://www.manypixels.co/'),
//               customExpandale('Font', 'Penggunaan font pada aplikasi ini menggunakan lisensi gratis dari:', 'https://fonts.google.com/'),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Future<void> _launchUrl(String url) async {
//     final Uri url0 = Uri.parse(url);

//     if (!await launchUrl(url0)) {
//       throw Exception('Could not launch $url0');
//     }
//   }
// }
