require 'test/unit'
require 'transmogrify'

class TestPiglatin < Test::Unit::TestCase
  include Transmogrifiers::Piglatin

  def test_convert_word_with_leading_vowel
    actual    = :asshole
    expected = :assholeway

    assert_equal transmogrify(actual), expected
  end

  def test_convert_word_with_leading_consonant
    actual    = :douche
    expected = :oucheday

    assert_equal transmogrify(actual), expected
  end

  def test_convert_word_with_multiple_leading_consonants
    actual    = :stripper
    expected = :ipperstray

    assert_equal transmogrify(actual), expected
  end

end
