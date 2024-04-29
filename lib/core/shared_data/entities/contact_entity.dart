// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class ContactEntity extends Equatable {
  final String? id;
  final List<String> emails;
  final List<String> phoneNumbers;
  final List<String> urlSites;

  const ContactEntity({
    this.id,
    required this.emails,
    required this.phoneNumbers,
    required this.urlSites,
  });

  @override
  List<Object?> get props => [id, emails, phoneNumbers, urlSites];

  ContactEntity copyWith({
    String? id,
    List<String>? emails,
    List<String>? phoneNumbers,
    List<String>? urlSites,
  }) {
    return ContactEntity(
      id: id ?? this.id,
      emails: emails ?? this.emails,
      phoneNumbers: phoneNumbers ?? this.phoneNumbers,
      urlSites: urlSites ?? this.urlSites,
    );
  }
}
