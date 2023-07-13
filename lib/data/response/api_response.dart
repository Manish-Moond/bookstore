import 'package:bookstore/core/enums/data_state.dart';

class ApiResponse<T> {
  Status? status;
  T? data;
  String? message;

  // T get Resdata => data!;
  T getData() {
    return data!;
  }

  ApiResponse(this.status, this.data, this.message);

  ApiResponse.uninitialzed() : status = Status.UNINITIALIZED;

  ApiResponse.refreshing() : status = Status.REFRESHING;

  ApiResponse.initialFetching() : status = Status.INITIAL_FETCHING;

  ApiResponse.fetching() : status = Status.FETCHING;

  ApiResponse.moreFetcing() : status = Status.MORE_FETCHING;

  ApiResponse.fetched(this.data) : status = Status.FETCHED;

  ApiResponse.noMoreData() : status = Status.NO_MORE_DATA;

  ApiResponse.error(this.message) : status = Status.ERROR;

  @override
  String toString() {
    return "Status : $status \n Message : $message \n Data: $data";
  }
}
