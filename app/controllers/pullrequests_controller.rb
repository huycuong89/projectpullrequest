class PullrequestsController < ApplicationController
  def new
    @pullrequest=Pullrequest.new
  end

  def index
      @pullrequests=Pullrequest.all
  end

  def create
    @pullrequest=Pullrequest.new(pull_params)
    @pullrequest.username=@pullrequest.username.downcase.delete(' ')
    pullexsit=Pullrequest.find_by_username(@pullrequest.username)
    result=false;
    unless pullexsit.nil?
      pullexsit.updated_at=DateTime.now.to_date
      pullexsit.ipserver=@pullrequest.ipserver
      pullexsit.linkpullrequest=@pullrequest.linkpullrequest
      pullexsit.note=@pullrequest.note
      result=pullexsit.update(updated_at: pullexsit.updated_at,ipserver: pullexsit.ipserver,linkpullrequest: pullexsit.linkpullrequest,note: pullexsit.note)
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
        :username,
        :ipserver,
        :linkpullrequest,
        :note,
    )
  end
end
