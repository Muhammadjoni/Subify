
User.destroy_all
Subscription.destroy_all

user = User.create(
  first_name: 'Mr Jon',
  last_name: 'Rahimzod',
  email: 'mrahimzod@gmail.com',
  password: 'batman',
  sms_number: '+971589199329',
  whatsapp_number: '+971589199329'
)

user.subscriptions.create(
  title: 'Disney +',
  start_date: '2021-02-24',
  end_date: '2022-02-24',
  sub_type: 'monthly',
  notify_before: 1,
  image_url: "https://1000logos.net/wp-content/uploads/2021/01/Disney-Plus-logo.jpg",
  price: 65,
  currency: 'AED',
  notify: true,
  category: 'Entertainment'
)

user.subscriptions.create(
  title: 'Youtube Premium',
  start_date: '2020-08-03',
  end_date: '2022-08-02',
  sub_type: 'monthly',
  notify_before: 1,
  image_url: "https://www.flickonclick.com/wp-content/uploads/2020/11/youtube-premium.png",
  price: 73,
  currency: 'AED',
  notify: true,
  category: 'Entertainment'
)

user.subscriptions.create(
  title: 'Coursera Plus',
  start_date: '2021-01-01',
  end_date: '2021-12-12',
  sub_type: 'annual',
  notify_before: 1,
  image_url: "https://about.coursera.org/static/whiteCoursera-23ec484f7091914430ce19b07d09aedf.svg",
  price: 60,
  currency: 'AED',
  notify: true,
  category: 'Education'
)

user.subscriptions.create(
  title: 'edX',
  start_date: '2021-01-01',
  end_date: '2022-12-12',
  sub_type: 'annual',
  notify_before: 1,
  image_url: "https://www.economicpolicygroup.com/wp-content/uploads/2018/01/6.png",
  price: 45,
  currency: 'AED',
  notify: true,
  category: 'Education'
)

user.subscriptions.create(
  title: 'Codecademy',
  start_date: '2021-11-18',
  sub_type: 'monthly',
  notify_before: 1,
  price: 55,
  currency: 'AED',
  notify: true,
  image_url: "https://images.codecademy.com/social/logo-codecademy-social.png",
  link: "https://www.codecademy.com/account/billing",
  trial: 7,
  category: 'Education'
)
