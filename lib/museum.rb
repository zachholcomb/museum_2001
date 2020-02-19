class Museum
  attr_reader :name, :exhibits, :patrons

  def initialize(name)
    @name = name
    @exhibits = []
    @patrons = []
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

  def admit(new_patron)
    @patrons << new_patron
  end
end
