import '../entities/contact_entity.dart';

class ContactModel extends ContactEntity {
  const ContactModel({
    super.email,
    super.phoneNumber,
    super.urlSite,
    super.whatsapp,
  });

  factory ContactModel.fromJson(Map<String, dynamic> json) {
    return ContactModel(
      email: json['emails'],
      phoneNumber: json['phonenumbers'],
      urlSite: json['uRls'],
      whatsapp: json['whatsapp'] ?? json['whatsappNumber'],
    );
  }

  factory ContactModel.fromEntity(ContactEntity entity) {
    return ContactModel(
      email: entity.email,
      phoneNumber: entity.phoneNumber,
      urlSite: entity.urlSite,
      whatsapp: entity.whatsapp,
    );
  }
}
