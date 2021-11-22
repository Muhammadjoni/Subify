puts "Cleaning up database..."

User.destroy_all
Subscription.destroy_all
puts "Database cleaned"

puts "Creating the Users"

user = User.create(
  first_name: 'Bruce',
  last_name: 'Wayne',
  email: 'bruce.wayne@gotham.com',
  password: 'batman',
  sms_number: '+971589199329',
  whatsapp_number: '+971589199329'
)

puts "Done with the Users Creation"
puts "Creating the subscriptions"

user.subscriptions.create(
  title: 'Netflix Standard',
  start_date: '2021-02-24',
  end_date: '2022-02-24',
  sub_type: 'monthly',
  notify_before: 1,
  price: 30,
  currency: 'USD',
  notify: true,
  category: 'Entertainment'
)

user.subscriptions.create(
  title: 'Amazon Prime',
  start_date: '2020-08-03',
  end_date: '2022-08-02',
  sub_type: 'annual',
  notify_before: 1,
  price: 20,
  currency: 'USD',
  notify: true,
  category: 'Entertainment'
)

user.subscriptions.create(
  title: 'Coursera Plus',
  start_date: '2021-01-01',
  end_date: '2021-12-12',
  sub_type: 'annual',
  notify_before: 1,
  price: 15,
  currency: 'EUR',
  notify: true,
  category: 'Education'
)

user.subscriptions.create(
  title: 'edX',
  start_date: '2021-01-01',
  end_date: '2022-12-12',
  sub_type: 'annual',
  notify_before: 1,
  price: 15,
  currency: 'GBP',
  notify: true,
  category: 'Education'
)

user.subscriptions.create(
  title: 'Water usage bills',
  start_date: '2021-01-01',
  end_date: '2025-12-01',
  sub_type: 'weekly',
  notify_before: 1,
  price: 20,
  currency: 'AED',
  notify: true,
  category: 'Utility-Bills'
)
