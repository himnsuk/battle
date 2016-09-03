require "csv"
namespace :got_battle_data do
  desc "Seed Battle Data"
  task :battle => :environment do
    CSV.foreach(File.expand_path('lib/tasks/battles.csv'), headers: true) do |row|
      csv_row = row.to_hash
      create_customer = Gotbattle.create!(:name => csv_row["name"], :year => csv_row["year"], :battle_number => csv_row["battle_number"], :attacker_king => csv_row["attacker_king"], :defender_king => csv_row["defender_king"], :attacker_outcome => csv_row["attacker_outcome"], :bettle_type => csv_row["battle_type"], :major_death => csv_row["major_death"], :major_capture => csv_row["major_capture"], :attacker_size => csv_row["attacker_size"], :defender_size => csv_row["defender_size"], :attacker_commander => csv_row["attacker_commander"], :defender_commander => csv_row["defender_commander"], :summer => csv_row["summer"], :location => csv_row["location"], :region => csv_row["region"], :note => csv_row["note"])
      puts create_customer.name
    end
  end
end
