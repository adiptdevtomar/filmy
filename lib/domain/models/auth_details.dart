class AuthDetails {
  final String name;
  final String emailId;
  final String avatarUrl;

  AuthDetails({
    required this.name,
    required this.emailId,
    required this.avatarUrl,
  });

  Map<String, dynamic> toJson() => {
        'name': name,
        'emailId': emailId,
        'avatarUrl': avatarUrl,
      };

  factory AuthDetails.fromJson(Map<String, dynamic> json) => AuthDetails(
        name: json['name'],
        emailId: json['emailId'],
        avatarUrl: json['avatarUrl'],
      );
}
