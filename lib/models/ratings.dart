import 'package:flutter/foundation.dart';

class Ratings {
  final double allTimeEditPercent;
  final double editsThisWeekPercent;
  final String allTimeEditValue;
  final String editsThisWeekValue;
  final String leadingUserDetails;
  final String leadingUserImage;

  Ratings({
    @required this.allTimeEditPercent,
    @required this.editsThisWeekPercent,
    @required this.allTimeEditValue,
    @required this.editsThisWeekValue,
    @required this.leadingUserDetails,
    @required this.leadingUserImage,
  });
}

class RatingsData with ChangeNotifier {
  final List<Ratings> _ratings = [
    Ratings(
      allTimeEditPercent: 0.2,
      editsThisWeekPercent: 0.8,
      allTimeEditValue: "18,317",
      editsThisWeekValue: "17,822",
      leadingUserDetails: "Steve Jobs",
      leadingUserImage:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQpS_JhCSS9HJSQvskoWCZDHnODuf19YaU38w&usqp=CAU",
    ),
    Ratings(
      allTimeEditPercent: 0.9,
      editsThisWeekPercent: 0.6,
      allTimeEditValue: "1,857,804",
      editsThisWeekValue: "9,360",
      leadingUserDetails: "Bill Gates",
      leadingUserImage:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTPl0OJCLtpFvSfzAVojfUtPIDPerOD-JreIQ&usqp=CAU",
    ),
    Ratings(
      allTimeEditPercent: 0.2,
      editsThisWeekPercent: 0.7,
      allTimeEditValue: "164,566",
      editsThisWeekValue: "6,024",
      leadingUserDetails: "Elon Musk",
      leadingUserImage:
          "https://thumbor.forbes.com/thumbor/fit-in/416x416/filters%3Aformat%28jpg%29/https%3A%2F%2Fspecials-images.forbesimg.com%2Fimageserve%2F5f47d4de7637290765bce495%2F0x0.jpg%3Fbackground%3D000000%26cropX1%3D1398%26cropX2%3D3908%26cropY1%3D594%26cropY2%3D3102",
    ),
    Ratings(
      allTimeEditPercent: 0.4,
      editsThisWeekPercent: 0.6,
      allTimeEditValue: "287,615",
      editsThisWeekValue: "3,585",
      leadingUserDetails: "Mark Zuckerberg",
      leadingUserImage:
          "https://thumbor.forbes.com/thumbor/fit-in/416x416/filters%3Aformat%28jpg%29/https%3A%2F%2Fspecials-images.forbesimg.com%2Fimageserve%2F5c76b7d331358e35dd2773a9%2F0x0.jpg%3Fbackground%3D000000%26cropX1%3D0%26cropX2%3D4401%26cropY1%3D0%26cropY2%3D4401",
    ),
    Ratings(
      allTimeEditPercent: 0.5,
      editsThisWeekPercent: 0.5,
      allTimeEditValue: "4,933",
      editsThisWeekValue: "3,074",
      leadingUserDetails: "Jeff Bezos",
      leadingUserImage:
          "https://www.biography.com/.image/c_fill%2Ccs_srgb%2Cfl_progressive%2Ch_400%2Cq_auto:good%2Cw_620/MTY2NzA3ODE3OTgwMzcyMjYw/jeff-bezos-andrew-harrer_bloomberg-via-getty-images.jpg",
    ),
    Ratings(
      allTimeEditPercent: 0.2,
      editsThisWeekPercent: 0.8,
      allTimeEditValue: "10,535",
      editsThisWeekValue: "10,327",
      leadingUserDetails: "Larry Page",
      leadingUserImage:
          "https://thumbor.forbes.com/thumbor/fit-in/416x416/filters%3Aformat%28jpg%29/https%3A%2F%2Fspecials-images.forbesimg.com%2Fimageserve%2F5c76bcaaa7ea43100043c836%2F0x0.jpg%3Fbackground%3D000000%26cropX1%3D227%26cropX2%3D2022%26cropY1%3D22%26cropY2%3D1817",
    ),
    Ratings(
      allTimeEditPercent: 0.9,
      editsThisWeekPercent: 0.6,
      allTimeEditValue: "1,575,659",
      editsThisWeekValue: "7,551",
      leadingUserDetails: "Sergey Brin",
      leadingUserImage:
          "https://thumbor.forbes.com/thumbor/fit-in/416x416/filters%3Aformat%28jpg%29/https%3A%2F%2Fspecials-images.forbesimg.com%2Fimageserve%2F5c7d7c254bbe6f78090d831f%2F0x0.jpg%3Fbackground%3D000000%26cropX1%3D475%26cropX2%3D2887%26cropY1%3D168%26cropY2%3D2582",
    ),
    Ratings(
      allTimeEditPercent: 0.2,
      editsThisWeekPercent: 0.7,
      allTimeEditValue: "34,816",
      editsThisWeekValue: "4,904",
      leadingUserDetails: "Gary Vaynerchuk",
      leadingUserImage:
          "https://thumbor.forbes.com/thumbor/fit-in/416x416/filters%3Aformat%28jpg%29/https%3A%2F%2Fspecials-images.forbesimg.com%2Fimageserve%2F5a3407f64bbe6f192f088338%2F0x0.jpg%3Fbackground%3D000000%26cropX1%3D205%26cropX2%3D1569%26cropY1%3D130%26cropY2%3D1494",
    ),
    Ratings(
      allTimeEditPercent: 0.2,
      editsThisWeekPercent: 0.6,
      allTimeEditValue: "277,237",
      editsThisWeekValue: "3,301",
      leadingUserDetails: "Ritesh Agarwal",
      leadingUserImage:
          "https://thumbor.forbes.com/thumbor/fit-in/416x416/filters%3Aformat%28jpg%29/https%3A%2F%2Fi.forbesimg.com%2Fmedia%2Flists%2Fpeople%2Fritesh-agarwal_416x416.jpg",
    ),
    Ratings(
      allTimeEditPercent: 0.8,
      editsThisWeekPercent: 0.6,
      allTimeEditValue: "1,568,279",
      editsThisWeekValue: "2,744",
      leadingUserDetails: "Kunal Shah",
      leadingUserImage:
          "https://media-exp1.licdn.com/dms/image/C5103AQGhibvt-cfcjA/profile-displayphoto-shrink_200_200/0?e=1610582400&v=beta&t=gM1CMRCZ9ZP5sWKhF21ZaN9bgMUhTQJd-iOeipXL8_4",
    ),
  ];

  List<Ratings> get ratings {
    return [..._ratings];
  }
}
