import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:talker/talker.dart';

final talker = Talker(
  observers: [],
  settings: TalkerSettings(
    enabled: true,
    useHistory: true,
    maxHistoryItems: 100,
    useConsoleLogs: true,
  ),
  logger: TalkerLogger(
    settings: TalkerLoggerSettings(
      colors: {
        LogLevel.info: AnsiPen()..cyan(),
        LogLevel.good: AnsiPen()..green(),
      },
    ),
  ),
);

EdgeInsets defaultPadding =
    EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h);
