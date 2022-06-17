require 'faker'

p 'Creating users'
50.times do
  User.create(
    name: Faker::Name.name,
    email: Faker::Internet.unique.email,
    role: %w[editor author reader guest].sample
  )
end

p 'Creating posts'
author_ids = User.where(role: 'author').pluck(:id)
100.times do
  Post.create(
    title: Faker::Lorem.sentence,
    body: Faker::Lorem.paragraph,
    author_id: author_ids.sample
  )
end

p 'Creating comments'
post_ids = Post.pluck(:id)
reader_guest_ids = User.where(role: %w[reader guest]).pluck(:id)
100.times do
  Comment.create(
    body: Faker::Lorem.paragraph,
    user_id: reader_guest_ids.sample,
    post_id: post_ids.sample
  )
end