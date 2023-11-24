class MyViewResponse {
  MyViewResponse({
    this.message = '',
    this.data,
    this.status = '',
  });

  dynamic data;
  String message;
  String status;

  factory MyViewResponse.fromJson(Map<String, dynamic> json) => MyViewResponse(
    message: json["message"]??json["Message"]??'No message from server',
    data: json["articles"]??json["sources"],
    status: json["status"],
  );

}


