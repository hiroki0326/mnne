class MypageController < MainController
  def index
    @boxes = @current_user.money_boxes
    @user_infos = @current_user.user_infos
  end
end