require 'rack/rewrite'

app = Rack::Builder.app do
  use Rack::Rewrite do
    r301 %r{/(\d{4})/(\d{2})/(\d{2})/(.*)/}, 'http://jbhannah.net/blog/$1/$2/$3/$4.html'
    r301 %r{.*}, 'http://jbhannah.net/blog$&'
  end
  run lambda { |env| [200, {'Content-Type' => 'text/plain'}, ['OK']] }
end

run app
