import 'package:equatable/equatable.dart';

class ContactEntity extends Equatable {
  final String? id;
  final String? email;
  final String? phoneNumber;
  final String? urlSite;

  const ContactEntity({
    this.id,
    this.email,
    this.phoneNumber,
    this.urlSite,
  });

  @override
  List<Object?> get props => [id];

  ContactEntity copyWith({
    String? id,
    String? email,
    String? phoneNumber,
    String? urlSite,
  }) {
    return ContactEntity(
      id: id ?? this.id,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      urlSite: urlSite ?? this.urlSite,
    );
  }
}
