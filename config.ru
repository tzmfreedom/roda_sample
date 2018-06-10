# config.ru
require "roda"

class App < Roda
  plugin :public
  plugin :render

  route do |r|
    r.public

    r.root do
      r.redirect '/hello'
    end

    r.get 'hey' do
      view('hoge', locals: { hello: r.params['hello'] })
    end

    r.on 'hello' do
      @greeting = 'hey!'
      r.get 'world' do
        "#{@greeting} world"
      end

      r.is do
        r.get do
          "#{@greeting}"
        end

        r.post do
          puts "someone said #{@greeting}"
          r.redirect
        end
      end
      
      r.get 'aaa' do
        'hogheogeho'
      end
    end

    r.on 'hello' do
    end
  end
end
run App.freeze.app
