class User {
  final int id;
  final String name;
  final String userName;
  final String email;
  final String? profileImage;
  final String? phoneNumber;

  User({
    required this.id,
    required this.name,
    required this.userName,
    required this.email,
    this.profileImage,
    this.phoneNumber,
  });

  ///[* data profile]
  factory User.dummy() {
    return User(
      id: 027,
      name: "Syifa Fauziah",
      userName: "syf29",
      email: "2006133@itg.ac.id",
      profileImage:
          "https://elcomercio.pe/resizer/6WLmwm9JYadAxuPwWAjQgC7H2_w=/1200x900/smart/filters:format(jpeg):quality(75)/cloudfront-us-east-1.images.arcpublishing.com/elcomercio/KZ77ZLDIVJENBJU2K6HDULS7ZI.jpg",
      phoneNumber: "081511548595",
    );
  }
}
