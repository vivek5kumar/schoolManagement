class DepartmentModel {
  String? status;
  String? message;
  List<Data>? data;

  DepartmentModel({this.status, this.message, this.data});

  DepartmentModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  String? name;
  int? isActive;
  List<SubDepartments>? subDepartments;
  List<TicketType>? ticketType;

  Data(
      {this.id,
      this.name,
      this.isActive,
      this.subDepartments,
      this.ticketType});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    isActive = json['is_active'];
    if (json['sub_departments'] != null) {
      subDepartments = <SubDepartments>[];
      json['sub_departments'].forEach((v) {
        subDepartments!.add(new SubDepartments.fromJson(v));
      });
    }
    if (json['ticket_type'] != null) {
      ticketType = <TicketType>[];
      json['ticket_type'].forEach((v) {
        ticketType!.add(new TicketType.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['is_active'] = this.isActive;
    if (this.subDepartments != null) {
      data['sub_departments'] =
          this.subDepartments!.map((v) => v.toJson()).toList();
    }
    if (this.ticketType != null) {
      data['ticket_type'] = this.ticketType!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SubDepartments {
  int? id;
  String? name;
  int? isActive;
  String? parentId;
  List<TicketType>? ticketType;

  SubDepartments(
      {this.id, this.name, this.isActive, this.parentId, this.ticketType});

  SubDepartments.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    isActive = json['is_active'];
    parentId = json['parent_id'];
    if (json['ticket_type'] != null) {
      ticketType = <TicketType>[];
      json['ticket_type'].forEach((v) {
        ticketType!.add(new TicketType.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['is_active'] = this.isActive;
    data['parent_id'] = this.parentId;
    if (this.ticketType != null) {
      data['ticket_type'] = this.ticketType!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class TicketType {
  int? ticketTypeId;
  String? ticketType;

  TicketType({this.ticketTypeId, this.ticketType});

  TicketType.fromJson(Map<String, dynamic> json) {
    ticketTypeId = json['ticket_type_id'];
    ticketType = json['ticket_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ticket_type_id'] = this.ticketTypeId;
    data['ticket_type'] = this.ticketType;
    return data;
  }
}
