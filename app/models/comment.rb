class Comment < ActiveRecord::Base
  belongs_to :micropost
  attr_accessor :body, :user_id
end
