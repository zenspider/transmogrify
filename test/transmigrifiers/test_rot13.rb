require 'test/unit'
require 'transmogrify'

class TestRot13 < Test::Unit::TestCase
  include Transmogrifiers::Rot13

  def test_convert_word_with_leading_vowel
    actual    = :asshole
    expected  = :nffubyr

    assert_equal expected, transmogrify(actual)
  end

  def test_convert_word_with_leading_consonant
    actual    = :douche
    expected  = :qbhpur

    assert_equal expected, transmogrify(actual)
  end

  def test_convert_word_with_multiple_leading_consonants
    actual    = :stripper
    expected  = :fgevccre

    assert_equal expected, transmogrify(actual)
  end

end
