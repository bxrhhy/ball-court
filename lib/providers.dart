import 'package:ball_court/models/counter.dart';
import 'package:ball_court/models/flash_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final counterProvider = ChangeNotifierProvider<Counter>((ref) =>Counter());

///开屏广告
final flashProvider = ChangeNotifierProvider<FlashModel>((ref) => FlashModel());
