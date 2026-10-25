import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:restaurant_menu/main.dart';

void main() {
  testWidgets('Each food card opens its details and returns to the menu', (
    tester,
  ) async {
    tester.view.physicalSize = const Size(390, 844);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(const MyApp());

    const expectedFoods = [
      ('Italian Pizza', 'assets/images/pizza.jpg', 'An Italian-style pizza'),
      ('Carbonara', 'assets/images/carbonara.jpg', 'An Italian pasta dish'),
      (
        'Tomato Caprese',
        'assets/images/tomato_caprese.jpg',
        'A fresh Italian salad',
      ),
    ];

    for (final (name, imagePath, descriptionStart) in expectedFoods) {
      final card = find.ancestor(
        of: find.text(name),
        matching: find.byType(Card),
      );
      await tester.ensureVisible(card);
      await tester.tap(card);
      await tester.pumpAndSettle();

      expect(find.byType(FoodDetailsPage), findsOneWidget);
      expect(find.text(name), findsNWidgets(2));
      expect(find.textContaining(descriptionStart), findsOneWidget);
      final image = tester.widget<Image>(find.byType(Image));
      expect((image.image as AssetImage).assetName, imagePath);
      expect(tester.takeException(), isNull);

      await tester.pageBack();
      await tester.pumpAndSettle();
      expect(find.text('Restaurant Menu'), findsOneWidget);
      expect(find.byType(FoodDetailsPage), findsNothing);
      expect(tester.takeException(), isNull);
    }
  });
}
