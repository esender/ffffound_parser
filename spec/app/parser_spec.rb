require 'spec_helper'

describe Parser do
  context '#parse' do
    it 'should return html page' do
      stub_request(:get, 'http://site.ru/').to_return(status: 200,
            body: File.read(File.join(App.root,'spec/fixtures/html/ffffound.com.html')),
            headers: {'Content-Type' => 'text/html'})
      html = Parser.new('http://site.ru/').parse
      expect(html).to be_a Array
    end
    #it 'should return html page' do
    #  stub_request(:get, 'http://site.ru/').to_return(status: 200,
    #        body: File.read(File.join(App.root,'spec/fixtures/html/ffffound.com.html')),
    #        headers: {'Content-Type' => 'text/html'})
    #  html = Parser.new('http://site.ru/').parse
    #  p html
    #  expect(html[0]).to be_a Hash
    #end
  end
end