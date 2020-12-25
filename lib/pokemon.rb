class Pokemon
  attr_accessor :id, :name, :type, :db
  def initialize(id:, name:, type:, db:)
    @id = id
    @name = name
    @type = type
    @db = db
  end

  def self.save(name, type, db)
    sql = <<-SQL
      INSERT INTO pokemon (name, TYPE) 
      VALUES (?, ?)
    SQL
    db.execute(sql, name, type)
  end

  def self.find(id, db)
    sql = <<-SQL
      SELECT * FROM pokemon
      WHERE id = ?
    SQL
    poke_data = db.execute(sql, id)
    # binding.pry
    Pokemon.new(id: poke_data[0][0], name: poke_data[0][1], type: poke_data[0][2],db: db)
  end
end
