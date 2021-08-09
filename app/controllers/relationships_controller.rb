class RelationshipsController < ApplicationController
  def create
    @active_relationship = current_user.active_relationships.build(followed_id: params[:user_id])
    if @active_relationship.save
      redirect_to user_path(params[:user_id]), notice: "フォローしました"
    end
  end
  
  def destroy
    active_relationship = current_user.active_relationships.find_by!(followed_id: params[:user_id])
    active_relationship.destroy!
    redirect_to user_path(params[:user_id]), notice: "フォロー解除しました"
  end
end
