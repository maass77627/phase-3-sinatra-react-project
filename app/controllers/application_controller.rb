class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add your routes here
  get "/" do
    { message: "Good luck with your project!" }.to_json
  end

  get "/recipes" do 
  Recipe.all.to_json
 end

  post "/recipes" do
    # binding.pry
    puts "PARAMS => #{params.inspect}"
   recipe = Recipe.create(name: params[:name], image: params[:image], last_cooked_on: params[:last_cooked_on])
   recipe.to_json
 end

patch "/recipes/:id" do
     recipe = Recipe.find(params[:id])
     recipe.update(
        name: params[:name],
        image: params[:image],
        last_cooked_on: params[:last_cooked_on]
     )
     recipe.to_json

 end

end
