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
      name: "Zamzam Nurahman",
      userName: "zamznn",
      email: "2006126@itg.ac.id",
      profileImage: "https://asianwiki.com/images/3/35/Moon_Tae-Yoo-p1.jpg",
      phoneNumber: "081511548595",
    );
  }
}
