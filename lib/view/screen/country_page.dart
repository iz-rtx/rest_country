import 'package:rest_country/misc/color.dart';
import 'package:rest_country/controller/country_provider.dart';
import 'package:rest_country/view/screen/favourite_page.dart';
import 'package:rest_country/view/widget/country_section.dart';
import 'package:rest_country/view/widget/country_tile.dart';
import 'package:rest_country/view/widget/country_widget.dart';
import 'package:rest_country/view/widget/filter_tile.dart';
import 'package:rest_country/view/widget/search_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';


class CountryScreen extends StatefulWidget {
  const CountryScreen({super.key});

  @override
  State<CountryScreen> createState() => _CountryScreenState();
}

class _CountryScreenState extends State<CountryScreen> {
  final TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final countryProvider = Provider.of<CountryProvider>(context);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Rest Country",
                        style: Theme.of(context).textTheme.displaySmall),
                    IconButton(
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>
                              FavouriteScreen(countryProvider: countryProvider)));
                        },
                        icon: const Icon(Icons.favorite,color: Colors.red,)
                    )
                  ]

                ),
                SizedBox(height: 24.h),
                const SearchField(),
                SizedBox(height: 16.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CountryTile(
                      onTap: () {
                        showModalBottomSheet(
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(30),
                                  topLeft: Radius.circular(30),
                                )),
                            context: context,
                            builder: (context) {
                              return const FilterTile();
                            });
                      },
                      containerWidth: 96.w,
                      color: AppColors.containerBgColor,
                      icon: Icons.filter_alt_outlined,
                      text: "Filter",
                    ),
                  ],
                ),
                for (var letter in 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'.split(''))
                  ListView.builder(
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
                SizedBox(height: 16.h),
                for (var letter in 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'.split(''))
                  CountrySection(countryProvider: countryProvider, letter: letter),
              ],
            ),
          ),
        ),
      ),
    );
  }
}