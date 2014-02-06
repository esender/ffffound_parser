require 'spec_helper'

describe Parser do
  context '#parse' do
    it 'should return Array' do
      parser = Parser.new(:site)
      expect(parser.parse).to be_a Array
    end
  end
end