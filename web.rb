#!/usr/bin/env ruby
require 'ruby_cowsay'
require 'sinatra'

get '/' do
  msg = params[:msg]
  cow_type = params[:cow] || 'default'
  face_type = params[:face] || 'default'

  content_type 'text/plain'
  if msg.nil?
    "usage:\n" +
    "  GET /?msg=sup" #+
    #"&nbsp;&nbsp;GET /?msg=hello&cow=stegosaurus<br>" +
    #"&nbsp;&nbsp;GET /?msg=yikes&face=paranoid<br>" +
    #"<br>" +
    #"<br>" +
    #"possible cows: " + Cow.cows + "<br>" +
    #"<br>" +
    #"possible face types: " + Cow.faces.join(" ")
  else
    Cow.say(msg, cow_type, face_type)
  end
end
