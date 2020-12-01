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

  describe '[my_any tests] >'.bold.blue do
    it 'my_any no-block.' do
      expect(arr_in.my_any?).to eq(arr_in.any?)
    end
    it 'my_any even value.' do
      expect(arr_in.my_any?(&:even?)).to eq(arr_in.any?(&:even?))
    end
    it 'my_any block parsing.' do
      expect(arr_in.my_any? { |n| n > 0 }).to eq(arr_in.any? { |n| n > 0 })
    end
    it 'my_any class parsing.' do
      expect(arr_in.my_any?(Numeric)).to eq(arr_in.any?(Numeric))
    end
    it 'my_any sub-class parsing.' do
      expect(arr_in.my_any?(Integer)).to eq(arr_in.any?(Integer))
    end
    it 'my_any range parsing.' do
      expect(enum_in.my_any?(1)).to eq(enum_in.any?(1))
    end
    it 'my_any regexp parsing.' do
      expect(regexp_in.my_any?(/d/)).to eq(regexp_in.any?(/d/))
    end
  end

  describe '[my_none tests] >'.bold.blue do
    it 'my_none no-block.' do
      expect(arr_in.my_none?).to eq(arr_in.none?)
    end

    it 'my_none even value.' do
      expect(arr_in.my_none?(&:even?)).to eq(arr_in.none?(&:even?))
    end

    it 'my_none block parsing.' do
      expect(arr_in.my_none? { |n| n > 0 }).to eq(arr_in.none? { |n| n > 0 })
    end

    it 'my_none class parsing.' do
      expect(arr_in.my_none?(Numeric)).to eq(arr_in.none?(Numeric))
    end

    it 'my_any sub-class parsing.' do
      expect(arr_in.my_none?(Integer)).to eq(arr_in.my_none?(Integer))
    end

    it 'my_none range parsing.' do
      expect(enum_in.my_none?(1)).to eq(enum_in.none?(1))
    end

    it 'my_none regexp parsing.' do
      expect(regexp_in.my_none?(/d/)).to eq(regexp_in.none?(/d/))
    end
  end

  describe '[my_count tests] >'.bold.blue do
    it 'my_count no-block.' do
      expect(arr_in.my_count).to eq(arr_in.count)
    end
    it 'my_count even value.' do
      expect(arr_in.my_count(&:even?)).to eq(arr_in.count(&:even?))
    end
    it 'my_count block parsing.' do
      expect(regexp_in.my_count { |s| s == s.upcase }).to eq(regexp_in.count { |s| s == s.upcase })
    end
    it 'my_count range parsing.' do
      expect(enum_in.my_count(1)).to eq(enum_in.count(1))
    end
  end

  describe '[my_map tests] >'.bold.blue do
    it 'my_map even value.' do
      expect(arr_in.my_map(&:even?)).to eq(arr_in.map(&:even?))
    end

    it 'my_map block parsing.' do
      expect(regexp_in.my_map { |s| s == s.upcase }).to eq(regexp_in.map { |s| s == s.upcase })
    end

    it 'my_map block parsing insertion.' do
      expect(regexp_in.my_map { |word| "#{word}?" }).to eq(regexp_in.map { |word| "#{word}?" })
    end

    it 'my_map inversion.' do
      expect(regexp_in.my_map(&:!)).to eq(regexp_in.map(&:!))
    end
  end
end
