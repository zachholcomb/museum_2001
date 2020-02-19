class Museum
  attr_reader :name, :exhibits

  def initialize(name)
    @name = name
    @exhibits = []
  end

  def add_exhibit(new_exhibit)
    @exhibits << new_exhibit
  end

  def recommend_exhibits(patron)
    recommended = [] #will refactor if i have time
    patron.interests.each do |interest|
      recommended << @exhibits.find_all { |exhibit| exhibit.name == interest }
    end
    recommended.flatten
  end
end
