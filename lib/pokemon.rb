class Pokemon
  attr_accessor :id, :name, :type, :db, :hp

  @@all = []
  def initialize(id:, name:, type:, db:, hp: nil)
    self.id = id
    self.name = name
    self.type = type
    self.db = db
    self.hp = 60
    @@all << self
  end

  def self.all
    @@all
  end

  def self.save(name, type, db)
      db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
    end

  def self.find(id, db)
     self.all.detect {|pokemon| pokemon.id == id}
  end

  def alter_hp(altered_hp, db)
    db.execute("UPDATE pokemon SET hp=? WHERE id=?", altered_hp, self.id)
    self.hp = altered_hp
  end
end
