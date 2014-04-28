#!/usr/bin/env ruby
require 'ruby_cowsay'
require 'sinatra'

get '/' do
  msg = params[:msg]
  cow_type = params[:cow] || 'default'
  face_type = params[:face] || 'default'

  content_type 'text/plain'
  msg ||= "usage: GET /?msg=sup"
  Cow.say(msg, cow_type, face_type)
end
