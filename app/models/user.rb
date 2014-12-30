require 'csv'

class User < ActiveRecord::Base
  def self.get_user_from_file
    users = {}
    CSV.foreach(Rails.root.join('db','user.csv')) do |row|
      users[row.first.strip] = row.last.strip
    end
    users
  end

  def self.get_ids
    self.get_user_from_file.keys
  end

  def self.valid_credentials?(username, password)
    self.get_user_from_file[username] == password
  end
end
