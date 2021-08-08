class RelationshipsController < ApplicationController
  def create
    @active_relationship = current_user.active_relationships.build(followed_id: params[:user_id])
    if @active_relationship.save
      redirect_to root_path, notice: "ユーザをフォローしました"
    end
  end
end
