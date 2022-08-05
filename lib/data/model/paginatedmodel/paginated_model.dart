// To parse this JSON data, do
//
//     final paginatedModel = paginatedModelFromMap(jsonString);

import 'dart:convert';

PaginatedModel paginatedModelFromMap(String str) =>
    PaginatedModel.fromMap(json.decode(str));

String paginatedModelToMap(PaginatedModel data) => json.encode(data.toMap());

class PaginatedModel {
  PaginatedModel({
    required this.users,
    required this.total,
    required this.skip,
    required this.limit,
  });

  final List<User> users;
  final int total;
  final int skip;
  final int limit;

  factory PaginatedModel.fromMap(Map<String, dynamic> json) => PaginatedModel(
        users: List<User>.from(json["users"].map((x) => User.fromMap(x))),
        total: json["total"],
        skip: json["skip"],
        limit: json["limit"],
      );

  Map<String, dynamic> toMap() => {
        "users": List<dynamic>.from(users.map((x) => x.toMap())),
        "total": total,
        "skip": skip,
        "limit": limit,
      };
}

class User {
  User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.maidenName,
    required this.age,
    required this.gender,
    required this.email,
    required this.phone,
    required this.username,
    required this.password,
    required this.birthDate,
    required this.image,
    required this.bloodGroup,
    required this.height,
    required this.weight,
    required this.eyeColor,
    required this.hair,
    required this.domain,
    required this.ip,
    required this.address,
    required this.macAddress,
    required this.university,
    required this.bank,
    required this.company,
    required this.ein,
    required this.ssn,
    required this.userAgent,
  });

  final int id;
  final String firstName;
  final String lastName;
  final String maidenName;
  final int age;
  final Gender? gender;
  final String email;
  final String phone;
  final String username;
  final String password;
  final DateTime birthDate;
  final String image;
  final String bloodGroup;
  final int height;
  final double weight;
  final String eyeColor;
  final Hair hair;
  final String domain;
  final String ip;
  final Address address;
  final String macAddress;
  final String university;
  final Bank bank;
  final Company company;
  final String ein;
  final String ssn;
  final String userAgent;

  factory User.fromMap(Map<String, dynamic> json) => User(
        id: json["id"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        maidenName: json["maidenName"],
        age: json["age"],
        gender: genderValues.map[json["gender"]],
        email: json["email"],
        phone: json["phone"],
        username: json["username"],
        password: json["password"],
        birthDate: DateTime.parse(json["birthDate"]),
        image: json["image"],
        bloodGroup: json["bloodGroup"],
        height: json["height"],
        weight: json["weight"].toDouble(),
        eyeColor: json["eyeColor"],
        hair: Hair.fromMap(json["hair"]),
        domain: json["domain"],
        ip: json["ip"],
        address: Address.fromMap(json["address"]),
        macAddress: json["macAddress"],
        university: json["university"],
        bank: Bank.fromMap(json["bank"]),
        company: Company.fromMap(json["company"]),
        ein: json["ein"],
        ssn: json["ssn"],
        userAgent: json["userAgent"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "firstName": firstName,
        "lastName": lastName,
        "maidenName": maidenName,
        "age": age,
        "gender": genderValues.reverse[gender],
        "email": email,
        "phone": phone,
        "username": username,
        "password": password,
        "birthDate":
            "${birthDate.year.toString().padLeft(4, '0')}-${birthDate.month.toString().padLeft(2, '0')}-${birthDate.day.toString().padLeft(2, '0')}",
        "image": image,
        "bloodGroup": bloodGroup,
        "height": height,
        "weight": weight,
        "eyeColor": eyeColor,
        "hair": hair.toMap(),
        "domain": domain,
        "ip": ip,
        "address": address.toMap(),
        "macAddress": macAddress,
        "university": university,
        "bank": bank.toMap(),
        "company": company.toMap(),
        "ein": ein,
        "ssn": ssn,
        "userAgent": userAgent,
      };
}

class Address {
  Address({
    required this.address,
    required this.city,
    required this.coordinates,
    required this.postalCode,
    required this.state,
  });

  final String address;
  final String city;
  final Coordinates coordinates;
  final String postalCode;
  final String state;

  factory Address.fromMap(Map<String, dynamic> json) => Address(
        address: json["address"],
        city: json["city"],
        coordinates: Coordinates.fromMap(json["coordinates"]),
        postalCode: json["postalCode"],
        state: json["state"],
      );

  Map<String, dynamic> toMap() => {
        "address": address,
        "city": city,
        "coordinates": coordinates.toMap(),
        "postalCode": postalCode,
        "state": state,
      };
}

class Coordinates {
  Coordinates({
    required this.lat,
    required this.lng,
  });

  final double lat;
  final double lng;

  factory Coordinates.fromMap(Map<String, dynamic> json) => Coordinates(
        lat: json["lat"].toDouble(),
        lng: json["lng"].toDouble(),
      );

  Map<String, dynamic> toMap() => {
        "lat": lat,
        "lng": lng,
      };
}

class Bank {
  Bank({
    required this.cardExpire,
    required this.cardNumber,
    required this.cardType,
    required this.currency,
    required this.iban,
  });

  final String cardExpire;
  final String cardNumber;
  final String cardType;
  final String currency;
  final String iban;

  factory Bank.fromMap(Map<String, dynamic> json) => Bank(
        cardExpire: json["cardExpire"],
        cardNumber: json["cardNumber"],
        cardType: json["cardType"],
        currency: json["currency"],
        iban: json["iban"],
      );

  Map<String, dynamic> toMap() => {
        "cardExpire": cardExpire,
        "cardNumber": cardNumber,
        "cardType": cardType,
        "currency": currency,
        "iban": iban,
      };
}

class Company {
  Company({
    required this.address,
    required this.department,
    required this.name,
    required this.title,
  });

  final Address address;
  final String department;
  final String name;
  final String title;

  factory Company.fromMap(Map<String, dynamic> json) => Company(
        address: Address.fromMap(json["address"]),
        department: json["department"],
        name: json["name"],
        title: json["title"],
      );

  Map<String, dynamic> toMap() => {
        "address": address.toMap(),
        "department": department,
        "name": name,
        "title": title,
      };
}

enum Gender { MALE, FEMALE }

final genderValues = EnumValues({"female": Gender.FEMALE, "male": Gender.MALE});

class Hair {
  Hair({
    required this.color,
    required this.type,
  });

  final String color;
  final String type;

  factory Hair.fromMap(Map<String, dynamic> json) => Hair(
        color: json["color"],
        type: json["type"],
      );

  Map<String, dynamic> toMap() => {
        "color": color,
        "type": type,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap!;
  }
}
