require 'minitest/autorun'
require 'minitest/pride'
require './lib/museum'
require './lib/patron'
require './lib/exhibit'

class MuseumTest < Minitest::Test
  def setup
    @dmns = Museum.new("Denver Museum of Nature and Science")
    @gems_and_minerals = Exhibit.new({name: "Gems and Minerals", cost: 0})
    @dead_sea_scrolls = Exhibit.new({name: "Dead Sea Scrolls", cost: 10})
    @imax = Exhibit.new({name: "IMAX",cost: 15})
    @patron_1 = Patron.new("Bob", 20)
    @patron_1.add_interest("Dead Sea Scrolls")
    @patron_2 = Patron.new("Sally", 20)
    @patron_2.add_interest("IMAX")
  end

  def test_it_exists
    assert_instance_of Museum, @dmns
  end

  def test_it_has_attributes
    assert_equal "Denver Museum of Nature and Science", @dmns.name
    assert_equal [], @dmns.exhibits
  end

  def test_it_can_add_exhibits
  @dmns.add_exhibit(@gems_and_minerals)
  assert_equal [@gems_and_minerals], @dmns.exhibits

  @dmns.add_exhibit(@dead_sea_scrolls)
  assert_equal [@gems_and_minerals, @dead_sea_scrolls], @dmns.exhibits

  @dmns.add_exhibit(@imax)
  assert_equal [@gems_and_minerals, @dead_sea_scrolls, @imax], @dmns.exhibits
  end

  def test_it_can_recomend_exhibits
    recommended_exhibits1 = [@gems_and_minerals, @dead_sea_scrolls]
    assert_equal recommended_exhibits1, @dmns.recommend_exhibits(@patron_1)

    assert_equal [@imax], @dmns.recommend_exhibits(@patron_2)
  end
end




# pry(main)> dmns.recommend_exhibits(patron_1)
# # => [#<Exhibit:0x00007fb400bbcdd8...>, #<Exhibit:0x00007fb400b851f8...>]
#
# pry(main)> dmns.recommend_exhibits(patron_2)
# # => [#<Exhibit:0x00007fb400acc590...>]