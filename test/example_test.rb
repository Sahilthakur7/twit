require "minitest/autorun"

class Bacon
    def self.saved?
        true
    end
end

class BaconTest < Minitest::Test
    def test_saved
    assert Bacon.saved? , "our bacon is not saved"
    end
end
