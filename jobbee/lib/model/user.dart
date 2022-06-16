class User {
  final String imagePath;
  final String name;
  final String skill;
  final String email;
  final String education;
  final String educationInfo;
  final String address;
  final String phone;
  final String experience;

  const User({
    required this.imagePath,
    required this.name,
    required this.skill,
    required this.email,
    required this.education,
    required this.educationInfo,
    required this.address,
    required this.phone,
    required this.experience,
  });
}

class UserInfo {
  static const myUser = User(
      imagePath:
          'https://res.cloudinary.com/dzxxq4dgq/image/upload/v1655283928/download_txfsjs.jpg',
      name: 'Humyai Sus',
      phone: '096879546545',
      address: 'Bangcock 201923',
      education: 'Ungraduated',
      educationInfo: 'Computer Science Radchapatt EWWWWWWW',
      email: 'ggewww@gmail.com',
      skill: 'Vue,React,Nodejs,Suicide',
      experience: 'Backend Engineer@Google');
}
