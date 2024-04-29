import '../entities/contact_entity.dart';

class ContactModel extends ContactEntity {
  const ContactModel({
    super.id,
    required super.emails,
    required super.phoneNumbers,
    required super.urlSites,
  });

  factory ContactModel.fromJson(Map<String, dynamic> json) {
    return ContactModel(
      id: json['id'],
      emails: List<String>.from(json['emails'].map((e) => e)),
      phoneNumbers: List<String>.from(json['phoneNumbers'].map((e) => e)),
      urlSites: List<String>.from(json['urlSites'].map((e) => e)),
    );
  }
  factory ContactModel.fromEntity(ContactEntity entity) {
    return ContactModel(
      id: entity.id,
      emails: entity.emails,
      phoneNumbers: entity.phoneNumbers,
      urlSites: entity.urlSites,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "emails": emails,
      "phoneNumbers": phoneNumbers,
      "urlSites": urlSites,
    };
  }
}
