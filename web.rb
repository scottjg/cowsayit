#!/usr/bin/env ruby
require "ruby_cowsay"
require "fortune"
require "sinatra"

get "/" do
  msg       = params[:msg] ||
    "usage: \n" +
    "  GET /?msg=sup\n" +
    "  GET /?msg=hello&cow=stegosaurus\n" +
    "  GET /?msg=yikes&face=paranoid\n" +
    "\n" +
    "cows: #{Cow.cows.join(" ")}\n" +
    "\n" +
    "faces: #{Cow.faces.join(" ")}" +

  cow_type  = params[:cow] || "default"
  face_type = params[:face] || "default"

  content_type "text/plain"
  Cow.say(msg, cow_type, face_type)
end

get "/fortune" do
  msg       = Fortune.new.get
  cow_type  = params[:cow] || "default"
  face_type = params[:face] || "default"

  p msg
  content_type "text/plain"
  Cow.say(msg, cow_type, face_type)
end
