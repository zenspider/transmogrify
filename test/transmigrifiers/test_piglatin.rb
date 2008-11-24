require 'test/unit'
require 'transmogrify'

class TestPiglatin < Test::Unit::TestCase
  include Transmogrifiers::Piglatin

  def test_convert_word_with_leading_vowel
    given    = :asshole
    expected = :assholeway

    assert_equal pig_latinize(given), expected
  end

  def test_convert_word_with_leading_consonant
    given    = :douche
    expected = :oucheday

    assert_equal pig_latinize(given), expected
  end

  def test_convert_word_with_multiple_leading_consonants
    given    = :stripper
    expected = :ipperstray

    assert_equal pig_latinize(given), expected
  end

end
