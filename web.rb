#!/usr/bin/env ruby
require 'ruby_cowsay'
require 'sinatra'

get '/' do
  msg       = params[:msg] || "usage: GET /?msg=sup"
  cow_type  = params[:cow] || 'default'
  face_type = params[:face] || 'default'

  content_type 'text/plain'
  Cow.say(msg, cow_type, face_type)
end
