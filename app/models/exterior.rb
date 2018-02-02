module Exterior
  def self.table_name_prefix
    'exterior_'
  end

  has_one :exterior_building_exterior
end
