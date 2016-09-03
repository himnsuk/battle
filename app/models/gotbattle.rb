class Gotbattle < ActiveRecord::Base
  def self.search(term)
    where("lower(name) like ? ", "%#{term}%").pluck(:name)
  end

  def self.list_battles(term)
    where("lower(name) like ? ", "%#{term}%")
  end
end
