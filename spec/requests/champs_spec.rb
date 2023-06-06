require 'rails_helper'

RSpec.describe "Champs", type: :request do
  describe "GET /index" do
		it "gets a list of champs" do
			Champ.create(
        name: "Garen Crownguard",
        age: 26,
        ability: "Demacian Justice",
        image: "./assets/images/garen.jpeg",
        			)

			get '/champs'
			champ = JSON.parse(response.body)
			expect(response).to have_http_status(200)
			expect(champ.length).to eq 1
		end
	end

  	describe "POST/ create" do
		it "creates a champ" do
			champ_params = {
				champ: {
          name: "Garen Crownguard",
          age: 26,
          ability: "Demacian Justice",
          image: "./assets/images/garen.jpeg",
        				}	
			}

			post '/champs', params: champ_params
			expect(response).to have_http_status(200)
			champ = Champ.first
			expect(champ.name).to eq 'Garen Crownguard'
			expect(champ.age).to eq 3
			expect(champ.ability).to eq 'Demacian Justice'
			expect(champ.image).to eq "https://cdn.britannica.com/06/150806-050-6AE99C98/Proboscis-champ.jpg?w=690&h=388&c=crop"
		end
	end

  	describe "PATCH/ update" do
		it "updates a champ" do
			champ_params = {
				champ: {
					name: "Garen Crownguard",
					age: 3,
					ability: "Demacian Justice",
					image: "https://cdn.britannica.com/06/150806-050-6AE99C98/Proboscis-champ.jpg?w=690&h=388&c=crop"
				}
			}

			post '/champs', params: champ_params
			champ = Champ.first
			updated_champ_params = {
				champ: {
					name: "Garen Crownguard",
					age: 4,
					ability: "Demacian Justice",
					image: "https://cdn.britannica.com/06/150806-050-6AE99C98/Proboscis-champ.jpg?w=690&h=388&c=crop"
				}
			}

			patch "/champs/#{champ.id}", params: updated_champ_params
			updated_champ = Champ.find(champ.id)
			expect(response).to have_http_status(200)
			expect(updated_champ.age).to eq 4
		end
	end

  	describe "DELETE /destroy" do
		it"deletes a champ" do
			champ_params = {
				champ: {
          name: "Garen Crownguard",
          age: 26,
          ability: "Demacian Justice",
          image: "./assets/images/garen.jpeg",
        		    	}
			}

			post "/champs", params: champ_params
			champ = Champ.first
			delete"/champs/#{champ.id}"
			expect(response).to have_http_status(200)
			champs = Champ.all
			expect(champs).to be_empty
		end
	end

	describe "cannot create a champ without valid attributes" do
    	it "doesn't create a champ without a name" do
            champ_params = {
                champ: {
                  age: 27,
                  ability: "Death Lotus",
                  image: "./assets/images/kat.png",                }
            }

            post '/champs', params: champ_params
            expect(response.status).to eq(422)
            champ = JSON.parse(response.body)
            expect(champ['name']).to include "can't be blank"
        end

    	it "doesn't create a champ without an age" do
            champ_params = {
                champ: {
                  name: "Katarina Du Couteau",
                  ability: "Death Lotus",
                  image: "./assets/images/kat.png",                }
            }

            post '/champs', params: champ_params
            expect(response.status).to eq(422)
            champ = JSON.parse(response.body)
            expect(champ['age']).to include "can't be blank"
        end

		it "doesn't create a champ without an ability" do
			champ_params = {
				champ: {
          name: "Katarina Du Couteau",
          age: 27,
         
          image: "./assets/images/kat.png",		
        		}
			}

			post '/champs', params: champ_params
			expect(response.status).to eq(422)
			champ = JSON.parse(response.body)
			expect(champ['ability']).to include "can't be blank"
		end

		it "doesn't create a champ without an image" do
			champ_params = {
				champ: {
          name: "Katarina Du Couteau",
          age: 27,
          ability: "Death Lotus",
        			}
			}

			post '/champs', params: champ_params
			expect(response.status).to eq(422)
			champ = JSON.parse(response.body)
			expect(champ['image']).to include "can't be blank"
		end
	end
end
