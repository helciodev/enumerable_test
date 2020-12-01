# frozen_string_literal: true

require 'rspec'
require '../enumerable_methods'
require 'colorize'

describe Enumerable do
  arr_in = [1, 3, 5, 4, 0]
  enum_in = (1..5)
  bool_in = [true, false, false, true]
  regexp_in = %w[dOg door rod blade]

  describe '[my_each] >'.bold.blue do
    it 'Returns all the elements in an Array' do
      expect(arr_in.my_each { |e| }).to eql(arr_in.each { |e| })
    end

    block = proc { |i| i + 1 }
    it 'my_each block parsing test.' do
      expect { print(arr_in.my_each(&block)) }.to output(print(arr_in.each(&block))).to_stdout
    end

    it 'my_each range parsing test.' do
      expect(enum_in.my_each { |e| }).to eql(enum_in.each { |e| })
    end
  end

  describe '[my_each_with_index] >'.bold.blue do
    it 'Returns all the elements in an Array' do
      expect(arr_in.my_each_with_index { |i, j| }).to eql(arr_in.each_with_index { |i, j| })
    end

    block = proc { |elem, idx| puts "#{elem} : #{idx}" }
    it 'my_each block parsing test.' do
      expect { print(arr_in.my_each_with_index(&block)) }.to output(print(arr_in.each_with_index(&block))).to_stdout
    end

    my_each_with_index_output = ''
    block1 = proc { |num, idx| my_each_with_index_output += "Num: #{num}, idx: #{idx}\n" }
    it 'my_each range & block parsing test.' do
      expect { print(arr_in.my_each_with_index(&block1)) }.to output(print(arr_in.each_with_index(&block1))).to_stdout
    end
  end

  describe '[my_select] >'.bold.blue do
    it 'Returns all the elements that are even in an array' do
      expect(arr_in.my_select(&:even?)).to eql(arr_in.select(&:even?))
    end

    it 'returns all the elements bigger than zero' do
      expect(arr_in.my_select { |e| e > 0 }).to eql(arr_in.select { |e| e > 0 })
    end

    it 'Returns all the elements that are odd in an array' do
      expect(arr_in.my_select(&:odd?)).to eql(arr_in.select(&:odd?))
    end

    it 'Returns all the elements that are odd in a range' do
      expect(enum_in.my_select(&:odd?)).to eql(enum_in.select(&:odd?))
    end
  end

  describe '[my_all tests] >'.bold.blue do
    it 'my_all no-block.' do
      expect(arr_in.my_all?).to eq(arr_in.all?)
    end

    it 'my_all even value.' do
      expect(arr_in.my_all?(&:even?)).to eq(arr_in.all?(&:even?))
    end

    it 'my_all block parsing.' do
      expect(arr_in.my_all? { |n| n > 0 }).to eq(arr_in.all? { |n| n > 0 })
    end

    it 'my_all class parsing.' do
      expect(arr_in.my_all?(Numeric)).to eq(arr_in.all?(Numeric))
    end

    it 'my_all sub-class parsing.' do
      expect(arr_in.my_all?(Integer)).to eq(arr_in.all?(Integer))
    end

    it 'my_all range parsing.' do
      expect(enum_in.my_all?(1)).to eq(enum_in.all?(1))
    end

    it 'my_all regexp parsing.' do
      expect(regexp_in.my_all?(/d/)).to eq(regexp_in.all?(/d/))
    end
  end
end
