import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:circle_talk_mob/models/post_model.dart';
import 'package:circle_talk_mob/views/home.dart';
import 'package:circle_talk_mob/views/widget/posted_data_widget.dart';

class MockPostController extends GetxController {
  Rx<List<PostModel>> posts = Rx<List<PostModel>>([]);
  RxBool isLoading = false.obs;

  void setPosts(List<PostModel> newPosts) {
    posts.value = newPosts;
  }
}

void main() {
  testWidgets('HomePage displays posts with spacing', (WidgetTester tester) async {
    final mockController = MockPostController();
    final samplePosts = [
      PostModel(
        id: 1,
        content: 'Post 1',
        user: User(name: 'User 1', email: 'user1@example.com'),
      ),
      PostModel(
        id: 2,
        content: 'Post 2',
        user: User(name: 'User 2', email: 'user2@example.com'),
      ),
    ];
    mockController.setPosts(samplePosts);

    Get.put<MockPostController>(mockController);

    await tester.pumpWidget(
      GetMaterialApp(
        home: HomePage(),
      ),
    );

    await tester.pumpAndSettle();

    // Verify that two PostedData widgets are found
    expect(find.byType(PostedData), findsNWidgets(2));

    // Verify that there is spacing (SizedBox) between the posts
    expect(find.byType(SizedBox), findsWidgets);

    // Optionally, verify the spacing height
    final sizedBoxes = tester.widgetList<SizedBox>(find.byType(SizedBox));
    bool hasSpacing = sizedBoxes.any((sb) => sb.height == 10);
    expect(hasSpacing, true);
  });
}
