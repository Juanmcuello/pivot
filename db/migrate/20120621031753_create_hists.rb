class CreateHists < ActiveRecord::Migration
  def up
    create_table :hists do |t|
      t.date :date
      t.integer :source_id
      t.integer :count
    end

    1.upto(50) do |i|
      Hist.create({date: Date.today - i, source_id: 1, count: rand(10)})
      Hist.create({date: Date.today - i, source_id: 1, count: rand(10)})

      Hist.create({date: Date.today - i, source_id: 2, count: rand(10)})
      Hist.create({date: Date.today - i, source_id: 2, count: rand(10)})

      Hist.create({date: Date.today - i, source_id: 3, count: rand(10)})
      Hist.create({date: Date.today - i, source_id: 3, count: rand(10)})
    end

  end

  def down
    drop_table :hists
  end
end
