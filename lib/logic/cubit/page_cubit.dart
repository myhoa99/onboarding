import 'package:bloc/bloc.dart';

part 'page_state.dart';

class PageCubit extends Cubit<PageState> {
  PageCubit() : super(PageState(pageIndex: 0));

  void changePage(index) => emit(PageState(pageIndex: index));
}
