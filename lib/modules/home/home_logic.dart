import 'package:get/get.dart';
import 'package:my_widgets/my_widgets.dart';
import 'package:my_widgets/services/http_calls.dart';
import 'package:new_app/modules/model/my_view_response_model.dart';
import '../../s.dart';
import '../blog_detail/blog_detail_view.dart';
import '../categories/categories_view.dart';
import '../model/top_heading_model.dart';

class HomeLogic extends GetxController{

  List<TopHeadlinesModel> listTopHeadlines = [];

  ChannelsList selectedChannel = ChannelsList.bbcnews;

  bool isLoading = false;

  List<ChannelsList> listChannels = ChannelsList.values;


  @override
  void onInit() {
    getTopHeading();
    super.onInit();
  }


  void onBlogTap(TopHeadlinesModel item) {
    pSetRout(page: ()=>BlogDetailView(blogData: item,));
  }

  void onIconTap(TopHeadlinesModel item) {
    pSetRout(page: ()=>BlogDetailView(blogData: item,));
  }

  getTopHeading() async {
    isLoading = true;
    update();
    MyViewResponse  response =  MyViewResponse.fromJson(await HttpCalls.callGetApi('top-headlines?sources=${selectedChannel.value}&apiKey=${S.apiKey}', token: '',hasAuth: false, defaultResponse: false,));
    if(response.status == 'ok'){
      listTopHeadlines.assignAll(topHeadlinesModelFromJson(response.data));
      update();
    }else{
       pShowToast(message: 'Something Wrong');
    }
    isLoading = false;
    update();
  }

  void onSelectChannel(ChannelsList value) {
    selectedChannel = value;
    update();
    getTopHeading();
  }

  void onCategoryIconTap() {
    pSetRout(page: ()=>const CategoriesView());
  }
}