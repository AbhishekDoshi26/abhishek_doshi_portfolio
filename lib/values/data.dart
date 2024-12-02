part of 'values.dart';

class Data {
  static List<SocialButtonData> socialData = [
    SocialButtonData(
      tag: StringConst.EMAIL,
      iconData: FontAwesomeIcons.solidEnvelope,
      url: StringConst.EMAIL_URL,
    ),
    SocialButtonData(
      tag: StringConst.CALENDLY,
      iconData: FontAwesomeIcons.calendar,
      url: StringConst.CALENDAR_URL,
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
      image: StringConst.TESTIMONIALS_1_URL,
    ),
    TestimonialSectionModel(
      name: StringConst.TESTIMONIALS_2_NAME,
      position: StringConst.TESTIMONIALS_2_POSITION,
      testimonial: StringConst.TESTIMONIALS_2,
      image: StringConst.TESTIMONIALS_2_URL,
    ),
    TestimonialSectionModel(
      name: StringConst.TESTIMONIALS_3_NAME,
      position: StringConst.TESTIMONIALS_3_POSITION,
      testimonial: StringConst.TESTIMONIALS_3,
      image: StringConst.TESTIMONIALS_3_URL,
    ),
    TestimonialSectionModel(
      name: StringConst.TESTIMONIALS_4_NAME,
      position: StringConst.TESTIMONIALS_4_POSITION,
      testimonial: StringConst.TESTIMONIALS_4,
      image: StringConst.TESTIMONIALS_4_URL,
    ),
    TestimonialSectionModel(
      name: StringConst.TESTIMONIALS_5_NAME,
      position: StringConst.TESTIMONIALS_5_POSITION,
      testimonial: StringConst.TESTIMONIALS_5,
      image: StringConst.TESTIMONIALS_5_URL,
    ),
    TestimonialSectionModel(
      name: StringConst.TESTIMONIALS_6_NAME,
      position: StringConst.TESTIMONIALS_6_POSITION,
      testimonial: StringConst.TESTIMONIALS_6,
      image: StringConst.TESTIMONIALS_6_URL,
    ),
    TestimonialSectionModel(
      name: StringConst.TESTIMONIALS_7_NAME,
      position: StringConst.TESTIMONIALS_7_POSITION,
      testimonial: StringConst.TESTIMONIALS_7,
      image: StringConst.TESTIMONIALS_7_URL,
    ),
    TestimonialSectionModel(
      name: StringConst.TESTIMONIALS_8_NAME,
      position: StringConst.TESTIMONIALS_8_POSITION,
      testimonial: StringConst.TESTIMONIALS_8,
      image: StringConst.TESTIMONIALS_8_URL,
    ),
    TestimonialSectionModel(
      name: StringConst.TESTIMONIALS_9_NAME,
      position: StringConst.TESTIMONIALS_9_POSITION,
      testimonial: StringConst.TESTIMONIALS_9,
      image: StringConst.TESTIMONIALS_9_URL,
    ),
    TestimonialSectionModel(
      name: StringConst.TESTIMONIALS_10_NAME,
      position: StringConst.TESTIMONIALS_10_POSITION,
      testimonial: StringConst.TESTIMONIALS_10,
      image: StringConst.TESTIMONIALS_10_URL,
    ),
    TestimonialSectionModel(
      name: StringConst.TESTIMONIALS_11_NAME,
      position: StringConst.TESTIMONIALS_11_POSITION,
      testimonial: StringConst.TESTIMONIALS_11,
      image: StringConst.TESTIMONIALS_11_URL,
    ),
    TestimonialSectionModel(
      name: StringConst.TESTIMONIALS_12_NAME,
      position: StringConst.TESTIMONIALS_12_POSITION,
      testimonial: StringConst.TESTIMONIALS_12,
      image: StringConst.TESTIMONIALS_12_URL,
    ),
    TestimonialSectionModel(
      name: StringConst.TESTIMONIALS_13_NAME,
      position: StringConst.TESTIMONIALS_13_POSITION,
      testimonial: StringConst.TESTIMONIALS_13,
      image: StringConst.TESTIMONIALS_13_URL,
    ),
    TestimonialSectionModel(
      name: StringConst.TESTIMONIALS_14_NAME,
      position: StringConst.TESTIMONIALS_14_POSITION,
      testimonial: StringConst.TESTIMONIALS_14,
      image: StringConst.TESTIMONIALS_14_URL,
    ),
    TestimonialSectionModel(
      name: StringConst.TESTIMONIALS_15_NAME,
      position: StringConst.TESTIMONIALS_15_POSITION,
      testimonial: StringConst.TESTIMONIALS_15,
      image: StringConst.TESTIMONIALS_15_URL,
    ),
    TestimonialSectionModel(
      name: StringConst.TESTIMONIALS_16_NAME,
      position: StringConst.TESTIMONIALS_16_POSITION,
      testimonial: StringConst.TESTIMONIALS_16,
      image: StringConst.TESTIMONIALS_16_URL,
    ),
    TestimonialSectionModel(
      name: StringConst.TESTIMONIALS_17_NAME,
      position: StringConst.TESTIMONIALS_17_POSITION,
      testimonial: StringConst.TESTIMONIALS_17,
      image: StringConst.TESTIMONIALS_17_URL,
    ),
    TestimonialSectionModel(
      name: StringConst.TESTIMONIALS_18_NAME,
      position: StringConst.TESTIMONIALS_18_POSITION,
      testimonial: StringConst.TESTIMONIALS_18,
      image: StringConst.TESTIMONIALS_18_URL,
    ),
  ];

  static List<BlogCardData> blogData = [
    BlogCardData(
      category: StringConst.BLOG_CATEGORY_1,
      title: StringConst.BLOG_TITLE_7,
      date: StringConst.BLOG_DATE_7,
      buttonText: StringConst.READ_MORE,
      imageUrl: ImagePath.kBlog07,
      url: StringConst.BLOG_URL_7,
    ),
    BlogCardData(
      category: StringConst.BLOG_CATEGORY_1,
      title: StringConst.BLOG_TITLE_6,
      date: StringConst.BLOG_DATE_6,
      buttonText: StringConst.READ_MORE,
      imageUrl: ImagePath.kBlog06,
      url: StringConst.BLOG_URL_6,
    ),
    BlogCardData(
      category: StringConst.BLOG_CATEGORY_1,
      title: StringConst.BLOG_TITLE_5,
      date: StringConst.BLOG_DATE_5,
      buttonText: StringConst.READ_MORE,
      imageUrl: ImagePath.kBlog05,
      url: StringConst.BLOG_URL_5,
    ),
    BlogCardData(
      category: StringConst.BLOG_CATEGORY_1,
      title: StringConst.BLOG_TITLE_4,
      date: StringConst.BLOG_DATE_4,
      buttonText: StringConst.READ_MORE,
      imageUrl: ImagePath.kBlog04,
      url: StringConst.BLOG_URL_4,
    ),
    BlogCardData(
      category: StringConst.BLOG_CATEGORY_1,
      title: StringConst.BLOG_TITLE_3,
      date: StringConst.BLOG_DATE_3,
      buttonText: StringConst.READ_MORE,
      imageUrl: ImagePath.kBlog03,
      url: StringConst.BLOG_URL_3,
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
      title: StringConst.BLOG_TITLE_1,
      date: StringConst.BLOG_DATE_1,
      buttonText: StringConst.READ_MORE,
      imageUrl: ImagePath.kBlog01,
      url: StringConst.BLOG_URL_1,
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
      subtitle: StringConst.LINKEDINUSER,
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
