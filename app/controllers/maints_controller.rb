class MaintsController < ApplicationController

    def index
        @maints = Maint.all
        @q = Maint.ransack(params[:q])
        @maints = @q.result(distinct: true)
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
            redirect_to maints_path,  notice: "登録完了"
        else
            flash.now[:error] = "登録失敗"
            render :new
        end
    end

    def edit
        @maint = Maint.find(params[:id])
    end

    def update
        @maint = Maint.find(params[:id])
        if @maint.update(maint_params)
            redirect_to maints_path, notice: "編集完了"
        else
            flash.now[:error] = "編集失敗"
            render :edit
        end
    end

    def destroy
        maint = Maint.find(params[:id])
        maint.destroy!
        redirect_to maints_path, notice: "削除しました"
    end

    private 
    def maint_params
        params.require(:maint).permit(:game,:content,:name,:date)
    end
    
end