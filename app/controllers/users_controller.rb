class UsersController < ApplicationController

  def show
    @user=User.find(params[:id])
    @currentUserEntry=Entry.where(user_id: current_user.id)
    @userEntry=Entry.where(user_id: @user.id)
    if @user.id == current_user.id
    else
      @currentUserEntry.each do |cu|
        @userEntry.each do |u|
          if cu.room_id == u.room_id then
            @isRoom = true
            @roomId = cu.room_id
          end
        end
      end
      if @isRoom
      else
        @room = Room.new
        @entry = Entry.new
      end
    end
    @user = User.find(params[:id])
    @userhobbies = UserHobby.where(user_id: @user.id)
  end

  def index
    @users = User.where(university_id: current_user.university_id)
    @university = University.find_by(id: current_user.university_id)

    @user_common_points = Hash.new
    @users.each do |user|
      @user_common_points[user.id] = 0
    end

    @user_hobbies = UserHobby.where(user_id: current_user.id)
    @user_hobbies.each do |user_hobby|
      @common_hobby = Hobby.find(user_hobby.hobby_id)
      @common_user_hobbies = UserHobby.where(hobby_id: @common_hobby.id)
      @common_user_hobbies.each do |common_user_hobby|
        @common_user = User.find(common_user_hobby.user_id)
        @user_common_points[@common_user.id] += 1
      end
    end

    @other_users = @users.where.not(id: current_user.id)
    @other_users.each do |o_u|
      if o_u.birth_place == current_user.birth_place
        @user_common_points[o_u.id] += 1
      end

      if o_u.commonclass1 == current_user.commonclass1 && o_u.commonclass1 != nil
        @user_common_points[o_u.id] += 1
      end
      if o_u.commonclass1 == current_user.commonclass2 && o_u.commonclass1 != nil
        @user_common_points[o_u.id] += 1
      end
      if o_u.commonclass1 == current_user.commonclass3 && o_u.commonclass1 != nil
        @user_common_points[o_u.id] += 1
      end
      if o_u.commonclass1 == current_user.commonclass4 && o_u.commonclass1 != nil
        @user_common_points[o_u.id] += 1
      end
      if o_u.commonclass1 == current_user.commonclass5 && o_u.commonclass1 != nil
        @user_common_points[o_u.id] += 1
      end
      if o_u.commonclass2 == current_user.commonclass1 && o_u.commonclass2 != nil
        @user_common_points[o_u.id] += 1
      end
      if o_u.commonclass2 == current_user.commonclass2 && o_u.commonclass2 != nil
        @user_common_points[o_u.id] += 1
      end
      if o_u.commonclass2 == current_user.commonclass3 && o_u.commonclass2 != nil
        @user_common_points[o_u.id] += 1
      end
      if o_u.commonclass2 == current_user.commonclass4 && o_u.commonclass2 != nil
        @user_common_points[o_u.id] += 1
      end
      if o_u.commonclass2 == current_user.commonclass5 && o_u.commonclass2 != nil
        @user_common_points[o_u.id] += 1
      end
      if o_u.commonclass3 == current_user.commonclass1 && o_u.commonclass3 != nil
        @user_common_points[o_u.id] += 1
      end
      if o_u.commonclass3 == current_user.commonclass2 && o_u.commonclass3 != nil
        @user_common_points[o_u.id] += 1
      end
      if o_u.commonclass3 == current_user.commonclass3 && o_u.commonclass3 != nil
        @user_common_points[o_u.id] += 1
      end
      if o_u.commonclass3 == current_user.commonclass4 && o_u.commonclass3 != nil
        @user_common_points[o_u.id] += 1
      end
      if o_u.commonclass3 == current_user.commonclass5 && o_u.commonclass3 != nil
        @user_common_points[o_u.id] += 1
      end
      if o_u.commonclass4 == current_user.commonclass1 && o_u.commonclass4 != nil
        @user_common_points[o_u.id] += 1
      end
      if o_u.commonclass4 == current_user.commonclass2 && o_u.commonclass4 != nil
        @user_common_points[o_u.id] += 1
      end
      if o_u.commonclass4 == current_user.commonclass3 && o_u.commonclass4 != nil
        @user_common_points[o_u.id] += 1
      end
      if o_u.commonclass4 == current_user.commonclass4 && o_u.commonclass4 != nil
        @user_common_points[o_u.id] += 1
      end
      if o_u.commonclass4 == current_user.commonclass5 && o_u.commonclass4 != nil
        @user_common_points[o_u.id] += 1
      end
      if o_u.commonclass5 == current_user.commonclass1 && o_u.commonclass5 != nil
        @user_common_points[o_u.id] += 1
      end
      if o_u.commonclass5 == current_user.commonclass2 && o_u.commonclass5 != nil
        @user_common_points[o_u.id] += 1
      end
      if o_u.commonclass5 == current_user.commonclass3 && o_u.commonclass5 != nil
        @user_common_points[o_u.id] += 1
      end
      if o_u.commonclass5 == current_user.commonclass4 && o_u.commonclass5 != nil
        @user_common_points[o_u.id] += 1
      end
      if o_u.commonclass5 == current_user.commonclass5 && o_u.commonclass5 != nil
        @user_common_points[o_u.id] += 1
      end

    end

    @desc_user_common_points = Hash[ @user_common_points.sort_by{ |_, v| -v } ]
  end

  def following
    @title = "フォロー"
    @user = User.find(params[:id])
    @users = @user.followings
    render 'show_follow'
  end

  def followers
    @title = "フォロワー"
    @user = User.find(params[:id])
    @users = @user.followers
    render 'show_follow'
  end

  def commonphasefirst
    @user = current_user
  end

  def commonphasesecond
    @user = current_user
  end

  def commonphasethird
    @user = current_user
  end

  def create_commonphasefirst
    @user = current_user
    @user.update!(user_params)
    redirect_to commonphasesecond_users_path
  end

  def create_commonphasesecond
    @user = current_user
    @user.update(user_params)
    redirect_to commonphasethird_users_path
  end

  def create_commonphasethird
    @user = current_user
    @user.update(user_params)
    redirect_to users_path
  end


  private
  def user_params
    params.require(:user).permit(
      :birth_place, :commonclass1, :commonclass2, :commonclass3,
      :commonclass4, :commonclass5,
      { hobby_ids: [] }
    )
  end
end
