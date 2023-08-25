
import 'package:equatable/equatable.dart';

class NavBarItem extends Equatable {
  final String selectedIconPath;
  final String iconPath;
  final String title;

  const NavBarItem(
      {required this.selectedIconPath,
      required this.iconPath,
      required this.title});

  @override
  List<Object?> get props => [title];
}

