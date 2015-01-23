require("spec_helper")

describe("Stylist") do
  describe(".all") do
    it("is empty at first") do
      expect(Stylist.all()).to(eq([]))
    end
  end

  describe(".find") do
    it("finds a stylist based in its id") do
      test_stylist = Stylist.new({:stylist_name => "Sherri", :id => nil})
      test_stylist.save()
      test_stylist2 = Stylist.new({:stylist_name => "Jessica", :id => nil})
      test_stylist2.save()
      expect(Stylist.find(test_stylist.id())).to(eq(test_stylist))
    end
  end

  describe("#save") do
    it("saves stylists to the database") do
      test_stylist = Stylist.new({:stylist_name => "Sherri", :id => nil})
      test_stylist.save()
      expect(Stylist.all()).to(eq([test_stylist]))
    end
  end

  describe("#==") do
    it("is the same stylist if it has the same name") do
      test_stylist = Stylist.new({:stylist_name => "Sherri", :id => nil})
      test_stylist2 = Stylist.new({:stylist_name => "Sherri", :id => nil})
      expect(test_stylist).to(eq(test_stylist2))
    end
  end

  describe("#clients") do
    it("returns an array of clients for that stylist") do
      test_stylist = Stylist.new({:stylist_name => "Sherri", :id => nil})
      test_stylist.save()
      test_client = Client.new({:client_name => "Judith", :stylist_id => test_stylist.id()})
      test_client.save()
      test_client2 = Client.new({:client_name => "Mary", :stylist_id => test_stylist.id()})
      test_client2.save()
      expect(test_stylist.clients()).to(eq([test_client, test_client2]))
    end
  end
end
