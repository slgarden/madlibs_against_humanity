require_relative "../models/sentence"

class View < ActiveRecord::Base
  def self.display_one
    p "*" * 70
    p modified
    p "*" * 70
  end
end


