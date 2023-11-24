import 'package:get/get.dart';
import 'package:my_widgets/my_widgets.dart';
import 'package:my_widgets/services/http_calls.dart';
import 'package:new_app/modules/blog_detail/blog_detail_logic.dart';
import 'package:new_app/modules/blog_detail/blog_detail_view.dart';
import 'package:new_app/modules/model/my_view_response_model.dart';

import '../../s.dart';
import '../model/top_heading_model.dart';

class CategoriesLogic extends GetxController{


  bool isLoading = false;

  List<TopHeadlinesModel> listCategoriesNews = [];
  List<Category> listCategories = Category.values;
  Category selectedCategory = Category.GENERAL;

  getListByCategory() async {
    isLoading = true;
    update();
    MyViewResponse response = MyViewResponse.fromJson(await HttpCalls.callGetApi('everything?q=${selectedCategory.name}&apiKey=${S.apiKey}', token: '',hasAuth: false,defaultResponse: false,));
    if(response.status == 'ok'){
      listCategoriesNews.assignAll(topHeadlinesModelFromJson(response.data));
      update();
    }else{
      pShowToast(message: 'Something Wrong');
    }
    isLoading = false;
    update();
  }

  @override
  void onInit() {
    getListByCategory();
    super.onInit();
  }

  SelectCategory(Category item) {
    selectedCategory = item;
    update();
    getListByCategory();
  }

  onBlogTap(TopHeadlinesModel item) {
    pSetRout(page: ()=>BlogDetailView(blogData: item,));
  }
}