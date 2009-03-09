class AddData < ActiveRecord::Migration
  def self.up
    count = 0
    locations = []
    File.open('/usr/share/dict/words', 'rb') { |f|
      f.each_line do |line|
        next if count >= 200
        if count < 100
          locations << Location.create!(
            :name       => line.chomp,
            :latitude   => 100.0,
            :longitude  => 100.0,
            :address    => line.chomp
          )
        else
          group = Group.create!(:name => line.chomp)
          Event.create!(
            :description => 'some event',
            :location => locations.pop,
            :group => group
          )
        end
        count += 1
      end
    }
  end
end
