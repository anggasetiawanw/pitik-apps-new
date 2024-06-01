const int PER_PAGE_LIMIT = 20;

class PaginatedResponse<T> {
  static const limit = PER_PAGE_LIMIT;

  final List<T> data;

  PaginatedResponse({required this.data});

  factory PaginatedResponse.fromJson(dynamic json, List<T> data, {Function(dynamic json)? fixture}) => PaginatedResponse(
        data: data,
      );
  @override
  String toString() {
    return 'PaginatedResponse(data:${data.length})';
  }
}
