import '../entities/contact_entity.dart';

class ContactModel extends ContactEntity {
  const ContactModel({
    super.id,
    super.email,
    super.phoneNumber,
    super.urlSite,
  });

  factory ContactModel.fromJson(Map<String, dynamic> json) {
    return ContactModel(
      id: json['id'],
      email: json['email'],
      phoneNumber: json['phoneNumber'],
      urlSite: json['url'],
    );
  }

  factory ContactModel.fromEntity(ContactEntity entity) {
    return ContactModel(
      id: entity.id,
      email: entity.email,
      phoneNumber: entity.phoneNumber,
      urlSite: entity.urlSite,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "email": email,
      "phoneNumber": phoneNumber,
      "urlSite": urlSite,
    };
  }
}
