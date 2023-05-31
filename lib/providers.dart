import 'package:ball_court/models/flash_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


///开屏广告
final flashProvider = ChangeNotifierProvider<FlashModel>((ref) => FlashModel());
