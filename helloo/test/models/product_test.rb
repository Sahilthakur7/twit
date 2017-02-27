require 'test_helper'

class ProductTest < ActiveSupport::TestCase
    fixtures :products

    test "Product attributes must not be empty" do
        product = Product.new
        assert product.invalid?
        assert product.errors[:title].any?
        assert product.errors[:description].any?
        assert product.errors[:price].any?
        assert product.errors[:image_url].any?
    end

    test "Price of product must be positive" do
       
        
        product = Product.new( title: "paul Pogba",
                              description: "A beautiful footballer",
                              image_url: "xyz.jpg"

        
        )
        product.price = -1
        assert product.invalid?
        assert_equal ["must be greater than or equal to 0.01"], product.errors[:price]

        product.price = 0
        assert product.invalid?
        assert_equal ["must be greater than or equal to 0.01"], product.errors[:price]

        product.price = 1
        assert product.valid?

    end

    def new_product(image_url)
            Product.new(title: "Henrikh Mkhitaryan",
                        description: "Khud dekhle ara bhai",
                        price: 1,
                        image_url: image_url
                       )

    end

    test "image url" do
    
        ok= %w{ fred.gif FRED.GIF fred.png FRED.PNG FRED.JPG fred.jpg  }

        bad= %w{ fred.doc fred.gif/more fred.gif.more  }

        ok.each do |name|
            assert new_product(name).valid? , "#{name} is valid "

        end

        bad.each do |name|
            assert new_product(name).invalid? , "#{name} is not valid"
        end 
    end

    test "Products should have unique titles" do

        product = Product.new(title: products(:ruby).title,
                              description: "two",
                              image_url: "two.jpg ",
                              price: 54
                             )
        assert product.invalid?
        assert_equal ["has already been taken"], product.errors[:title]
    end
end


