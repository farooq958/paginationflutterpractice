import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:paginatedapi/data/cubit/paginated_cubit/paginated_controller_cubit.dart';

import '../../data/model/paginatedmodel/paginated_model.dart';
import '../custom_widgets/user_detail_card.dart';

class PaginationView extends StatefulWidget {
  PaginationView({Key? key}) : super(key: key);
  int pageNo = 0;

  @override
  State<PaginationView> createState() => _PaginationViewState();
}

class _PaginationViewState extends State<PaginationView> {
  final PagingController<int, User> _pagingController =
      PagingController(firstPageKey: 0);
  @override
  void initState() {
    // TODO: implement initState
    widget.pageNo = 1;
    context.read<PaginatedControllerCubit>().getData(widget.pageNo);
    _pagingController.addPageRequestListener((pageKey) {
      context.read<PaginatedControllerCubit>().getData(pageKey);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: BlocConsumer<PaginatedControllerCubit, PaginatedControllerState>(
          listener: (context, state) {
        if (state is PaginatedControllerLoaded) {
          final isLastPage = state.pg.total > widget.pageNo;
          if (!isLastPage) {
            _pagingController.appendLastPage(state.pg.users);
          } else {
            final nextPageKey = ++widget.pageNo;
            _pagingController.appendPage(state.pg.users, nextPageKey);
          }
        }
      },
          // TODO: implement listener
          builder: (context, state) {
        if (state is PaginatedControllerLoaded) {
          return SizedBox(
            height: height,
            width: width,
            child: PagedListView(
              builderDelegate: PagedChildBuilderDelegate<User>(
                  noItemsFoundIndicatorBuilder: (context) {
                return const Text("Nodata found");
              }, itemBuilder: (context, user, index) {
                return userDetailCard(width, user, height);
              }),
              pagingController: _pagingController,
            ),
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      }),
    );
  }


}
