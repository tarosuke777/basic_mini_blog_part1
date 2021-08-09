class RelationshipsController < ApplicationController

  def create
    @active_relationship = current_user.active_relationships.build(followed_id: params[:followed_id])
    if @active_relationship.save
      redirect_to user_path(id: params[:followed_id]), notice: "フォローしました"
    end
  end

  def destroy
    active_relationship = Relationship.find(params[:id])
    user = User.find(active_relationship.followed_id)
    active_relationship.destroy!
    redirect_to user_path(user), notice: "フォロー解除しました"
  end
end
