require 'active_record'
#require 'logger'


ActiveRecord::Base.establish_connection(
	"adapter" => "sqlite3",
	"database" => "./blog.db"
)

#ActiveRecord::Base.logger = Logger.new(STDOUT)

class Post < ActiveRecord::Base
  scope :top, order("created_at desc").limit(2)
end


# post = Post.new(:title => "title1", :body => "hello1")

=begin
post = Post.new
post.title = "title2"
post.body = "body2"
post.save
=end

=begin
post = Post.new do |p|
	p.title = "title3"
	p.body = "hello3"
end
post.save
=end

#Post.create(title: "title4", body:"hello4")

=begin
p Post.first
p Post.last
p Post.find(2)
p Post.find_by_title("title3").body
p Post.find_by_title_and_id("title2", 2).created_at
p Post.where(title:"title1")
p Post.where(title:"title1", id:"1")
p Post.where("title = ? and id = ?", "title2", 2) 
p Post.where("title = :title or id = :id", {title:"title2", id:3})
p Post.where("id > 3")
p Post.order("created_at desc").limit(2)
=end

# scopeが使えないよ？？？
#p Post.top

=begin
#Post.where(title:"title5").first_or_create
Post.where(title:"title6").first_or_create do |p|
	p.body = "hello6"
end
p Post.all
=end

=begin
post = Post.find(1)
post.title = "new title"
post.save
=end

=begin
post = Post.where(1)
post.update_attributes(:title => "foo", :body => "bar")
p Post.first
=end


# #11 バリデーション
=begin
class Post < ActiveRecord::Base
	validates :title, :presence => true
	validates :body, :length => { :minimum => 5 }
end

post = Post.new( body: "123" )
#post.save!
if !post.save
	p post.errors.messages
end
p Post.all
=end



# #13 アソシエーション
=begin
class Post < ActiveRecord::Base
	has_many :comments
end

class Comment < ActiveRecord::Base
	belongs_to :post
end


post = Post.find(1)
post.comments.each do |comment|
	p comment.body
end
=end



# #14 アソシエーション(3)

class Post < ActiveRecord::Base
	has_many :comments
end

class Comment < ActiveRecord::Base
	belongs_to :post , :dependent => :destroy
end

p Post.all
p Comment.all

Post.find(1).destroy

p Post.all
p Comment.all




















































