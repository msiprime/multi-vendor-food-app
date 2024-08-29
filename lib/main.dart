import 'package:multi_vendor_food_app/app/app.dart';
import 'package:multi_vendor_food_app/bootstrap.dart';

void main() async {
  await bootstrap(() async => const AppView());
}
