import 'package:equatable/equatable.dart';

class ButtonFontSize extends Equatable {
  const ButtonFontSize({
    required this.tabletSize,
    required this.mobileSize,
  });

  final int? tabletSize;
  final int? mobileSize;

  @override
  List<Object?> get props => [tabletSize, mobileSize];
}
