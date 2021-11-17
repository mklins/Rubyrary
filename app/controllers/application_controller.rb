class ApplicationController < ActionController::Base
    include Pagy::Backend
    include ErrorHandling
    include Authentication
    include Authorization
end
