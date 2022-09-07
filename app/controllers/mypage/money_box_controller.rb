class Mypage::MoneyBoxController < Mypage::MainController
  def new
    @box = @current_user.money_boxes.new
  end

  def create
    @box = @current_user.money_boxes.new(mypage_money_boxes_params)
    if @box.save
      redirect_to user_mypage_index_path(@current_user)
    else
      render :new
    end
  end
  private
  def mypage_money_boxes_params
    params.require(:box).permit(
      :name,
      :image
    )
  end
end