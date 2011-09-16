Factory.define :user do |user|
  user.name                  "Santosh Kumar"
  user.email                 "msksantosh@gmail.com"
  user.password              "abcdefgh"
  user.password_confirmation "abcdefgh"
end

Factory.sequence :email do |n|
  "person-#{n}@example.com"
end

Factory.define :micropost do |micropost|
  micropost.content "haisup"
  micropost.association :user
end