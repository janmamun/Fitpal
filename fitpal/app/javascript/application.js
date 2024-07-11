// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "bootstrap"
import "@popperjs/core"
import "./channels"
// or if you want to specifically import the chat_channel
import "channels/chat_channel"
import "./autocomplete"
