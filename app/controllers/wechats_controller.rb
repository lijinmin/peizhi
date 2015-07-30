class WechatsController < ApplicationController
  before_action :set_wechat, only: [:show, :edit, :update, :destroy]

  # GET /wechats
  # GET /wechats.json
  def index
    @wechats = Wechat.all
    unless params[:echostr].blank?
      token = 'weixin'

      timestamp = params[:timestamp]
      nonce = params[:nonce]
      echostr = params[:echostr]
      signature = params[:signature]

      aray =  [token, timestamp, nonce].sort
      tmp = ""
      aray.each do |s|
        tmp += s  
      end
      tmp = Digest::SHA1.hexdigest(tmp)

      logger.info "---#{echostr}-------#{tmp == signature}----------"
      if tmp == signature 
        render :text => echostr
      else 
        render :text => ""
      end
    end
  end

  # GET /wechats/1
  # GET /wechats/1.json
  def show
  end

  # GET /wechats/new
  def new
    @wechat = Wechat.new
  end

  # GET /wechats/1/edit
  def edit
  end

  # POST /wechats
  # POST /wechats.json
  def create
    @wechat = Wechat.new(wechat_params)

    respond_to do |format|
      if @wechat.save
        format.html { redirect_to @wechat, notice: 'Wechat was successfully created.' }
        format.json { render :show, status: :created, location: @wechat }
      else
        format.html { render :new }
        format.json { render json: @wechat.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /wechats/1
  # PATCH/PUT /wechats/1.json
  def update
    respond_to do |format|
      if @wechat.update(wechat_params)
        format.html { redirect_to @wechat, notice: 'Wechat was successfully updated.' }
        format.json { render :show, status: :ok, location: @wechat }
      else
        format.html { render :edit }
        format.json { render json: @wechat.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /wechats/1
  # DELETE /wechats/1.json
  def destroy
    @wechat.destroy
    respond_to do |format|
      format.html { redirect_to wechats_url, notice: 'Wechat was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_wechat
      @wechat = Wechat.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def wechat_params
      params[:wechat]
    end
end
