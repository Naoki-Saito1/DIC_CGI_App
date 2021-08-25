require 'webrick'
server = WEBrick::HTTPServer.new({
  :DocumentRoot => '/',
  :CGIInterpreter => WEBrick::HTTPServlet::CGIHandler::Ruby,
  :Port => '3000',
})
['INT', 'TERM'].each {|signal|
  Signal.trap(signal){ server.shutdown }
}
server.mount('/',WEBrick::HTTPServlet::ERBHandler, 'kadai2.html.erb')
server.mount('/test', WEBrick::HTTPServlet::ERBHandler, 'kadai.html.erb')
server.mount('/goya.cgi', WEBrick::HTTPServlet::CGIHandler, 'goya.rb')
server.start