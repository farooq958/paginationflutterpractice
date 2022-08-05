part of 'paginated_controller_cubit.dart';

@immutable
abstract class PaginatedControllerState {}

class PaginatedControllerInitial extends PaginatedControllerState {}
class PaginatedControllerLoaded extends PaginatedControllerState {
  PaginatedModel pg;
  PaginatedControllerLoaded({required this.pg});

}

class PaginatedControllerException extends PaginatedControllerState {}