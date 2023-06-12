import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:travee/resources/color.dart';
import 'package:travee/screens/package_list_screen/package_detail_screen.dart';
import '../../data/tour_category_data.dart';
import '../../model/tour_package_model.dart';

class PackageListScreen extends StatefulWidget {
  final String packageName;

  const PackageListScreen({
    Key? key,
    required this.packageName,
  }) : super(key: key);

  @override
  State<PackageListScreen> createState() => _PackageListScreenState();
}

class _PackageListScreenState extends State<PackageListScreen> {
  TourCategoryData tourCategoryData = TourCategoryData();
  late List<Package> packageList;

  @override
  void initState() {
    // SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [SystemUiOverlay.top]);
    // SystemChrome.setSystemUIOverlayStyle(
    //   SystemUiOverlayStyle(
    //     statusBarColor: kWhiteColor,
    //     statusBarIconBrightness: Brightness.dark,
    //     statusBarBrightness: Brightness.dark,
    //     systemNavigationBarDividerColor: Colors.transparent,
    //     systemNavigationBarColor: Colors.transparent,
    //   ),
    // );
    packageList = tourCategoryData.tourCategoriesList.first.packageList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kWhiteColor,
        elevation: 0,
        centerTitle: true,
        titleSpacing: 0,
        title: Text(
          "Travee",
          style: TextStyle(color: kBlackColor, fontSize: 22, fontWeight: FontWeight.bold),
        ),
        leading: InkWell(
          onTap: () => Get.back(),
          child: Icon(
            Icons.arrow_back_ios,
            size: 22,
            color: kBlackColor,
          ),
        ),
      ),
      backgroundColor: kWhiteColor,
      body: Container(
        height: Get.height,
        width: Get.width,
        margin: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// package name
            Text(
              widget.packageName,
              style: TextStyle(color: kBlackColor, fontSize: 24, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 20),

            /// search bar
            Container(
              padding: const EdgeInsets.only(top: 5, bottom: 5, right: 5),
              decoration: BoxDecoration(
                color: kWhiteColor,
                borderRadius: BorderRadius.circular(14),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      obscureText: false,
                      cursorColor: kPrimaryColor,
                      style: TextStyle(color: kBlackColor),
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: const BorderRadius.all(Radius.circular(20)),
                          borderSide: BorderSide(color: kGreyColor),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: const BorderRadius.all(Radius.circular(20)),
                          borderSide: BorderSide(color: kGreyColor),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: const BorderRadius.all(Radius.circular(20)),
                          borderSide: BorderSide(color: kGreyColor),
                        ),
                        labelStyle: TextStyle(color: kGreyColor),
                        labelText: "Search packages",
                        contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                      ),
                      onFieldSubmitted: (value) {},
                    ),
                  ),
                  const SizedBox(width: 10),
                  Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(color: kPrimaryColor, borderRadius: BorderRadius.circular(14)),
                      child: Icon(
                        Icons.search,
                        color: kWhiteColor,
                        size: 26,
                      ))
                ],
              ),
            ),

            const SizedBox(height: 20),

            /// package list view
            Expanded(
              child: StaggeredGridView.countBuilder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                physics: const AlwaysScrollableScrollPhysics(),
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                itemCount: packageList.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Get.to(PackageDetailScreen(
                        package: packageList[index],
                        heroTag: '',
                      ));
                    },
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                              color: Colors.transparent, borderRadius: BorderRadius.all(Radius.circular(15))),
                          child: ClipRRect(
                            borderRadius: const BorderRadius.all(Radius.circular(15)),
                            child: Image.asset(packageList[index].photo, fit: BoxFit.cover),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: kBlackColor.withOpacity(0.25),
                              borderRadius: const BorderRadius.all(Radius.circular(15))),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              /// dummy row
                              Row(
                                children: const [Text(" ")],
                              ),

                              /// package name
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    packageList[index].name,
                                    style: TextStyle(color: kWhiteColor, fontSize: 20, fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),

                              /// dummy row
                              Row(
                                children: const [Text(" ")],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                },
                staggeredTileBuilder: (index) {
                  return StaggeredTile.count(1, index.isEven ? 1.2 : 1.8);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
