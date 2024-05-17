import 'package:equatable/equatable.dart';

class ContactEntity extends Equatable {
  final String? email;
  final String? phoneNumber;
  final String? urlSite;
  final String? whatsapp;

  const ContactEntity({
    this.email,
    this.phoneNumber,
    this.urlSite,
    this.whatsapp,
  });

  @override
  List<Object?> get props => [email, phoneNumber, urlSite];

  ContactEntity copyWith({
    String? email,
    String? phoneNumber,
    String? urlSite,
    String? whatsapp,
  }) {
    return ContactEntity(
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      urlSite: urlSite ?? this.urlSite,
      whatsapp: whatsapp ?? this.whatsapp,
    );
  }
}
