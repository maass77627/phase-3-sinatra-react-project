class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add your routes here
  get "/" do
    { message: "Good luck with your project!" }.to_json
  end

  get "/recipes" do 
    Recipe.all.map {|recipe| recipe.attributes.merge(days_since_last_cooked: recipe.days_since_last_cooked) }.to_json
    
    
  # Recipe.all.to_json
 end

  post "/recipes" do
    # binding.pry
    
   recipe = Recipe.create(name: params[:name], image: params[:image], last_cooked_on: params[:last_cooked_on], ingredients: params[:ingredients], directions: params[:directions], cook_time: params[:cook_time])
   recipe.capitalize_title
   recipe.to_json
 end

patch "/recipes/:id" do
     recipe = Recipe.find(params[:id])
     recipe.update(
        name: params[:name],
        image: params[:image],
        last_cooked_on: params[:last_cooked_on],
        ingredients: params[:ingredients],
        directions: params[:directions],
        cook_time: params[:cook_time],
        category_id: params[:category_id]
     )
     recipe.to_json

 end

 delete "/recipes/:id" do 
  recipe = Recipe.find(params[:id])
  recipe.destroy
  status 204
 end

  get "/categories" do 
  Category.all.to_json
 end

end
