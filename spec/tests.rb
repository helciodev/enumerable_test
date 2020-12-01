#my_each test
require 'rspec'
require '../enumerable_methods'
require 'colorize'

describe Enumerable do
    arr_in = [1, 3, 5, 4, 0]
    enum_in = (1..5)
    bool_in = [true, false, false, true]
    regexp_in = %w[dOg door rod blade]

        describe "#my_each" do
        it "returns all the elements in an Array" do
        expect(arr_in.my_each { |e| e }).to  eql( arr_in.each { |e| e } )
        end
    end
end


    
