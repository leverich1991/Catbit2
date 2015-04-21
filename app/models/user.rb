class User < ActiveRecord::Base
<<<<<<< HEAD
#before_save { self.username = username.downcase }
#has_secure_password #should have built-in authentication
#validates :name, presence: true, length: { minimum: 8 }
#validates :password, :format => {:with => /A(?=.*[a-zA-Z])(?=.*[0-9]).{8,}/z, message: "must be at least 8 characters and include one number and one letter."}
  has_many :datas

 validates :oauth_token, :oauth_secret, :uid, :name, :presence =>true

  def self.find_or_create(auth_hash)
=======
validates :oauth_token, :oauth_secret, :uid, :name, :presence =>true
def self.find_or_create(auth_hash)
>>>>>>> 132f0daa8d45be5da53747a5285edd5920599855
    unless user = find_by_uid(auth_hash["uid"])
      user = User.create :oauth_token => auth_hash['credentials']['token'], :oauth_secret => auth_hash['credentials']['secret'], :uid => auth_hash["uid"], :name => auth_hash['info']["full_name"]
end
 
user
end
  
def fitbit
    client = Fitgem::Client.new(:consumer_key => '112ab647273543b89fc58ad1e4932be1', :consumer_secret => '0d31c388f89e4b50bd878002ac354a4a', :oauth_token => self.oauth_token, :oauth_secret => self.oauth_secret)
    access_token = client.reconnect(self.oauth_token, self.oauth_secret)
    client
end

end
