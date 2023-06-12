import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travee/model/tour_package_model.dart';
import 'package:travee/resources/color.dart';

class PackageDetailScreen extends StatefulWidget {
  final Package package;
  final String heroTag;

  const PackageDetailScreen({Key? key, required this.package, required this.heroTag}) : super(key: key);

  @override
  State<PackageDetailScreen> createState() => _PackageDetailScreenState();
}

class _PackageDetailScreenState extends State<PackageDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Column(
        children: [
          /// package name price & duration
          Hero(
            tag: widget.heroTag,
            child: Container(
              margin: const EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage(widget.package.photo), fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Container(
                height: Get.height / 3.5,
                width: Get.width,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        Colors.transparent,
                        kBlackColor,
                      ],
                    )),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () => Get.back(),
                      child: Container(
                        height: 48,
                        width: 48,
                        margin: const EdgeInsets.symmetric(vertical: 30),
                        padding: const EdgeInsets.only(left: 5),
                        decoration:
                            BoxDecoration(color: kBlackColor.withOpacity(0.5), borderRadius: BorderRadius.circular(48)),
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: kWhiteColor,
                          size: 20,
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 5,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.package.name,
                                style: TextStyle(color: kWhiteColor, fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                "\u{20B9} ${widget.package.price}",
                                style: TextStyle(color: kWhiteColor, fontSize: 16),
                              )
                            ],
                          ),
                          Text(
                            widget.package.duration,
                            style: TextStyle(color: kWhiteColor, fontSize: 16),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          /// package transportation detail
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  /// transportation
                  Container(
                    margin: const EdgeInsets.all(16),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: kWhiteColor,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            //from source
                            Column(
                              children: [
                                Text(
                                  widget.package.transport.toSource,
                                  style: TextStyle(color: kBlackColor, fontSize: 18),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  widget.package.transport.pickupTime,
                                  style: TextStyle(color: kGreyColor, fontSize: 14),
                                ),
                              ],
                            ),

                            // vehicle image
                            Image.asset(
                              widget.package.transport.by == "Bus"
                                  ? "assets/images/bus.png"
                                  : widget.package.transport.by == "Plane"
                                      ? "assets/images/plane.png"
                                      : "assets/images/train.png",
                              color: widget.package.transport.by == "Bus"
                                  ? Colors.red
                                  : widget.package.transport.by == "Plane"
                                      ? Colors.blueAccent
                                      : Colors.purpleAccent,
                              height: 26,
                              width: 26,
                            ),

                            //to destination
                            Column(
                              children: [
                                Text(
                                  widget.package.transport.fromDestination,
                                  style: TextStyle(color: kBlackColor, fontSize: 18),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  widget.package.transport.dropTime,
                                  style: TextStyle(color: kGreyColor, fontSize: 14),
                                ),
                              ],
                            )
                          ],
                        ),
                        const SizedBox(height: 30),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            //from date
                            Text(
                              widget.package.fromDate,
                              style: TextStyle(color: kGreyColor, fontSize: 14),
                            ),

                            //to date
                            Text(
                              widget.package.toDate,
                              style: TextStyle(color: kGreyColor, fontSize: 14),
                            )
                          ],
                        ),
                        const SizedBox(height: 20),
                        Text(
                          "Included : ${widget.package.included}",
                          style: TextStyle(color: kGreyColor, fontSize: 14),
                        ),
                      ],
                    ),
                  ),

                  /// itinerary
                  Container(
                    margin: const EdgeInsets.all(16),
                    padding: const EdgeInsets.all(16),
                    width: Get.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: kWhiteColor,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Itinerary",
                          style: TextStyle(color: kBlackColor, fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 20),
                        ListView.builder(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: widget.package.itinerary.length,
                          itemBuilder: (context, index) {
                            return Container(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Day ${widget.package.itinerary[index].day}",
                                    style: TextStyle(color: kBlackColor, fontSize: 14, fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    widget.package.itinerary[index].place.name,
                                    style: TextStyle(
                                      color: kBlackColor,
                                      fontSize: 14,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    widget.package.itinerary[index].place.details,
                                    style: TextStyle(
                                      color: kBlackColor,
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          InkWell(
            //onTap: () => Get.to(BlurSlider()),
            child: Container(
              width: Get.width,
              height: 48,
              margin: const EdgeInsets.only(left: 16, right: 16, top: 20, bottom: 30),
              decoration: BoxDecoration(color: kPrimaryColor, borderRadius: BorderRadius.circular(14)),
              child: Center(
                child: Text(
                  "Book Now",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: kWhiteColor, fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
