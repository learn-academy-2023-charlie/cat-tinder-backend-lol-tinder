require 'rails_helper'

RSpec.describe Champ, type: :model do
  it "should validate name" do
    champ = Champ.create(name: nil, age: 26, ability: 'fighter', image: './assets/images/garen.jpeg')

    expect(champ.errors[:name]).to_not be_empty
end

it "should validate age" do
    champ = Champ.create(name: 'Garen Crownguard', age: nil, ability: 'fighter', image: './assets/images/garen.jpeg')

    expect(champ.errors[:age]).to_not be_empty
end

it "should validate ability" do
    champ = Champ.create(name: 'Garen Crownguard', age: 26, ability: nil, image: './assets/images/garen.jpeg')

    expect(champ.errors[:ability]).to_not be_empty
end

it "should validate ability to be at least 10 characters long" do
    champ = Champ.create(name: 'Garen Crownguard', age: 26, ability: 'fighter', image: './assets/images/garen.jpeg')

    expect(champ.errors[:ability].first).to eq("is too short (minimum is 10 characters)")
end

it "should validate image" do
    champ = Champ.create(name: 'Garen Crownguard', age: nil, ability: 'fighter', image: nil)

    expect(champ.errors[:image]).to_not be_empty
end    
end