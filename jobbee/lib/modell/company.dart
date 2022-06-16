class Company {
  final String companyName;
  final String job;
  final String city;
  final String sallary;
  final String imagepath;
  final String jobOpportunity;
  final String aboutCompany;
  final String jobResponsbilities;

  const Company({
    required this.aboutCompany,
    required this.city,
    required this.job,
    required this.companyName,
    required this.sallary,
    required this.imagepath,
    required this.jobOpportunity,
    required this.jobResponsbilities,
  });
}

class CompanyInfo {
  static const myCompany = Company(
    companyName: "Nike",
    job: "Senior UI Designer",
    city: "California, CA",
    sallary: "\$50K - \$90K",
    imagepath:
        "https://res.cloudinary.com/dzxxq4dgq/image/upload/v1655110078/Dell_ppqiq6.png",
    jobOpportunity: 'Nothing You work until You died',
    jobResponsbilities:
        'Calendly is looking for a UI/UX Designer in Marketing to Join our fast growing team. This role will report to the Director of UX and work alongside the marketing team to design experiences that help grow our business. \nCalendly is looking for a UI/UX Designer in Marketing to Join our fast growing team. This role will report to the Director of UX and work alongside the marketing team to design experiences that help grow our business. \nCalendly is looking for a UI/UX Designer in Marketing to Join our fast growing team. This role will report to the Director of UX and work alongside the marketing team to design experiences that help grow our business.',
    aboutCompany:
        "Maecenas dolor risus, luctus nec egestas id, dictum interdum lectus. Vivamus nec orci eget mauris luctus elementum. Donec nunc erat, viverra vitae suscipit quis, tempor dictum ligula. In nibh nulla, rhoncus ac lacinia tincidunt, luctus eu arcu. Proin nec nibh quis felis pellentesque pulvinar sit amet in justo. Sed hendrerit rutrum sem, in ornare ipsum bibendum sagittis. Donec tellus mi, facilisis ac nibh id, bibendum maximus diam. Quisque efficitur nunc purus, vel aliquet magna efficitur in. Cras pellentesque non massa vitae suscipit. Proin interdum turpis euismod quam finibus, id imperdiet felis lacinia.",
  );
}
