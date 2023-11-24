import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_widgets/my_widgets.dart';
import 'package:my_widgets/widgets/dividers.dart';
import 'package:my_widgets/widgets/loading.dart';
import 'package:my_widgets/widgets/txt.dart';
import 'package:new_app/main.dart';
import 'package:new_app/modules/categories/categories_logic.dart';

import '../../s.dart';
import '../home/home_view.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CategoriesLogic>(
        init: CategoriesLogic(),
        builder:(logic){
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          title: Txt('Categories',hasBold: true,fontSize: Siz.titleLarge,textColor: Clr.primaryColor,),
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child:  BackButton(color: Clr.primaryColor,),
          ),
        ),
        body: SafeArea(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                const MyDivider(),
                SizedBox(
                  height: deviceHeight*0.05,
                  child: ListView.builder(
                    itemCount: logic.listCategories.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      final item = logic.listCategories[index];
                    return InkWell(
                      onTap: ()=>logic.SelectCategory(item),
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 8),
                        margin: const EdgeInsets.only(right: 8),
                        alignment: Alignment.center,
                        decoration: pBoxDecoration(
                          hasBorder: true,
                          borderRadius: BorderRadius.circular(12),
                          color: logic.selectedCategory == item ?  Clr.primaryColor : Colors.transparent,
                          borderColor:logic.selectedCategory == item ? Clr.primaryColor : Clr.secondColor
                        ),

                        child: Center(child: Txt(item.name.capitalizeFirst,textColor: logic.selectedCategory == item ? Colors.white : Clr.secondColor,)),
                      ),
                    );
                  },),
                ),
                const MyDivider(),
                Expanded(
                  child: logic.isLoading ? const LoadingPro() : ListView.builder(
                      itemCount: logic.listCategoriesNews.length,
                      itemBuilder: (ctx,index){
                        final item = logic.listCategoriesNews[index];
                        return HomeView.buildPopularBlogTile(blogTitle: item.title,blogImage: item.urlToImage,date: item.publishedAt,onTap: ()=>logic.onBlogTap(item));
                      })
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
