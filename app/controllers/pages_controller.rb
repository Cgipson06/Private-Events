class PagesController < ApplicationController
def show
  render template: "pages/home.html.erb"
end
end
