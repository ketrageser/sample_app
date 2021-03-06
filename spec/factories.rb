Factory.define :user do |user|
  user.name                         "Michael Hartl"
  user.email                         "mhartl@example.com"
  user.password                   "foobar"
  user.password_confirmation "foobar"
end

Factory.sequence :email do |n|
  "person-#{n}@emample.com"
end

Factory.define :micropost do |micropost|
  micropost.content "Foo bar"
  mircropost.association :user
end