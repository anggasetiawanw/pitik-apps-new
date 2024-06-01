import 'package:flutter/material.dart';
import 'package:pitik_app_depedencies/pitik_app_depedencies.dart';

class ProductCardDailyreport extends StatelessWidget {
  final List<Product?> productList;
  final bool isFeed;
  const ProductCardDailyreport({required this.productList, super.key, this.isFeed = false});

  @override
  Widget build(BuildContext context) {
    return Column(
        children: List.generate(productList.length, (index) {
      if (productList[index] != null) {
        final Product product = productList[index]!;
        return Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.all(16),
            margin: const EdgeInsets.only(bottom: 12),
            decoration: const BoxDecoration(color: Colors.white, border: Border.fromBorderSide(BorderSide(color: PitikColors.outlineColor, width: 2)), borderRadius: BorderRadius.all(Radius.circular(10))),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text('Merek', style: PitikTextStyle.custom(fontSize: 12, fontWeight: PitikTextStyle.medium, color: PitikColors.greyText)),
              const SizedBox(height: 4),
              Text(isFeed ? '${product.subcategoryName ?? ''} - ${product.productName ?? ''}' : product.productName ?? '', style: PitikTextStyle.custom(fontSize: 14, fontWeight: PitikTextStyle.medium, color: PitikColors.black)),
              const SizedBox(height: 12),
              if (isFeed) ...[
                Text('Total', style: PitikTextStyle.custom(fontSize: 12, fontWeight: PitikTextStyle.medium, color: PitikColors.greyText)),
                const SizedBox(height: 4),
                Text('${product.quantity == null ? '' : product.quantity!.toStringAsFixed(0)} ${product.uom ?? product.purchaseUom ?? ''}', style: PitikTextStyle.custom(fontSize: 14, fontWeight: PitikTextStyle.medium, color: PitikColors.black))
              ] else ...[
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                  Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Text('Total', style: PitikTextStyle.custom(fontSize: 12, fontWeight: PitikTextStyle.medium, color: PitikColors.greyText)),
                    const SizedBox(height: 4),
                    Text('${product.quantity == null ? '' : product.quantity!.toStringAsFixed(0)} ${product.uom ?? product.purchaseUom ?? ''}',
                        style: PitikTextStyle.custom(fontSize: 14, fontWeight: PitikTextStyle.medium, color: PitikColors.black))
                  ]),
                  const SizedBox(width: 8),
                  Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
                    Text('Alasan', style: PitikTextStyle.custom(fontSize: 12, fontWeight: PitikTextStyle.medium, color: PitikColors.greyText)),
                    const SizedBox(height: 4),
                    Text(product.remarks ?? '-', style: PitikTextStyle.custom(fontSize: 14, fontWeight: PitikTextStyle.medium, color: PitikColors.black))
                  ])
                ])
              ]
            ]));
      } else {
        return const SizedBox();
      }
    }));
  }
}
