require 'test/unit'
require 'transmogrify'

class TestPiglatin < Test::Unit::TestCase
  def transmogrifier
    Transmogrify.new(Transmogrifiers::Piglatin)
  end
  private :transmogrifier

  def assert_piglatin_equal(args = {})
    args.each do |before, after|
      assert_equal after, transmogrifier.transmogrify(before)
    end
  end
  private :assert_piglatin_equal

  def test_piglatin_conversions
    assert_piglatin_equal({
      :asshole  => :assholeway,
      :douche   => :oucheday,
      :stripper => :ipperstray,
      :Asshole  => :Assholeway,
      :Douche   => :Oucheday,
      :Stripper => :Ipperstray,
      :foo01    => :oofay01,
    })
  end
end
