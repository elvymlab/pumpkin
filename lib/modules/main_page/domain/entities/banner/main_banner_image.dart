import 'package:equatable/equatable.dart';

class MainBannerImages extends Equatable {
  const MainBannerImages({
    required this.mobile,
    required this.tablet,
    required this.flex,
  });

  final String mobile;
  final String tablet;
  final int flex;



  @override
  List<Object> get props => [mobile, tablet];
}
