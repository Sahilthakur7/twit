require "bacon"

RSpec.describe Bacon do
    it "should be edible" do
        expect(Bacon.new.edible?).to be(true)
    end

    it "can expire" do
        bacon = Bacon.new
        bacon.expired!
        expect(bacon.edible?).to be(false)
    end
end
