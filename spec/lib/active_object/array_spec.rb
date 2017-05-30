require 'spec_helper'

describe ActiveObject::Array do

  describe '#after' do
    it 'to be 3' do
      expect([1, 2, 3].after(2)).to eq(3)
    end

    it 'to be 1' do
      expect([1, 2, 3].after(3)).to eq(1)
    end

    it 'to be nil' do
      expect([1, 2, 3].after(4)).to eq(nil)
    end
  end

  describe '#before' do
    it 'to be 3' do
      expect([1, 2, 3].before(2)).to eq(1)
    end

    it 'to be 1' do
      expect([1, 2, 3].before(1)).to eq(3)
    end

    it 'to be nil' do
      expect([1, 2, 3].before(4)).to eq(nil)
    end
  end

  describe '#denillify(!)' do
    it 'to be [0, 2, 3]' do
      expect([nil, 2, 3].denillify).to eq([0, 2, 3])
      expect([nil, 2, 3].denillify!).to eq([0, 2, 3])
    end

    it 'to be [0, 2, 3]' do
      expect([nil, 2, 3].denillify(9)).to eq([9, 2, 3])
      expect([nil, 2, 3].denillify!(9)).to eq([9, 2, 3])
    end
  end

  describe '#delete_first(!)' do
    it 'to be [2, 3]' do
      expect([1, 2, 3].delete_first).to eq([2, 3])
      expect([1, 2, 3].delete_first!).to eq([2, 3])
    end
  end

  describe '#delete_last(!)' do
    it 'to be [1, 2]' do
      expect([1, 2, 3].delete_last).to eq([1, 2])
      expect([1, 2, 3].delete_last!).to eq([1, 2])
    end
  end

  describe '#delete_values' do
    it 'to be [3, 4]' do
      array = [1, 2, 3, 4]
      array.delete_values(1, 2)

      expect(array).to eq([3, 4])
    end
  end

  describe '#dig' do
    it 'to be twelve' do
      expect(['zero', %w(ten eleven twelve), 'two'].dig(1, 2)).to eq('twelve')
    end
  end

  describe '#duplicates' do
    it 'to be [1, 2]' do
      expect([1, 1, 2, 2, 2, 3].duplicates).to eq([1, 2])
    end

    it 'to be 2' do
      expect([1, 1, 2, 2, 2, 3].duplicates(3)).to eq([2])
    end
  end

  describe '#from' do
    it 'to be [1, 2, 3]' do
      expect([1, 2, 3].from(0)).to eq([1, 2, 3])
    end

    it 'to be [2, 3]' do
      expect([1, 2, 3].from(1)).to eq([2, 3])
    end

    it 'to be [3]' do
      expect([1, 2, 3].from(-1)).to eq([3])
    end
  end

  describe '#groups' do
    it 'to be [["1", "2", "3"], ["4", "5", "6"], ["7", "8", "9"], ["10"]]' do
      expect(%w(1 2 3 4 5 6 7 8 9 10).groups(3)).to eq([%w(1 2 3), %w(4 5 6), %w(7 8 9), %w(10)])
    end
  end

  describe '#in_groups' do
    it 'to be [["1", "2", "3", "4"], ["5", "6", "7", nil], ["8", "9", "10", nil]]' do
      expect(%w(1 2 3 4 5 6 7 8 9 10).in_groups(3)).to eq([
                                                            %w(1 2 3 4),
                                                            ['5', '6', '7', nil],
                                                            ['8', '9', '10', nil]
                                                          ])
    end

    it 'to be [["1", "2", "3", "4"], ["5", "6", "7", "&nbsp;"], ["8", "9", "10", "&nbsp;"]]' do
      expect(%w(1 2 3 4 5 6 7 8 9 10).in_groups(3, '&nbsp;')).to eq([
                                                                      %w(1 2 3 4),
                                                                      ['5', '6', '7', '&nbsp;'],
                                                                      ['8', '9', '10', '&nbsp;']
                                                                    ])
    end

    it 'to be [["1", "2", "3", "4"], ["5", "6", "7"], ["8", "9", "10"]]' do
      expect(%w(1 2 3 4 5 6 7 8 9 10).in_groups(3, false)).to eq([
                                                                   %w(1 2 3 4),
                                                                   %w(5 6 7),
                                                                   %w(8 9 10)
                                                                 ])
    end
  end

  describe '#in_groups_of' do
    it 'to be [["1", "2", "3"], ["4", "5", "6"], ["7", "8", "9"], ["10", nil, nil]]' do
      expect(%w(1 2 3 4 5 6 7 8 9 10).in_groups_of(3)).to eq([
                                                               %w(1 2 3),
                                                               %w(4 5 6),
                                                               %w(7 8 9),
                                                               ['10', nil, nil]
                                                             ])
    end

    it 'to be [["1", "2", "3"], ["4", "5", "6"], ["7", "8", "9"], ["10", "&nbsp;", "&nbsp;"]]' do
      expect(%w(1 2 3 4 5 6 7 8 9 10).in_groups_of(3, '&nbsp;')).to eq([
                                                                         %w(1 2 3),
                                                                         %w(4 5 6),
                                                                         %w(7 8 9),
                                                                         ['10', '&nbsp;', '&nbsp;']
                                                                       ])
    end

    it 'to be [["1", "2", "3"], ["4", "5", "6"], ["7", "8", "9"], ["10"]]' do
      expect(%w(1 2 3 4 5 6 7 8 9 10).in_groups_of(3, false)).to eq([
                                                                      %w(1 2 3),
                                                                      %w(4 5 6),
                                                                      %w(7 8 9),
                                                                      %w(10)
                                                                    ])
    end
  end

  describe '#nillify(!)' do
    it 'to be [nil, 2, 3]' do
      expect(['', 2, 3].nillify).to eq([nil, 2, 3])
      expect(['', 2, 3].nillify!).to eq([nil, 2, 3])
    end
  end

  describe '#percentile' do
    it 'to be 2' do
      expect([1, 2, 3, 4].percentile(49)).to eq(2)
    end

    it 'to be 3' do
      expect([1, 2, 3, 4].percentile(50)).to eq(3)
      expect([1, 2, 3, 4, 5].percentile(50)).to eq(3)
    end
  end

  describe '#probability' do
    it 'to be [:a, :b, :c, :c]' do
      expect([:a, :b, :c, :c].probability).to eq({ a: 0.25, b: 0.25, c: 0.5 })
    end
  end

  describe '#reject_values' do
    it 'to be [1, 3, 5]' do
      expect([1, 2, 3, 4, 5].reject_values(2, 4)).to eq([1, 3, 5])
    end
  end

  describe '#sample!' do
    it 'to be true' do
      sarray = [1, 2, 3]

      expect(sarray.exclude?(sarray.sample!)).to eq(true)
    end
  end

  describe '#split' do
    it 'to be [[1, 2], [4, 5]]' do
      expect([1, 2, 3, 4, 5].split(3)).to eq([[1, 2], [4, 5]])
    end

    it 'to be [[1, 2], [4, 5], [7, 8], [10]]' do
      expect((1..10).to_a.split { |i| (i % 3).zero? }).to eq([[1, 2], [4, 5], [7, 8], [10]])
    end
  end

  describe '#strip(!)' do
    it 'to be ["this", "is", "a", "test"]' do
      expect('this    is   a  test'.split(' ').strip).to eq(%w(this is a test))
      expect('this    is   a  test'.split(' ').strip!).to eq(%w(this is a test))
    end

    it 'to be ["this", "that"]' do
      expect(['this', '', 'that', nil, false].strip).to eq(%w(this that))
      expect(['this', '', 'that', nil, false].strip!).to eq(%w(this that))
    end
  end

  describe '#to' do
    it 'to be [1]' do
      expect([1, 2, 3].to(0)).to eq([1])
    end

    it 'to be [1, 2]' do
      expect([1, 2, 3].to(1)).to eq([1, 2])
    end

    it 'to be [1, 2, 3]' do
      expect([1, 2, 3].to(-1)).to eq([1, 2, 3])
    end
  end

  describe '#to_sentence' do
    it 'to be ""' do
      expect([].to_sentence).to eq('')
    end

    it 'to be "one"' do
      expect(%w(one).to_sentence).to eq('one')
    end

    it 'to be "one and two"' do
      expect(%w(one two).to_sentence).to eq('one and two')
    end

    it 'to be "one, two, and three"' do
      expect(%w(one two three).to_sentence).to eq('one, two, and three')
    end

    it 'to be "one-two"' do
      expect(%w(one two).to_sentence(two_words_connector: '-')).to eq('one-two')
    end

    it 'to be "one or two or at least three"' do
      str = 'one or two or at least three'

      expect(%w(one two three).to_sentence(words_connector: ' or ', last_word_connector: ' or at least ')).to eq(str)
    end
  end

end
