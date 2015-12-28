class Post < ActiveRecord::Base
  has_many :comments

  def make_spam
    Posts.all.each { |post|
      if post.id = 1
        post.title = "SPAM"
        post.save!
      end
    }
  end

end
