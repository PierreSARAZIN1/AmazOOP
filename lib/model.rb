require 'csv'


class Model

  def self.all
    
    data = []
    CSV.foreach(("db/inventaire.csv"), headers: true, col_sep: "\t") do |row|
      @item = Item.new(row[0].to_i, row[1], row[2], row[3], row[4])
      data << @item
    end

    return data
  end
end