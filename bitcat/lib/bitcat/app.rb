# encoding: utf-8

module Bitcat

class App < Sinatra::Base

  set :root, "#{Bitcat.root}/lib/bitcat"

  get '/' do
    erb :index
  end

  post '/' do
    puts "post '/'"
    pp params

    id = params['kitty']['id']
    if id.blank?
      ## id required - todo: add flash message
      redirect "/"
    else
      redirect "/kitty/#{id}"
    end
  end


  get '/kitty/:id' do
    puts "get '/kitty/:id'"
    pp params

    kitty = Copycats::Model::Kitty.find( params['id'] )
    pp kitty

    erb :kitty, :locals => { kitty: kitty }
  end


## helpers
  def h(text)
    Rack::Utils.escape_html(text)
  end

end  # class App
end # module Bitcat
