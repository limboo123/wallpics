
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:rest/view_model/home_view_model.dart';
class HomeView extends StatelessWidget {
  HomeView({super.key});

  List<Tab> categories = [
    Tab(
      text: "NATURE",
    ),
    Tab(
      text: "CITY",
    ),
    Tab(
      text: "ANIMAL",
    ),
    Tab(
      text: "ART",
    ),
    Tab(
      text: "FLOWERS",
    ),
    Tab(
      text: "CARS",
    ),
  ];

  HomeViewModel ms = Get.put(HomeViewModel());
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: categories.length,
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text(
            "Wallpics",
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: Colors.black,
          bottom: TabBar(
            tabs: categories,
            indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.yellow
            ),
            unselectedLabelColor: Colors.white,
            isScrollable: true,
            indicatorWeight: 0,
            dividerColor: Colors.white,
            physics: BouncingScrollPhysics(),
            indicatorSize: TabBarIndicatorSize.tab,
            labelColor: Colors.black,
          ),
        ),
        body: TabBarView(
          children: categories.map((tab) => customGridView(tab.text!.toLowerCase())).toList(),
        ),
      ),
    );
  }
  Widget customGridView(String category) {
    ms.vmGetwallpaperData(category);
    return GetBuilder<HomeViewModel>(
      builder: (_) {
        if(ms.isLoading) {
          return Center(child: CircularProgressIndicator(),);
        } else if(ms.wallpapers[category] == null) {
          return Center(child: Text("No data found"),);
        } else {
          return MasonryGridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 5,
            mainAxisSpacing: 5,
            itemCount: ms.vmWallpapers(category).length,
            itemBuilder: (context, index) {
              final photo = ms.vmWallpapers(category)[index];
              return GestureDetector(
                onTap: (){
                  Get.toNamed('/details', arguments: photo);
                },
                child: Hero(
                  tag: '${photo.image}',
                  child: Container(
                    height: (index % 3 + 2) * 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Color(
                        int.parse(photo.avg_color.replaceAll("#", "0xff")),
                      ),
                      image: DecorationImage(
                          image: NetworkImage("${photo.image}"),
                          fit: BoxFit.cover),
                    ),
                  ),
                ),
              );
            },
          );
        }
      },
    );
  }
}
