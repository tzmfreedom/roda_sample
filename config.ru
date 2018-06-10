# config.ru
require "roda"

class App < Roda
  route do |r|
    r. root do
      r.redirect '/hello'
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
    end
  end
end
run App.freeze.app
