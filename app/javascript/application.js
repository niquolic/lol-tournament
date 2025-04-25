// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "rails-ujs"
import "tailwindcss/base";
import "tailwindcss/components";
import "tailwindcss/utilities";
import Rails from "@rails/ujs"

Rails.start()