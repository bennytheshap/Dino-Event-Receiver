require 'randomly_sharded_mongomapper_document'

class User
  include MongoMapper::Document
  plugin RandomShardPlugin
  devise :registerable, :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable, :token_authenticatable, :lockable
  
  key :username, String, :required => true, :unique => true
  key :first_name, String
  key :last_name, String
  #key :email, String, :required => true, :unique => true

  #devise stuff
  key :encrypted_password, String
  key :password_salt, String
  key :reset_password_token, String
  key :remember_token, String
  key :remember_created_at, Time
  key :sign_in_count, Integer
  key :current_sign_in_at, Time
  key :current_sign_in_ip, String
  
  many :therapies
  many :contourings
  many :patient_visits
    
  timestamps!
end