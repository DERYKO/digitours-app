class TravelDestinationModel {
  final int id;
  final String name;
  final String logo;
  final String address;
  final String latitude;
  final String longitude;
  final String webUrl;
  final List<String> tags;
  final List<TravelDestinationContactModel> contacts;
  final List<TravelDestinationGalleryModel> photos;
  final List<TravelDestinationPackageModel> package;

  TravelDestinationModel({
    this.id,
    this.name,
    this.logo,
    this.address,
    this.latitude,
    this.longitude,
    this.webUrl,
    this.contacts,
    this.photos,
    this.tags,
    this.package,
  });

  factory TravelDestinationModel.fromMap(traveldest) {
    return TravelDestinationModel(
        id: traveldest['id'],
        name: traveldest['name'],
        logo: traveldest['logo'],
        address: traveldest['address'],
        latitude: traveldest['latitude'],
        longitude: traveldest['longitude'],
        webUrl: traveldest['website'],
        contacts: traveldest['travel_destination_contacts']
            .map<TravelDestinationContactModel>((contact) {
          return TravelDestinationContactModel.fromMap(contact);
        }).toList(),
        photos:
            traveldest['gallery'].map<TravelDestinationGalleryModel>((galitem) {
          return TravelDestinationGalleryModel.fromMap(galitem);
        }).toList(),
        tags: traveldest['tags'].map<String>((galitem) {
          return galitem['activity']['name'] as String;
        }).toList(),
        package: traveldest['packages']
            .map<TravelDestinationPackageModel>((package) {
          return TravelDestinationPackageModel.fromMap(package);
        }).toList());
  }
}

class TravelDestinationContactModel {
  final int id;
  final String contactType;
  final String value;

  TravelDestinationContactModel({this.id, this.contactType, this.value});

  factory TravelDestinationContactModel.fromMap(contact) {
    return TravelDestinationContactModel(
        id: contact['id'],
        value: contact['value'],
        contactType: contact['contact_type'] != null
            ? contact['contact_type']['name']
            : null);
  }
}

class TravelDestinationGalleryModel {
  final int id;
  final String fileType;
  final String filePath;

  TravelDestinationGalleryModel({this.id, this.fileType, this.filePath});

  factory TravelDestinationGalleryModel.fromMap(galitem) {
    return TravelDestinationGalleryModel(
      id: galitem['id'],
      fileType: galitem['file_type'],
      filePath: galitem['file_path'],
    );
  }
}

class TravelDestinationPackageModel {
  final int id;
  final String description;

  TravelDestinationPackageModel({
    this.id,
    this.description,
  });

  factory TravelDestinationPackageModel.fromMap(package) {
    return TravelDestinationPackageModel(
        id: package["id"], description: package['description']);
  }
}
