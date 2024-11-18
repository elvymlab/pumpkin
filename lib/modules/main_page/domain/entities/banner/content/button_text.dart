import 'package:equatable/equatable.dart';
import 'package:pumpkin/modules/main_page/domain/entities/banner/content/button_font_size.dart';

class ButtonText extends Equatable {
  const ButtonText({
    required this.text,
    required this.fontSizes,
  });

  final String text;
  final ButtonFontSize fontSizes;

  @override
  List<Object> get props => [text, fontSizes];
}
