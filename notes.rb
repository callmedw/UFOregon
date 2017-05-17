#--Oregon sightings with lat/long--setup instructions--#

##in config<database.yml:
development:
  adapter: postgresql
  database: oregon_sightings_development

test:
  adapter: postgresql
  database: oregon_sightings_test
##in terminal
rake db:create
rake db:create_migration NAME=create_table
##in db<migrate<migration file
class Table < ActiveRecord::Migration[5.1]
  def change
    create_table(:ufos) do |t|
      t.column(:sight_date, :text)
      t.column(:city, :text)
      t.column(:state, :text)
      t.column(:shape, :text)
      t.column(:duration, :text)
      t.column(:summary, :text)
      t.column(:latitude, :text)
      t.column(:longitude, :text)
    end
  end
end
##in terminal
rake db:migrate
rake db:test:prepare
##in psql \c to oregon_sightings_development:
COPY ufos(sight_date, city, state, shape, duration, summary, latitude, longitude) FROM '/Users/dw/Desktop/UFOregon/raw_data/oregon_sightings_latlong.csv' DELIMITER ',' CSV;
