/// Enum of routes.
enum RouteConst {
  splash,
  home,
}

///Route values can be accessed by
///obtaining raw values through the plugin.
extension RouteExt on RouteConst {
  String get rawValue {
    switch (this) {
      case RouteConst.splash:
        return "/";
      case RouteConst.home:
        return "/home";
    }
  }
}
