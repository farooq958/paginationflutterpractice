import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:paginatedapi/data/cubit/paginated_cubit/paginated_controller_cubit.dart';

import '../../data/model/paginatedmodel/paginated_model.dart';

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
                return Text("Nodata found");
              }, itemBuilder: (context, user, index) {
                return Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  height: 200,
                  width: width / 1.5,
                  decoration: const BoxDecoration(
                      boxShadow: [
                        //color: Colors.white, //background color of box
                        BoxShadow(
                          color: Colors.blueAccent,
                          blurRadius: 25.0, // soften the shadow
                          spreadRadius: 5.0, //extend the shadow
                          offset: Offset(
                            15.0, // Move to right 10  horizontally
                            15.0, // Move to bottom 10 Vertically
                          ),
                        )
                      ],
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          bottomLeft: Radius.circular(30)),
                      color: Colors.grey),
                  child: ListView(
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      Center(
                        child: Text(
                          'Username  ${user.username}',
                          style: const TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.01,
                      ),
                      Row(
                        children: <Widget>[
                          Flexible(
                            child: SizedBox(
                              height: 120,
                              width: width,
                              child: Card(
                                color: Colors.lightGreen.withOpacity(0.5),
                                shadowColor: Colors.tealAccent,
                                elevation: 20,
                                child: ListView(
                                  physics: const NeverScrollableScrollPhysics(),
                                  children: <Widget>[
                                    Text(
                                      'Email  ${user.email}',
                                      style: TextStyle(
                                          color: Colors.deepPurple
                                              .withOpacity(0.9)),
                                    ),
                                    SizedBox(
                                      height: height * 0.01,
                                    ),
                                    Text('Address  ${user.address.city}',
                                        style: TextStyle(
                                            color: Colors.deepPurple
                                                .withOpacity(0.8))),
                                    SizedBox(
                                      height: height * 0.01,
                                    ),
                                    Text(
                                      'Id  ${user.id}',
                                      style: const TextStyle(
                                          color: Colors.deepPurple),
                                    ),
                                    SizedBox(
                                      height: height * 0.01,
                                    ),
                                    Text('State   ${user.address.state}',
                                        style: TextStyle(
                                            color: Colors.deepPurple
                                                .withOpacity(0.8))),
                                    SizedBox(
                                      height: height * 0.01,
                                    ),
                                    Text(
                                        'Postal Code  ${user.address.postalCode}',
                                        style: TextStyle(
                                            color: Colors.deepPurple
                                                .withOpacity(0.8))),
                                    SizedBox(
                                      height: height * 0.01,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: SizedBox(
                              height: 90,
                              width: 70,
                              child: CircleAvatar(
                                //  minRadius: 40,
                                child: Image.network(
                                  user.image,
                                  height: 100,
                                  width: 100,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                );
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
