class ErrorsController < ApplicationController
    
    def index
        @errors = Error.first
    end
    
    def new
        @error = Error.new
    end

    def create
        @error = Error.new(error_params)
        @error.save
    end

    private 
    def error_params
        params.require(:error).permit(:game,:problem,:approach,:name,:date)
    end
end