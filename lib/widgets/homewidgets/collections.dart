import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webcastle/controller/homescreencontroller.dart';
import 'package:webcastle/main.dart';
import 'package:webcastle/model/homescreenmodel.dart';
import 'package:get/get.dart';
import '../../core/color.dart';

class Collections extends StatelessWidget {
  Collections({super.key, required this.collections});

  final HomeField? collections;
  HomeController homeController = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        SizedBox(
          height: MyApp.h * .02,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: MyApp.w * .05),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "${collections?.name}",
                style: TextStyle(
                    color: ColorState.textblackcolor,
                    fontWeight: FontWeight.bold,
                    fontSize: MyApp.h * .025),
              ),
              Text(
                "View All",
                style: TextStyle(
                    color: ColorState.textblackcolor,
                    decoration: TextDecoration.underline,
                    fontSize: MyApp.h * .02),
              ),
            ],
          ),
        ),
        SizedBox(
          height: MyApp.h * .02,
        ),
        SizedBox(
          height: MyApp.h * .35,
          child: ListView.builder(
            padding: EdgeInsets.only(left: MyApp.w * .03),
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: collections?.products?.length ?? 0,
            itemBuilder: (context, index) => Padding(
              padding: EdgeInsets.symmetric(horizontal: MyApp.w * .02),
              child: Container(
                height: MyApp.h * .35,
                width: MyApp.w * .5,
                decoration: BoxDecoration(
                    border: Border.all(color: ColorState.textfieldgraycolor),
                    borderRadius: BorderRadius.circular(MyApp.h * .02)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _offertag(
                        offerprice: "${collections?.products?[index].offer}",
                        iswishlisted:
                            collections?.products?[index].wishlisted ?? false),
                    imagecard(
                      imageurl: collections?.products?[index].image ?? '',
                    ),
                    SizedBox(
                      height: MyApp.h * .01,
                    ),
                    _nameanpricedetails(
                        name: "${collections?.products?[index].name}",
                        offerprice: "${collections?.products?[index].price}",
                        realprice:
                            "${collections?.products?[index].actualPrice}"),
                    SizedBox(
                      height: MyApp.h * .01,
                    ),
                    _buttons(cartcount: collections?.products?[index].cartCount??0)
                  ],
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: MyApp.h * .02,
        ),
      ],
    );
  }

  Widget _offertag({required String offerprice, required bool iswishlisted}) {
    return Padding(
      padding: EdgeInsets.only(right: MyApp.w * .02, top: MyApp.h * .01),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: EdgeInsets.only(right: MyApp.w * .03, left: MyApp.w * .03),
            decoration: BoxDecoration(
                color: ColorState.containeroffercolor,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(MyApp.h * .02),
                  topRight: Radius.circular(MyApp.h * .02),
                )),
            child: Text(
              "$offerprice",
              style: TextStyle(
                  color: ColorState.textoffercolor,
                  fontSize: MyApp.h * .015,
                  fontWeight: FontWeight.bold),
            ),
          ),
          GestureDetector(
            onTap: () {
              homeController.tostmsgfun(msg: "added to favourites");
            },
            child: Icon(
              CupertinoIcons.heart,
              color: iswishlisted
                  ? ColorState.wishlistedcolor
                  : ColorState.nonwishlistedcolor,
            ),
          )
        ],
      ),
    );
  }

  Widget imagecard({required String imageurl}) {
    return SizedBox(
      height: MyApp.h * .15,
      width: MyApp.h * .15,
      child: SizedBox(
        height: MyApp.h * .05,
        width: MyApp.h * .05,
        child: CachedNetworkImage(
          imageUrl: imageurl,
          fit: BoxFit.contain,
          placeholder: (context, url) =>
              Center(child: CircularProgressIndicator(strokeWidth: 2)),
          errorWidget: (context, url, error) =>
              Icon(Icons.hide_image, color: ColorState.textfieldgraycolor),
        ),
      ),
    );
  }

  Widget _nameanpricedetails({
    required String name,
    required String offerprice,
    required String realprice,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: MyApp.w * .03),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: MyApp.w * .42,
            child: Text(
              "$name",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: RichText(
              maxLines: 1,
              text: TextSpan(children: [
                TextSpan(
                    text: "AED",
                    style: TextStyle(
                        decoration: TextDecoration.lineThrough,
                        decorationColor: ColorState.textrealcolor,
                        color: ColorState.textfieldgraycolor)),
                TextSpan(
                    text: "$realprice",
                    style: TextStyle(
                        overflow: TextOverflow.ellipsis,
                        color: ColorState.textrealcolor,
                        decoration: TextDecoration.lineThrough,
                        fontWeight: FontWeight.bold)),
              ]),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: RichText(
              maxLines: 1,
              text: TextSpan(children: [
                TextSpan(
                    text: "AED ",
                    style: TextStyle(color: ColorState.textfieldgraycolor)),
                TextSpan(
                    text: "$offerprice",
                    style: TextStyle(
                        overflow: TextOverflow.ellipsis,
                        color: ColorState.textrealcolor,
                        fontWeight: FontWeight.bold)),
                TextSpan(
                    text: " per Dozen",
                    style: TextStyle(
                      fontSize: MyApp.h * .015,
                      color: ColorState.textblackcolor,
                    )),
              ]),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buttons({required int cartcount}){
    return Padding(
      padding: EdgeInsets.only(
          bottom: MyApp.h * .01,
          left: MyApp.w * .02,
          right: MyApp.w * .02),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              homeController.tostmsgfun(msg: "RQF done");
            },
            child: Container(
              height: MyApp.h * .05,
              width: MyApp.w * .15,
              decoration: BoxDecoration(
                  border: Border.all(
                      color: ColorState.buttonbordercolor),
                  color: ColorState.buttonrqfcolor,
                  borderRadius:
                  BorderRadius.circular(MyApp.h * .05)),
              child: Center(
                child: Text(
                  "RQF",
                  style: TextStyle(
                      color: ColorState.textblackcolor,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          SizedBox(
            width: MyApp.w * .02,
          ),
          Expanded(
            child: ((cartcount)) >
                0
                ? Container(
              height: MyApp.h * .05,
              decoration: BoxDecoration(
                  color: ColorState.buttonaddtocardcolor,
                  borderRadius: BorderRadius.circular(
                      MyApp.h * .05)),
              child: Row(
                children: [
                  IconButton(
                      onPressed: () {
                        homeController.tostmsgfun(msg: "Removed from fav");
                      },
                      icon: Icon(
                        CupertinoIcons.minus,
                        color: ColorState.textwhitecolor,
                      )),
                  Text("$cartcount",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: ColorState.textwhitecolor),
                  ),
                  IconButton(
                      onPressed: () {
                        homeController.tostmsgfun(msg: "Added to fav");
                      },
                      icon: Icon(
                        CupertinoIcons.add,
                        color: ColorState.textwhitecolor,
                      )),
                ],
              ),
            )
                : GestureDetector(
              onTap: () {
                homeController.tostmsgfun(msg: "Added to fav");
              },
              child: Container(
                height: MyApp.h * .05,
                decoration: BoxDecoration(
                    color:
                    ColorState.buttonaddtocardcolor,
                    borderRadius: BorderRadius.circular(
                        MyApp.h * .05)),
                child: Center(
                    child: Text(
                      "Add to Cart",
                      style: TextStyle(
                          color: ColorState.textwhitecolor,
                          fontWeight: FontWeight.w400,
                          fontSize: MyApp.h * .015),
                    )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
