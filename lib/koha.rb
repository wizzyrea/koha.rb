$: << "#{File.dirname(__FILE__)}" unless $:.include? File.dirname(__FILE__)

require 'rubygems'

module Koha
  
  require 'koha/version'
  
  %W(Client Error Connection Uri ).each{|n| autoload n.to_sym, "koha/#{n.downcase}"}
  %W(Info User Biblio ).each { |n| autoload n.to_sym, "koha/api_methods/#{n.downcase}"}
  
  class << self
    def version; VERSION end
  
    def connect url = 'http://localhost/cgi-bin/koha/rest.pl/', *args
      opts = Hash === args[-1] ? args[-1] : {}
      opts[:url] = url
      Client.new  Koha::Connection.new, opts
    end
  end
  
end