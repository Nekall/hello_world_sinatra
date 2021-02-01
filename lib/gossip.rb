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
    CSV.open("db/gossip.csv", "ab") do |csv|
      csv << @array
    end
  end
  #Méthode qui retourne l'ingralité des gossips
  def self.all
    all_gossips = []
    CSV.read("./db/gossip.csv").each do |csv_line|
      all_gossips << Gossip.new(csv_line[0], csv_line[1])
    end
    return all_gossips
  end
  #Méthode qui retourne l'author et le gossip spécifique à l'index renseigné
  def self.find(id)
    gossips = []
    CSV.read("./db/gossip.csv").each_with_index do |csv_line, index|
      if (id == index)
        gossips << Gossip.new(csv_line[0], csv_line[1])
      end
    end
    return gossips
  end
end
