part of 'clicker_bloc.dart';

class ClickerState extends Equatable {
  final int clicksCount;
  final Color currentColor;

  @override
  List<Object?> get props => [currentColor, clicksCount];

  String get currentColorHex {
    return ColorUtils.colorToHex(currentColor);
  }

  bool get isColorLight {
    return ColorUtils.isColorLight(currentColor);
  }

  Color get extraColor {
    if (isColorLight) return Colors.black87;

    return Colors.white70;
  }

  const ClickerState({
    this.clicksCount = 0,
    this.currentColor = Colors.white,
  });

  ClickerState copyWith({
    Color? currentColor,
    int? clicksCount,
  }) {
    return ClickerState(
      currentColor: currentColor ?? this.currentColor,
      clicksCount: clicksCount ?? this.clicksCount,
    );
  }
}
