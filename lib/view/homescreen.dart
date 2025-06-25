import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:webcastle/controller/homescreencontroller.dart';
import 'package:webcastle/core/color.dart';
import 'package:webcastle/main.dart';
import 'package:webcastle/widgets/headers.dart';
import 'package:webcastle/widgets/homewidgets/bannergrid.dart';
import 'package:webcastle/widgets/homewidgets/collections.dart';
import 'package:webcastle/widgets/homewidgets/homebanner.dart';
import 'package:webcastle/widgets/homewidgets/ourcategories.dart';
import 'package:webcastle/widgets/homewidgets/rqfandbanner.dart';
import 'package:webcastle/widgets/homewidgets/shopbybrands.dart';
import 'package:webcastle/widgets/search.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.put(HomeController());
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorState.textwhitecolor,
        body: Obx(() => homeController.homedataerror.value==false&&homeController.loginerror.value==false
          ?Column(
          children: [
            SizedBox(
              height: MyApp.h * .04,
            ),
            screenappbar(notifcount: homeController.homemodel?.data.notificationCount??0,),
            SizedBox(
              height: MyApp.h * .04,
            ),
            Search_widget(),
            SizedBox(
              height: MyApp.h * .04,
            ),
            Expanded(
              child: Obx(() {
                if (homeController.homedataloading.value) {
                  return Center(child: CircularProgressIndicator());
                }
                return ListView.builder(
                  itemCount:
                  homeController.homemodel?.data.homeFields.length ?? 0,
                  itemBuilder: (context, index) {
                    if(homeController.homemodel?.data.homeFields[index].type=="carousel")
                    {
                      return Homebanner(images: homeController.homemodel?.data.homeFields[index].carouselItems);
                    }
                    else if(homeController.homemodel?.data.homeFields[index].type=="brands")
                    {
                      return Shopbybrands(brandsimg: homeController.homemodel?.data.homeFields[index].brands,);
                    }
                    else if(homeController.homemodel?.data.homeFields[index].type=="category")
                    {
                      return Ourcategories(categories: homeController.homemodel?.data.homeFields[index].categories);
                    }
                    else if(homeController.homemodel?.data.homeFields[index].type=="collection")
                    {
                      return Collections(collections: homeController.homemodel?.data.homeFields[index],);
                    }
                    else if(homeController.homemodel?.data.homeFields[index].type=="banner-grid")
                    {
                      return Bannergrid(bannerdata: homeController.homemodel?.data.homeFields[index].banners,);
                    }
                    else if(homeController.homemodel?.data.homeFields[index].type=="rfq")
                    {
                      return Rqfandbanner(image: "${homeController.homemodel?.data.homeFields[index].image}",isrfq: true,);
                    }
                    else if(homeController.homemodel?.data.homeFields[index].type=="future-order")
                    {
                      return Rqfandbanner(image:  "${homeController.homemodel?.data.homeFields[index].image}");
                    }
                    else if(homeController.homemodel?.data.homeFields[index].type=="banner")
                    {
                      return Rqfandbanner(image:  "${homeController.homemodel?.data.homeFields[index].banner?.image}");
                    }
                    else
                    {
                      return SizedBox.shrink();
                    }
                  },
                );
              }),
            ),
          ],
        )
          :Center(child: Text("error in loading data"),),),
      ),
    );
  }
}
