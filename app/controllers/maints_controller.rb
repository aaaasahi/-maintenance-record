class MaintsController < ApplicationController

    def index
        @maints = Maint.all
    end

    def show
        @maint = Maint.find(params[:id])
    end

    def new
        @maint = Maint.new
    end

    def create
        @maint = Maint.new(maint_params)
        if @maint.save
            redirect_to maints_path
        else
            render :new
        end
    end

    def edit
        @maint = Maint.find(params[:id])
    end

    def update
        @maint = Maint.find(params[:id])
        if @maint.update(maint_params)
            redirect_to maints_path
        else
            render :edit
        end
    end

    def destroy
        maint = Maint.find(params[:id])
        maint.destroy!
        redirect_to maints_path
    end

    private 
    def maint_params
        params.require(:maint).permit(:game,:content,:name,:date)
    end
    
end