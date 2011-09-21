Factory.define :user do |user|
  user.name                  "Example User"
  user.email                 "example@examples.com"
  user.password              "kondesh"
  user.password_confirmation "kondesh"
end

Factory.sequence :email do |n|
  "person-#{n}@example.com"
end

Factory.sequence :name do |n|
  "Person #{n}"
end

Factory.define :micropost do |micropost|
  micropost.content "haisup"
  micropost.association :user
end