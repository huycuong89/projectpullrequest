class PullrequestsController < ApplicationController
  def new
    unless user_signed_in?
      redirect_to user_github_omniauth_authorize_path
    else
      @pullrequest=Pullrequest.new
    end

  end

  def index
      @pullrequests=Pullrequest.all
  end

  def destroy
      pullrequestId=params[:id]
      userLogin=User.find_by_email(current_user.email)
      pullrequest = Pullrequest.find_by(id: pullrequestId)
      if userLogin.present?
        if pullrequest.user_id.eql?(userLogin.id)
          pullrequest.destroy
        end
      end
    redirect_to pullrequests_path
  end

  def create
    @pullrequest=Pullrequest.new(pull_params)
    @pullrequest.username=current_user.email
    @pullrequest.nickname=current_user.nickname
    userid=User.find_by_email(@pullrequest.username).id
    pullexsit=Pullrequest.find_by_username(@pullrequest.username)
    @pullrequest.user_id=userid

    unless pullexsit.nil?
      pullexsit.updated_at=DateTime.now.to_date
      pullexsit.ipserver=@pullrequest.ipserver
      pullexsit.linkpullrequest=@pullrequest.linkpullrequest
      pullexsit.note=@pullrequest.note
      pullexsit.nickname=@pullrequest.nickname
      result=pullexsit.update(updated_at: pullexsit.updated_at,ipserver: pullexsit.ipserver,
                              linkpullrequest: pullexsit.linkpullrequest,note: pullexsit.note,
                              nickname: pullexsit.nickname)
    else
      result=@pullrequest.save()
    end
    if result
        redirect_to action: 'index'
      else
        render 'new'
    end
  end

  def pull_params
    params.require(:pullrequest).permit(
        :ipserver,
        :linkpullrequest,
        :note,
    )
  end
end
