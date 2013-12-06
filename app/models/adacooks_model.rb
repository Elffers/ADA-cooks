class AdaCooksModel < ActiveRecord::Base
  def self.find_all_by_name(name)
    self.find(:all, :condition => ["lower(name)=?", name])
  end

end
