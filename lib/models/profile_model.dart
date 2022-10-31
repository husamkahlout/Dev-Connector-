class ProfileModel {
  Social? social;
  String? sId;
  User? user;
  String? company;
  String? website;
  String? location;
  String? status;
  List<String>? skills;
  String? bio;
  String? githubusername;
  List<Experience>? experience;
  List<Education>? education;
  int? iV;

  ProfileModel(
      {this.social,
      this.sId,
      this.user,
      this.company,
      this.website,
      this.location,
      this.status,
      this.skills,
      this.bio,
      this.githubusername,
      this.experience,
      this.education,
      this.iV});

  ProfileModel.fromJson(Map<String, dynamic> json) {
    social = json['social'] != null ? Social.fromJson(json['social']) : null;
    sId = json['_id'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    company = json['company'];
    website = json['website'];
    location = json['location'];
    status = json['status'];
    skills = json['skills'].cast<String>();
    bio = json['bio'];
    githubusername = json['githubusername'];
    if (json['experience'] != null) {
      experience = <Experience>[];
      json['experience'].forEach((v) {
        experience!.add(Experience.fromJson(v));
      });
    }
    if (json['education'] != null) {
      education = <Education>[];
      json['education'].forEach((v) {
        education!.add(Education.fromJson(v));
      });
    }
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (social != null) {
      data['social'] = social!.toJson();
    }
    data['_id'] = sId;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    data['company'] = company;
    data['website'] = website;
    data['location'] = location;
    data['status'] = status;
    data['skills'] = skills.toString().replaceAll("[", '').replaceAll("]", '');
    data['bio'] = bio;
    data['githubusername'] = githubusername;
    if (experience != null) {
      data['experience'] = experience!.map((v) => v.toJson()).toList();
    }
    if (education != null) {
      data['education'] = education!.map((v) => v.toJson()).toList();
    }
    data['__v'] = iV;
    return data;
  }
}

class Social {
  String? youtube;
  String? facebook;
  String? twitter;
  String? instagram;
  String? linkedin;

  Social(
      {this.youtube,
      this.facebook,
      this.twitter,
      this.instagram,
      this.linkedin});

  Social.fromJson(Map<String, dynamic> json) {
    youtube = json['youtube'];
    facebook = json['facebook'];
    twitter = json['twitter'];
    instagram = json['instagram'];
    linkedin = json['linkedin'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['youtube'] = youtube;
    data['facebook'] = facebook;
    data['twitter'] = twitter;
    data['instagram'] = instagram;
    data['linkedin'] = linkedin;
    return data;
  }
}

class User {
  String? sId;
  String? name;
  String? avatar;

  User({this.sId, this.name, this.avatar});

  User.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    avatar = json['avatar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['name'] = name;
    data['avatar'] = avatar;
    return data;
  }
}

class Experience {
  String? title;
  String? company;
  String? location;
  String? from;
  String? to;
  bool? current;
  String? description;
  String? sId;

  Experience(
      {this.title,
      this.company,
      this.location,
      this.from,
      this.to,
      this.current,
      this.description,
      this.sId});

  Experience.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    company = json['company'];
    location = json['location'];
    from = json['from'];
    to = json['to'];
    current = json['current'];
    description = json['description'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['company'] = company;
    data['location'] = location;
    data['from'] = from;
    data['to'] = to;
    data['current'] = current;
    data['description'] = description;
    data['_id'] = sId;
    return data;
  }
}

class Education {
  String? school;
  String? degree;
  String? fieldofstudy;
  String? from;
  String? to;
  bool? current;
  String? description;
  String? sId;

  Education(
      {this.school,
      this.degree,
      this.fieldofstudy,
      this.from,
      this.to,
      this.current,
      this.description,
      this.sId});

  Education.fromJson(Map<String, dynamic> json) {
    school = json['school'];
    degree = json['degree'];
    fieldofstudy = json['fieldofstudy'];
    from = json['from'];
    to = json['to'];
    current = json['current'];
    description = json['description'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['school'] = school;
    data['degree'] = degree;
    data['fieldofstudy'] = fieldofstudy;
    data['from'] = from;
    data['to'] = to;
    data['current'] = current;
    data['description'] = description;
    data['_id'] = sId;
    return data;
  }
}
