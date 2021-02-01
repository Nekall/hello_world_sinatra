class Gossip
  attr_reader :author
  attr_reader :content

  def initialize(author, content)
    @content = content
    @author = author
    @array = []
    @array << @author
    @array << @content
  end
  #Sauvegarder les potins + autheurs dans un CSV
  def save
    #mode = 'a' write only appends data at end of file
    CSV.open("db/gossip.csv", "a") do |csv|
      csv << @array
    end
  end

  def self.all
    all_gossips = []
    CSV.read("./db/gossip.csv").each do |csv_line|
      all_gossips << Gossip.new(csv_line[0], csv_line[1])
    end
    return all_gossips
  end

  def self.find(id)
    id = id.to_i
    all_gossips = []
    CSV.read("./db/gossip.csv").each_with_index do |item, index|
      if (index == id or index == (id + 1))
        all_gossips << item
      end
    end
    return all_gossips
  end

end
