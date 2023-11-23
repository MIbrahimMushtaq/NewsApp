class MyViewResponse {
  MyViewResponse({
    this.message = '',
    this.data,
    this.statusCode = 0,
  });

  dynamic data;
  String message;
  int? statusCode;

  factory MyViewResponse.fromJson(Map<String, dynamic> json) => MyViewResponse(
    message: json["message"]??json["Message"]??'No message from server',
    data: json["entity"]??json["entities"],
    statusCode: json["statusCode"]??0,
  );

}


