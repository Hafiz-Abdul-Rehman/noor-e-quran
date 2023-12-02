class AyaOfTheDay {
 late final String? arText;
  late final String? enTran;
  late final String? surEnName;
  late final int? surNumber;

  AyaOfTheDay({this.arText, this.enTran, this.surEnName, this.surNumber});
  factory AyaOfTheDay.fromJSON(Map<String, dynamic> json){
    return AyaOfTheDay(
      arText: json['data'][0]['text'],
      enTran: json['data'][2]['text'],
      surEnName: json['data'][2]['surah']['englishName'],
      surNumber: json['data'][2]['numberInSurah']
    );
  }
}