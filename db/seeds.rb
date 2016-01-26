include RandomData

# Create topics

15.times do
  Topic.create!(
    name: RandomData.random_sentence,
    description: RandomData.random_paragraph
  )
end
topics = Topic.all

# Create users

5.times do
  User.create!(
    name: RandomData.random_name,
    email: RandomData.random_email,
    password: RandomData.random_sentence
  )
end
users = User.all

admin = User.create!(
  name: "Admin User",
  email: "admin@example.com",
  password: "hello world",
  role: 'admin'
)

member = User.create!(
  name: "Member User",
  email: "member@example.com",
  password: "hello world"
)

# Create posts
50.times do
  Post.create!(
    user: users.sample,
    topic: topics.sample,
    title: RandomData.random_sentence,
    body: RandomData.random_paragraph
  )
end
posts = Post.all

# Create comments
100.times do
  Comment.create!(
    post: posts.sample,
    body: RandomData.random_paragraph
  )
end

# Add myself

user = User.first
user.update_attributes!(
  email: "dcox@zendesk.com",
  password: "password"
)

puts "Seed finished"
puts "#{Topic.count} topics created"
puts "#{User.count} users created"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"
