class User < ApplicationRecord
    has_many :events
    has_many :locations, through: :events
    has_secure_password

    validates_presence_of :name, :email, :password
    validates :email, uniqueness: true 

    def self.find_or_create_by_omniauth(auth_hash)
        if self.find_by(email: auth_hash['info']['email']) 
            @user = self.find_by(email: auth_hash['info']['email'])
        else 
            username = auth_hash['info']['name']
            name = auth_hash['info']['name']
            password = SecureRandom.hex
            @user = self.create(email: auth_hash['info']['email'], username: username, name: name, password: password)
        end
        @user
    end

end
