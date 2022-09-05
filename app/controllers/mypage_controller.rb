class MypageController < MainController
  def index
    @boxes = current_user.money_boxes
  end
end