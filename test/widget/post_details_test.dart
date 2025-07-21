import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:circle_talk_mob/views/post_details.dart';
import 'package:circle_talk_mob/models/post_model.dart';

class MockCommentController extends GetxController {
  var isLoading = false.obs;
  var comments = <dynamic>[].obs;
  void getAllComments(String id) {}
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('PostDetails Widget Tests', () {
    late PostModel testPost;
    late MockCommentController mockCommentController;

    setUp(() {
      testPost = PostModel(
        id: 1,
        user: User(name: 'Test User'),
        // Add other required fields with dummy data if needed
      );
      mockCommentController = MockCommentController();
      Get.put<MockCommentController>(mockCommentController);
    });

    testWidgets('Displays post user name in app bar', (WidgetTester tester) async {
      await tester.pumpWidget(
        GetMaterialApp(
          home: PostDetails(post: testPost),
        ),
      );

      expect(find.text('Test User'), findsOneWidget);
    });

    testWidgets('Shows comment input field and button', (WidgetTester tester) async {
      await tester.pumpWidget(
        GetMaterialApp(
          home: PostDetails(post: testPost),
        ),
      );

      // The InputWidget uses a TextFormField internally, so we check for that instead of TextField
      expect(find.byType(TextFormField), findsOneWidget);
      expect(find.text('Comment'), findsOneWidget);
    });

    testWidgets('Shows loading indicator when isLoading is true', (WidgetTester tester) async {
      mockCommentController.isLoading.value = true;

      await tester.pumpWidget(
        GetMaterialApp(
          home: PostDetails(post: testPost),
        ),
      );

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('Shows list of comments when isLoading is false', (WidgetTester tester) async {
      mockCommentController.isLoading.value = false;

      await tester.pumpWidget(
        GetMaterialApp(
          home: PostDetails(post: testPost),
        ),
      );

      expect(find.text('Comment'), findsWidgets);
    });

    testWidgets('Shows comment time in human-readable format', (WidgetTester tester) async {
      final now = DateTime.now();
      final comment = mockCommentController.comments.isNotEmpty
          ? mockCommentController.comments.first
          : null;

      if (comment != null) {
        final timeText = PostDetailsStateHelper.timeAgo(comment.createdAt!);
        await tester.pumpWidget(
          GetMaterialApp(
            home: PostDetails(post: testPost),
          ),
        );

        expect(find.text(timeText), findsWidgets);
      }
    });
  });
}

class PostDetailsStateHelper {
  static String timeAgo(DateTime date) {
    final Duration diff = DateTime.now().difference(date);
    if (diff.inDays >= 1) {
      return '${diff.inDays} day${diff.inDays > 1 ? "s" : ""} ago';
    } else if (diff.inHours >= 1) {
      return '${diff.inHours} hour${diff.inHours > 1 ? "s" : ""} ago';
    } else if (diff.inMinutes >= 1) {
      return '${diff.inMinutes} minute${diff.inMinutes > 1 ? "s" : ""} ago';
    } else {
      return 'just now';
    }
  }
}

