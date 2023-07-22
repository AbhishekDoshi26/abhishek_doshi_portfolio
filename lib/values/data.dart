part of values;

class Data {
  static List<SocialButtonData> socialData = [
    SocialButtonData(
      tag: StringConst.EMAIL,
      iconData: FontAwesomeIcons.solidEnvelope,
      url: StringConst.EMAIL_URL,
    ),
    SocialButtonData(
      tag: StringConst.LINKED_IN_URL,
      iconData: FontAwesomeIcons.linkedin,
      url: StringConst.LINKED_IN_URL,
    ),
    SocialButtonData(
      tag: StringConst.GITHUB_URL,
      iconData: FontAwesomeIcons.github,
      url: StringConst.GITHUB_URL,
    ),
    SocialButtonData(
      tag: StringConst.TWITTER_URL,
      iconData: FontAwesomeIcons.twitter,
      url: StringConst.TWITTER_URL,
    ),
    SocialButtonData(
      tag: StringConst.INSTAGRAM_URL,
      iconData: FontAwesomeIcons.instagram,
      url: StringConst.INSTAGRAM_URL,
    ),
    SocialButtonData(
      tag: StringConst.MEDIUM_URL,
      iconData: FontAwesomeIcons.medium,
      url: StringConst.MEDIUM_URL,
    ),
  ];
  static List<SocialButton2Data> socialData2 = [
    SocialButton2Data(
      title: '',
      iconData: FontAwesomeIcons.github,
      url: StringConst.GITHUB_URL,
      titleColor: AppColors.blue300,
      buttonColor: AppColors.blue300,
      iconColor: AppColors.white,
    ),
    SocialButton2Data(
      title: '',
      iconData: FontAwesomeIcons.linkedin,
      url: StringConst.LINKED_IN_URL,
      titleColor: AppColors.blue300,
      buttonColor: AppColors.blue300,
      iconColor: AppColors.white,
    ),
    SocialButton2Data(
      title: '',
      iconData: FontAwesomeIcons.twitter,
      url: StringConst.TWITTER_URL,
      titleColor: AppColors.blue300,
      buttonColor: AppColors.blue300,
      iconColor: AppColors.white,
    ),
    SocialButton2Data(
      title: '',
      iconData: FontAwesomeIcons.medium,
      url: StringConst.MEDIUM_URL,
      titleColor: AppColors.blue300,
      buttonColor: AppColors.blue300,
      iconColor: AppColors.white,
    ),
    SocialButton2Data(
      title: '',
      iconData: FontAwesomeIcons.instagram,
      url: StringConst.INSTAGRAM_URL,
      titleColor: AppColors.blue300,
      buttonColor: AppColors.blue300,
      iconColor: AppColors.white,
    ),
  ];

  static List<SkillLevelData> skillLevelData = [
    SkillLevelData(
      skill: StringConst.SKILLS_1,
      level: 95,
    ),
    SkillLevelData(
      skill: StringConst.SKILLS_2,
      level: 90,
    ),
    SkillLevelData(
      skill: StringConst.SKILLS_3,
      level: 80,
    ),
  ];

  static List<SkillCardData> skillCardData = [
    SkillCardData(
      title: StringConst.SKILLS_1,
      description: StringConst.SKILLS_1_DESC,
      iconData: Icons.mobile_friendly,
    ),
    SkillCardData(
      title: "",
      description: "",
      iconData: Icons.pages_outlined,
    ), //not being used
    SkillCardData(
      title: StringConst.SKILLS_2,
      description: StringConst.SKILLS_2_DESC,
      iconData: Icons.cloud,
    ),
    SkillCardData(
      title: StringConst.SKILLS_3,
      description: StringConst.SKILLS_3_DESC,
      iconData: FontAwesomeIcons.teamspeak,
    ),
    SkillCardData(
      title: StringConst.SKILLS_4,
      description: StringConst.SKILLS_4_DESC,
      iconData: FontAwesomeIcons.git,
    ),
    SkillCardData(
      title: "",
      description: "",
      iconData: Icons.pages_outlined,
    ), //not being used
  ];
  static List<StatItemData> statItemsData = [
    StatItemData(
      value: int.parse(StringConst.HAPPY_CLIENTS_NUM),
      subtitle: StringConst.HAPPY_CLIENTS,
    ),
    StatItemData(
      value: int.parse(StringConst.YEARS_OF_EXPERIENCE_NUM),
      subtitle: StringConst.YEARS_OF_EXPERIENCE,
    ),
    StatItemData(
      value: int.parse(StringConst.INCREDIBLE_PROJECTS_NUM),
      subtitle: StringConst.INCREDIBLE_PROJECTS,
    ),
  ];

  static List<TestimonialSectionModel> testimonials = [
    TestimonialSectionModel(
      name: StringConst.TESTIMONIALS_1_NAME,
      position: StringConst.TESTIMONIALS_1_POSITION,
      testimonial: StringConst.TESTIMONIALS_1,
      image:
          "https://media.licdn.com/dms/image/C4D03AQHkiVADDkujMg/profile-displayphoto-shrink_800_800/0/1640115715976?e=1695254400&v=beta&t=rCHRE1ekPudz2VB12j0r1nZ5wf6jbvaZYnHupKLEQpU",
    ),
    TestimonialSectionModel(
      name: StringConst.TESTIMONIALS_2_NAME,
      position: StringConst.TESTIMONIALS_2_POSITION,
      testimonial: StringConst.TESTIMONIALS_2,
      image:
          "https://media.licdn.com/dms/image/D4D03AQF-gKzz9c-3_w/profile-displayphoto-shrink_800_800/0/1673735338704?e=1695254400&v=beta&t=w_zsbHxAAyxmN_G2ifAWQAbORfUgqXFf0Z8cwi00p4E",
    ),
    TestimonialSectionModel(
      name: StringConst.TESTIMONIALS_3_NAME,
      position: StringConst.TESTIMONIALS_3_POSITION,
      testimonial: StringConst.TESTIMONIALS_3,
      image:
          "https://media.licdn.com/dms/image/C4E03AQGu3Crb8-eDsA/profile-displayphoto-shrink_800_800/0/1639332512074?e=1695254400&v=beta&t=cxpdwCEx3_HbJzoQ7w9aWVT7GjjLvYnpi6xkZ4_q5w0",
    ),
    TestimonialSectionModel(
      name: StringConst.TESTIMONIALS_4_NAME,
      position: StringConst.TESTIMONIALS_4_POSITION,
      testimonial: StringConst.TESTIMONIALS_4,
      image:
          "https://media.licdn.com/dms/image/C5103AQFYQq5YimCe4Q/profile-displayphoto-shrink_800_800/0/1531022038075?e=1695254400&v=beta&t=jKxdEAp6wLNaA_Khnq2jQ2MY8B-J9GPOslXsHxFAdNk",
    ),
    TestimonialSectionModel(
      name: StringConst.TESTIMONIALS_5_NAME,
      position: StringConst.TESTIMONIALS_5_POSITION,
      testimonial: StringConst.TESTIMONIALS_5,
      image:
          "https://media.licdn.com/dms/image/C5103AQGCTusGo7Dmkw/profile-displayphoto-shrink_800_800/0/1581185483397?e=1695254400&v=beta&t=z8-4G99_w0fR0pKObGbkfhg9buAyzMGbpRtg_qH7C7M",
    ),
  ];

  static List<BlogCardData> blogData = [
    BlogCardData(
      category: StringConst.BLOG_CATEGORY_1,
      title: StringConst.BLOG_TITLE_1,
      date: StringConst.BLOG_DATE_1,
      buttonText: StringConst.READ_MORE,
      imageUrl: ImagePath.kBlog01,
      url: StringConst.BLOG_URL_1,
    ),
    BlogCardData(
      category: StringConst.BLOG_CATEGORY_1,
      title: StringConst.BLOG_TITLE_2,
      date: StringConst.BLOG_DATE_2,
      buttonText: StringConst.READ_MORE,
      imageUrl: ImagePath.kBlog02,
      url: StringConst.BLOG_URL_2,
    ),
    BlogCardData(
      category: StringConst.BLOG_CATEGORY_2,
      title: StringConst.BLOG_TITLE_3,
      date: StringConst.BLOG_DATE_3,
      buttonText: StringConst.READ_MORE,
      imageUrl: ImagePath.kBlog03,
      url: StringConst.BLOG_URL_3,
    ),
  ];

  static List<CardData> homeCardData = [
    CardData(
      title: StringConst.FLUTTER_DEVELOPER,
      subtitle: StringConst.FLUTTER_DEVELOPER_DESC,
      leadingIcon: Icons.done,
      trailingIcon: Icons.chevron_right,
    ),
    CardData(
      title: StringConst.COMMUNITY,
      subtitle: StringConst.COMMUNITY_DESC,
      leadingIcon: Icons.done,
      trailingIcon: Icons.chevron_right,
      circleBgColor: AppColors.blue300,
    ),
    CardData(
      title: StringConst.FREELANCER,
      subtitle: StringConst.FREELANCER_DESC,
      leadingIcon: Icons.done,
      trailingIcon: Icons.chevron_right,
      leadingIconColor: AppColors.black,
      circleBgColor: AppColors.grey50,
    ),
  ];

  static List<FooterItem> footerItems = [
    const FooterItem(
      title: "${StringConst.PHONE_ME}:",
      subtitle: StringConst.PHONE_NUMBER,
      iconData: FeatherIcons.phone,
      url: StringConst.PHONE_NUMBER_URL,
    ),
    const FooterItem(
      title: "${StringConst.MAIL_ME}:",
      subtitle: StringConst.DEV_EMAIL_2,
      iconData: FontAwesomeIcons.paperPlane,
      url: StringConst.EMAIL_URL,
    ),
    const FooterItem(
      title: "${StringConst.FOLLOW_ME_2}:",
      subtitle: StringConst.LinkedInId,
      iconData: FontAwesomeIcons.linkedinIn,
      url: StringConst.LINKED_IN_URL,
    ),
  ];

  static List<NavItemData> navItems = [
    NavItemData(name: StringConst.HOME, key: GlobalKey(), isSelected: true),
    NavItemData(name: StringConst.ABOUT, key: GlobalKey()),
    NavItemData(name: StringConst.SKILLS, key: GlobalKey()),
    NavItemData(name: StringConst.TESTIMONIALS, key: GlobalKey()),
    NavItemData(name: StringConst.BLOG, key: GlobalKey()),
  ];
}
