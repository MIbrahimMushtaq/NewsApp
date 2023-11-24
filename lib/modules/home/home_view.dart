import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_widgets/my_widgets.dart';
import 'package:my_widgets/utils/dates.dart';
import 'package:my_widgets/widgets/dividers.dart';
import 'package:my_widgets/widgets/get_images.dart';
import 'package:my_widgets/widgets/loading.dart';
import 'package:my_widgets/widgets/txt.dart';
import '../../main.dart';
import '../../s.dart';
import 'home_logic.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeLogic>(
        init: HomeLogic(),
        builder:(logic){
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0.0,
              title: Txt(logic.selectedChannel.name,hasBold: true,fontSize: Siz.titleLarge,textColor: Clr.primaryColor,),
              actions: [
                PopupMenuButton<ChannelsList>(
                  initialValue: logic.selectedChannel,
                  // Callback that sets the selected popup menu item.
                  onSelected: logic.onSelectChannel,
                  itemBuilder: (BuildContext context) => <PopupMenuEntry<ChannelsList>>[
                    ...logic.listChannels.map((e) => PopupMenuItem<ChannelsList>(
                      value: e,
                      child: Txt(e.name),
                    ))
                  ],
                ),
              ],
              leading: IconButton(icon: Image.asset('assets/images/categoryicon.png',width: 24,height: 24,),onPressed: logic.onCategoryIconTap,),
              iconTheme: IconThemeData(color: Clr.primaryColor),
            ),
            body: SafeArea(
              child: Container(
                padding: EdgeInsets.all(Siz.standPadding),
                child:logic.isLoading? const LoadingPro() : SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: deviceHeight * 0.34,
                        child: ListView.builder(
                            itemCount: logic.listTopHeadlines.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (ctx,index){
                              final item = logic.listTopHeadlines[index];
                          return buildHorizontalTile(bgImage:item.urlToImage ,blogTitle:item.title,tileWidth: deviceWidth * 0.7 ,auther: item.author,onTap:()=>logic.onIconTap(item) );
                        }),
                  
                      ),
                      const MyDivider(),
                      const MyDivider(),
                      SizedBox(height: deviceHeight * 0.6,child:  ListView.builder(
                          itemCount: logic.listTopHeadlines.length,
                          itemBuilder: (ctx,index){
                            final item = logic.listTopHeadlines[index];
                            return buildPopularBlogTile(blogTitle: item.title,blogImage: item.urlToImage,date: item.publishedAt,onTap: ()=>logic.onBlogTap(item));
                          }))
                  
                  
                    ],
                  ),
                ),
              ),
            )
          );
        } );
  }
  buildHorizontalTile({String? bgImage,String? blogTitle,required double tileWidth,double? textSize,String? auther,Function()? onTap}){
    return Stack(
      children: [
        Container(
          width: tileWidth,
          height: deviceHeight *0.32,
          margin: const EdgeInsets.only(right: 12),
          decoration: pBoxDecoration(
            borderRadius: BorderRadius.circular(Siz.standMargin),
          ),
          child: GetImage(
            height: deviceHeight *0.32,
            imagePath:bgImage,
            fit: BoxFit.cover,
            onTap: (){},
          ) ,
        ),
        Positioned(
            bottom: deviceHeight *0.1,
            left: 20,
            child: Container(
              padding: const EdgeInsets.all(8.0),
              width: deviceWidth *0.58,
              decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(Siz.standMargin)
              ),
              child: Column(
                children: [
                  Txt(blogTitle,hasBold: true,fontSize: textSize??18,maxLine: 5,textColor: Colors.white,overflow: TextOverflow.ellipsis,),
                  const MyDivider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Expanded(child: Txt(auther,textColor: Clr.primaryColor,maxLine: 1, hasBold: true,checkOverFlow: true,overflow: TextOverflow.ellipsis,textAlign: TextAlign.end,))
                    ],
                  )
                ],
              ),

            )),
        Positioned(
            bottom: 0,
            right: 26,
            child: GestureDetector(
              onTap: onTap,
              child: CircleAvatar(
                backgroundColor: Clr.primaryColor,
                child: const Icon(Icons.arrow_forward,color: Colors.white,),
              ),
            ))
      ],
    );
  }
  static buildPopularBlogTile({String? blogImage, String? blogTitle,String? newsCompany,DateTime? date ,Function()? onTap}){
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: deviceHeight * 0.14,
        width: double.infinity,
        margin: const EdgeInsets.symmetric(vertical: 6),
        padding: EdgeInsets.all(Siz.standPadding - 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Siz.standMargin),
          border: Border.all(color: Clr.primaryColor),
        ),
        child: Row(
          children: [
            GetImage(isAssets: false,imagePath: blogImage,width: deviceWidth*0.23,),
            const MyVerticalDivider(),
            Expanded(child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Txt(blogTitle,maxLine: 3,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Txt(Dates.pGetDateTimeCustomFormat(date??DateTime.now(), 'yyyy-MMM-dd'),textColor: Clr.primaryColor,),
                  ],
                )
              ],
            ))

          ],
        ),

      ),
    );
  }
}
