class Client
  attr_reader(:client_name, :stylist_id)

  define_method(:intialize) do |attributes|
    @client_name = attributes.fetch(:client_name)
    @stylist_id = attributes.fetch(:stylist_id)
  end

  define_singleton_method(:all) do
    clients = []
    returned_clients = DB.exec("SELECT * FROM clients;")
    returned_clients.each() do |client|
      client_name = client.fetch("client_name")
      stylist_id = client.fetch("stylist_id").to_i()
      clients.push(Client.new({:client_name => client_name, :stylist_id => stylist_id}))
    end
    clients
  end
end
