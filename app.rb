require 'sinatra'
require 'sinatra/cookies'
require 'active_support/all'

get '/' do
   unless cookies[:numero]
    vruby = (0..9).to_a.shuffle.take(4).map { |i| i.to_s }
    cookies[:numero] = vruby
    end
	  erb :index
end


get '/validar' do
  @numero= params[:numero]
  fija = 0
  pica = 0
  i = 0
  j = 0
  while i < 4
    while j < 4
      # puts "#{vruby[i]} - #{vuser[j]}"
      if @numero[j] == cookies[:numero].split('&')[i]
        if i == j
          fija = fija + 1
        else
          pica = pica + 1
        end
      end
      j += 1
    end
    j = 0
    i += 1
  end

  if fija == 4
    erb :ganaste
  else
    @random = cookies[:numero]
    @picas = pica
    @fijas = fija
    erb :validar
  end
  
  
end