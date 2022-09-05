class Mypage::PayedsController < MainController
  before_action :find_by_id,only: [:new,:create,:destroy]

  def new
    @payed = @box.payeds.new
  end

  def create
    @payed = @box.payeds.new(mypage_payed_params)
    if @payed.save
      redirect_to user_mypage_index_path(current_user)
    else
      render :new
    end
  end

  def destroy
    if @payed.destroy
      redirect_to user_mypage_index_path(current_user)
    end
  end

  private
  def find_by_id
    @box = MoneyBox.find(params[:money_box_id])
  end

  def mypage_payed_params
    params.require(:payed).permit(
      :name,
      :price,
      :payed_at
    )
  end
end