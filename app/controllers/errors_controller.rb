class ErrorsController < ApplicationController
    
    def index
        @errors = Error.all
        @q = Error.ransack(params[:q])
        @errors = @q.result(distinct: true)
    end

    def show
        @error = Error.find(params[:id])
    end
    
    def new
        @error = Error.new
    end

    def create
        @error = Error.new(error_params)
        if @error.save
            redirect_to root_path, notice: "登録完了"
        else
            flash.now[:error] = "登録失敗"
            render :new
        end
    end

    def edit
        @error = Error.find(params[:id])
    end

    def update
        @error = Error.find(params[:id])
        if @error.update(error_params)
            redirect_to root_path, notice: "編集完了"
        else
            flash.now[:error] = "編集失敗"
            render :edit
        end
    end

    def destroy
        error = Error.find(params[:id])
        error.destroy!
        redirect_to root_path, notice: "削除しました"
    end

    private 
    def error_params
        params.require(:error).permit(:game,:problem,:approach,:name)
    end
end