class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user=User.find(params[:id])
    # ログインユーザーのエントリーを全て取得
    @currentUserEntry=Entry.where(user_id: current_user.id)
    # 該当ユーザーのエントリーを全て取得
    @userEntry=Entry.where(user_id: @user.id)

    unless @user.id == current_user.id
      # ログインユーザーと該当ユーザーの共通ルームがあれば @isRoom に true、 @roomId に 共通のルームID をもたせる
      @currentUserEntry.each do |cu|
        @userEntry.each do |u|
          if cu.room_id == u.room_id
            @isRoom = true
            @roomId = cu.room_id
          end
        end
      end
      # @isRoomがnilならばroomとentryを新しく作成
      unless @isRoom
        @room = Room.new
        @entry = Entry.new
      end
    end

    # 該当ユーザーのUserHobbyを全て取得
    @userhobbies = UserHobby.where(user_id: @user.id)
  end

  def index
    # メール認証済ユーザーを全て取得
    @confirmed_users = User.where.not(confirmed_at: nil)
    # メール認証済ユーザーの中でログインユーザーと大学が同じユーザーを全て取得
    @users = @confirmed_users.where(university_id: current_user.university_id)
    # ログインユーザーのUniversityを取得
    @university = University.find_by(id: current_user.university_id)

    @user_common_points = Hash.new
    @users.each do |user|
      @user_common_points[user.id] = 0
    end

    # ログインユーザーのUserHobbyを全て取得
    @user_hobbies = UserHobby.where(user_id: current_user.id)
    @user_hobbies.each do |user_hobby|
      # ログインユーザーが登録している趣味を1つ取得
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
    @user = User.find(params[:id])
    @users = @user.followings
    render 'show_follow'
  end

  def followers
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

  def other

  end


  private
  def user_params
    params.require(:user).permit(
      :birth_place, :image, :commonclass1, :commonclass2, :commonclass3,
      :commonclass4, :commonclass5,
      { hobby_ids: [] }
    )
  end
end
