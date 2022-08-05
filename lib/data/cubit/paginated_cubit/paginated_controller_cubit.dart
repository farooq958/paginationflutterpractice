import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:paginatedapi/data/model/paginatedmodel/paginated_model.dart';
import 'package:paginatedapi/data/repo/paginated_repo/pagination_repo.dart';

part 'paginated_controller_state.dart';

class PaginatedControllerCubit extends Cubit<PaginatedControllerState> {
  PaginatedControllerCubit() : super(PaginatedControllerInitial());

  getData(int pageNo) async {
    if (pageNo == 1) {
      emit(PaginatedControllerInitial());
    }
    var data = await PaginatedRepository().getPaginatedData(pageNo);

    emit(PaginatedControllerLoaded(pg: data!));
  }
}
