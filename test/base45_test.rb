require "test_helper"

class Base45Test < Minitest::Test

  GOOD_DATA = [
    ["", ""],
    ["Hello!!", "%69 VD92EX0"],
    ["base-45", "UJCLQE7W581"],
    ["ietf!", "QED8WEX0"],
    [
        "The quick brown fox jumps over the lazy dog",
        "8UADZCKFEOEDJOD2KC54EM-DX.CH8FSKDQ$D.OE44E5$CS44+8DK44OEC3EFGVCD2",
    ],
  ]

  BAD_BASE45_STRINGS = ["xyzzy", "::::", 42]

  def test_that_it_has_a_version_number
    refute_nil ::Base45::VERSION
  end

  def test_encode_good
    GOOD_DATA.each do |data|
      encoded_res = Base45.encode(data[0])
      assert_equal data[1], encoded_res
    end
  end

  def test_encode_bad
    assert_raises Base45::Error do
      Base45.encode(42)
    end
  end

  def test_decode_good
    GOOD_DATA.each do |data|
      binary_res = Base45.decode(data[1])
      assert_equal data[0].bytes, binary_res
    end
  end
end
