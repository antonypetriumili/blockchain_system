# encoding: utf-8

module Centralbank

  class Service < Sinatra::Base

    def self.banner
      "centralbank/#{VERSION} on Ruby #{RUBY_VERSION} (#{RUBY_RELEASE_DATE}) [#{RUBY_PLATFORM}] on Sinatra/#{Sinatra::VERSION} (#{ENV['RACK_ENV']}) in (#{Centralbank.root})"
    end


  PUBLIC_FOLDER = "#{Centralbank.root}/lib/centralbank/public"
  VIEWS_FOLDER  = "#{Centralbank.root}/lib/centralbank/views"

  set :public_folder, PUBLIC_FOLDER # set up the static dir (with images/js/css inside)
  set :views,         VIEWS_FOLDER  # set up the views dir

  set :static, true # set up static file routing  -- check - still needed?


  set connections: []



  get '/style.css' do
    scss :style    ## note: converts (pre-processes) style.scss to style.css
  end


  get '/' do
    @node = node   ## todo: pass along node as hash varialbe / assigns to erb
    erb :index
  end


  post '/send' do
    node.on_send( params[:to], params[:amount].to_i )
    settings.connections.each { |out| out << "data: added transaction\n\n" }
    redirect '/'
  end


  post '/transactions' do
    if node.on_add_transaction(
      params[:from],
      params[:to],
      params[:amount].to_i,
      params[:id]
    )
      settings.connections.each { |out| out << "data: added transaction\n\n" }
    end
    redirect '/'
  end

  post '/mine' do
    node.on_mine!
    redirect '/'
  end

  post '/peers' do
    node.on_add_peer( params[:host], params[:port].to_i )
    redirect '/'
  end

  post '/peers/:index/delete' do
    node.on_delete_peer( params[:index].to_i )
    redirect '/'
  end



  post '/resolve' do
    data = JSON.parse(request.body.read)
    if data['chain'] && node.on_resolve( data['chain'] )
      status 202     ### 202 Accepted; see httpstatuses.com/202
      settings.connections.each { |out| out << "data: resolved\n\n" }
    else
      status 200    ### 200 OK
    end
  end


  get '/events', provides: 'text/event-stream' do
    stream :keep_open do |out|
      settings.connections << out
      out.callback { settings.connections.delete(out) }
    end
  end

private

#########
## return network node (built and configured on first use)
##   fix: do NOT use @@ - use a class level method or something
def node
  if defined?( @@node )
    @@node
  else
    puts "[debug] centralbank - build (network) node (address: #{Centralbank.config.address})"
    @@node = Node.new( address: Centralbank.config.address )
    @@node
  end
  ####
  ## check why this is a syntax error:
  ## @node ||= do
  ##   puts "[debug] centralbank - build (network) node (address: #{Centralbank.config.address})"
  ##   @node = Node.new( address: Centralbank.config.address )
  ## end
end

  end # class Service

end # module Centralbank
