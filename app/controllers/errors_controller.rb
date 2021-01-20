class ErrorsController < ApplicationController
    
    def index
        @errors = Error.all
    end
    
    def new
        @error = Error.new
    end

    def create
        @error = Error.new(error_params)
        if @error.save
            redirect_to root_path
        else
            render :new
        end
    end

    def edit
        @error = Error.find(params[:id])
    end

    def update
        @error = Error.find(params[:id])
        if @error.update(error_params)
            redirect_to root_path
        else
            render :edit
        end
    end

    def destroy
        error = Error.find(params[:id])
        error.destroy!
        redirect_to root_path
    end

    private 
    def error_params
        params.require(:error).permit(:game,:problem,:approach,:name,:date)
    end
end