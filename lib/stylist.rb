class Stylist
  attr_reader(:id, :stylist_name)

  define_method(:initialize) do |attributes|
    @id = attributes.fetch("id")
    @stylist_name = attributes.fetch("stylist_name")
  end

  define_singleton_method(:all) do
    stylists = []
    returned_stylists = DB.exec("SELECT * FROM stylists;")
    returned_stylists.each() do |stylist|
      id = stylist.fetch("id").to_i()
      stylist_name = stylist.fetch("stylist_name")
      stylists.push(Stylist.new(:id => id, :stylist_name => stylist_name))
    end
    stylists
  end
end
