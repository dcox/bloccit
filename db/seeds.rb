include RandomData

# Create posts
50.times do
  Post.create!(
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

# Create idempotent data
coffee_post = Post.find_or_create_by!(
  title: "Coffee: A Love Story",
  body: "You know how sometimes you just can't pry open your eyes in the morning? The only thing that helps is coffee. The end."
)

Comment.find_or_create_by!(
  body: "I know exactly how you feel! #coffeerules",
  post: coffee_post
)

puts "Seed finished"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"
