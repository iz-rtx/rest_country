import 'package:rest_country/controller/country_provider.dart';
import 'package:rest_country/view/widget/country_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CountrySection extends StatelessWidget {
  final CountryProvider countryProvider;
  final String letter;
  const CountrySection(
      {super.key, required this.countryProvider, required this.letter});

  @override
  Widget build(BuildContext context) {
        return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          letter,
          style: Theme.of(context).textTheme.bodySmall,
        ),
        SizedBox(height: 1.0.h,),
          Row(
            children: [
              Expanded(
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: countryProvider.foundList.length,
                  itemBuilder: (context, index) {
                    if (countryProvider.foundList[index].name!.common!
                        .startsWith(letter) &&
                        countryProvider.foundList[index].name!.common! != 'Antarctica') {
                      return Padding(
                        padding: EdgeInsets.only(bottom: 20.h),
                        child: CountryWidget(countryModel: countryProvider.foundList[index]),
                      );
                    }
                    return const SizedBox();
                  },
                ),
              ),
                 
            ],
          ),
 
      ],
    );
  }
}