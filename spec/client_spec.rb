require("spec_helper")

describe("Client") do
  describe(".all") do
    it("is empty at first") do
      expect(Client.all()).to(eq([]))
    end
  end

  describe("#==") do
    it("is the same client if it has the same client name and stylist id") do
      test_client = Client.new({:client_name => "Judith", :stylist_id => 1})
      test_client2 = Client.new({:client_name => "Judith", :stylist_id => 1})
      expect(test_client).to(eq(test_client2))
    end
  end

  describe("#stylist_id") do
    it("lets you read the stylist ID out") do
      test_client = Client.new({:client_name => "Judith", :stylist_id => 1})
      expect(test_client.stylist_id()).to(eq(1))
    end
  end

  describe("#save") do
    it("adds a client to the array of saved clients") do
      test_client = Client.new({:client_name => "Judith", :stylist_id => 1})
      test_client.save()
      expect(Client.all()).to(eq([test_client]))
    end
  end
end
