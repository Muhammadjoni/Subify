
User.destroy_all
Subscription.destroy_all

user = User.create(
  first_name: 'Muhammadjon',
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
  price: 45,
  currency: 'AED',
  notify: true,
  category: 'Education'
)

user.subscriptions.create(
  title: 'Codecademy',
  start_date: '2021-11-24',
  sub_type: 'monthly',
  notify_before: 1,
  price: 55,
  currency: 'AED',
  notify: true,
  link: "https://www.codecademy.com/account",
  trial: 7,
  category: 'Education'
)
