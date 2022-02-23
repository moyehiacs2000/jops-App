class Welcome {
  Welcome({
    this.searchMetadata,
    this.searchParameters,
    this.jobsResults,
    this.chips,
  });

  SearchMetadata searchMetadata;
  SearchParameters searchParameters;
  List<JobsResult> jobsResults;
  List<Chip> chips;

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        searchMetadata: json["search_metadata"] == null
            ? null
            : SearchMetadata.fromJson(json["search_metadata"]),
        searchParameters: json["search_parameters"] == null
            ? null
            : SearchParameters.fromJson(json["search_parameters"]),
        jobsResults: json["jobs_results"] == null
            ? null
            : List<JobsResult>.from(
                json["jobs_results"].map((x) => JobsResult.fromJson(x))),
        chips: json["chips"] == null
            ? null
            : List<Chip>.from(json["chips"].map((x) => Chip.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "search_metadata":
            searchMetadata == null ? null : searchMetadata.toJson(),
        "search_parameters":
            searchParameters == null ? null : searchParameters.toJson(),
        "jobs_results": jobsResults == null
            ? null
            : List<dynamic>.from(jobsResults.map((x) => x.toJson())),
        "chips": chips == null
            ? null
            : List<dynamic>.from(chips.map((x) => x.toJson())),
      };
}

class Chip {
  Chip({
    this.type,
    this.param,
    this.options,
  });

  String type;
  String param;
  List<Option> options;

  factory Chip.fromJson(Map<String, dynamic> json) => Chip(
        type: json["type"],
        param: json["param"],
        options: json["options"] == null
            ? null
            : List<Option>.from(json["options"].map((x) => Option.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "param": param,
        "options": options == null
            ? null
            : List<dynamic>.from(options.map((x) => x.toJson())),
      };
}

class Option {
  Option({
    this.text,
    this.value,
  });

  String text;
  String value;

  factory Option.fromJson(Map<String, dynamic> json) => Option(
        text: json["text"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "text": text,
        "value": value,
      };
}

class JobsResult {
  JobsResult({
    this.title,
    this.companyName,
    this.location,
    this.via,
    this.description,
    this.thumbnail,
    this.extensions,
    this.detectedExtensions,
    this.jobId,
  });

  String title;
  String companyName;
  String location;
  String via;
  String description;
  String thumbnail;
  List<String> extensions;
  DetectedExtensions detectedExtensions;
  String jobId;

  factory JobsResult.fromJson(Map<String, dynamic> json) => JobsResult(
        title: json["title"],
        companyName: json["company_name"],
        location: json["location"],
        via: json["via"],
        description: json["description"],
        thumbnail: json["thumbnail"],
        extensions: json["extensions"] == null
            ? null
            : List<String>.from(json["extensions"].map((x) => x)),
        detectedExtensions: json["detected_extensions"] == null
            ? null
            : DetectedExtensions.fromJson(json["detected_extensions"]),
        jobId: json["job_id"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "company_name": companyName,
        "location": location,
        "via": via,
        "description": description,
        "thumbnail": thumbnail,
        "extensions": extensions == null
            ? null
            : List<dynamic>.from(extensions.map((x) => x)),
        "detected_extensions":
            detectedExtensions == null ? null : detectedExtensions.toJson(),
        "job_id": jobId,
      };
}

class DetectedExtensions {
  DetectedExtensions({
    this.postedAt,
    this.scheduleType,
  });

  String postedAt;
  ScheduleType scheduleType;

  factory DetectedExtensions.fromJson(Map<String, dynamic> json) =>
      DetectedExtensions(
        postedAt: json["posted_at"],
        scheduleType: json["schedule_type"] == null
            ? null
            : scheduleTypeValues.map[json["schedule_type"]],
      );

  Map<String, dynamic> toJson() => {
        "posted_at": postedAt,
        "schedule_type": scheduleType == null
            ? null
            : scheduleTypeValues.reverse[scheduleType],
      };
}

enum ScheduleType { fullTime }

final scheduleTypeValues = EnumValues({"Full-time": ScheduleType.fullTime});

class SearchMetadata {
  SearchMetadata({
    this.id,
    this.status,
    this.jsonEndpoint,
    this.createdAt,
    this.processedAt,
    this.googleJobsUrl,
    this.rawHtmlFile,
    this.totalTimeTaken,
  });

  String id;
  String status;
  String jsonEndpoint;
  String createdAt;
  String processedAt;
  String googleJobsUrl;
  String rawHtmlFile;
  double totalTimeTaken;

  factory SearchMetadata.fromJson(Map<String, dynamic> json) => SearchMetadata(
        id: json["id"],
        status: json["status"],
        jsonEndpoint:
            json["json_endpoint"],
        createdAt: json["created_at"],
        processedAt: json["processed_at"],
        googleJobsUrl:
            json["google_jobs_url"],
        rawHtmlFile:
            json["raw_html_file"],
        totalTimeTaken: json["total_time_taken"] == null
            ? null
            : json["total_time_taken"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "status": status,
        "json_endpoint": jsonEndpoint,
        "created_at": createdAt,
        "processed_at": processedAt,
        "google_jobs_url": googleJobsUrl,
        "raw_html_file": rawHtmlFile,
        "total_time_taken": totalTimeTaken,
      };
}

class SearchParameters {
  SearchParameters({
    this.q,
    this.engine,
    this.googleDomain,
    this.hl,
  });

  String q;
  String engine;
  String googleDomain;
  String hl;

  factory SearchParameters.fromJson(Map<String, dynamic> json) =>
      SearchParameters(
        q: json["q"],
        engine: json["engine"],
        googleDomain:
            json["google_domain"],
        hl: json["hl"],
      );

  Map<String, dynamic> toJson() => {
        "q": q,
        "engine": engine,
        "google_domain": googleDomain,
        "hl": hl,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap ??= map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
