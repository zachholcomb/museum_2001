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

  def patrons_by_exhibit_interest
    exhibit_patrons = {}
    @exhibits.each do |exhibit|
      @patrons.each do |patron|
        if exhibit_patrons[exhibit] == nil
          exhibit_patrons[exhibit] = [patron] if recommend_exhibits(patron).include?(exhibit)
          exhibit_patrons[exhibit] = [] if !recommend_exhibits(patron).include?(exhibit)
        else
          exhibit_patrons[exhibit] << patron if recommend_exhibits(patron).include?(exhibit)
        end
      end

    end
    exhibit_patrons
  end
end
