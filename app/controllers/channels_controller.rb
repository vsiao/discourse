class ChannelsController < ApplicationController
  # GET /channels
  # GET /channels.xml
  def index
    @channels = Channel.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @channels }
    end
  end

  # GET /channels/1
  # GET /channels/1.xml
  def show
    @channel = Channel.find(params[:id])
    c = Chat.find_by_user_id_and_channel_id(current_user.id, @channel.id)
    if !c
      Chat.create(:user_id => current_user.id, :channel_id => @channel.id)
    end

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @channel }
    end
  end

  # GET /channels/new
  # GET /channels/new.xml
  def new
    @channel = Channel.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @channel }
    end
  end

  # GET /channels/1/edit
  def edit
    @channel = Channel.find(params[:id])
  end

  # POST /channels
  # POST /channels.xml
  def create
    @channel = Channel.new(params[:channel])

    respond_to do |format|
      if @channel.save
        format.html { redirect_to(@channel, :notice => 'Channel was successfully created.') }
        format.xml  { render :xml => @channel, :status => :created, :location => @channel }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @channel.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /channels/1
  # PUT /channels/1.xml
  def update
    @channel = Channel.find(params[:id])

    respond_to do |format|
      if @channel.update_attributes(params[:channel])
        format.html { redirect_to(@channel, :notice => 'Channel was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @channel.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /channels/1
  # DELETE /channels/1.xml
  def destroy
    @channel = Channel.find(params[:id])
    @channel.destroy

    respond_to do |format|
      format.html { redirect_to(channels_url) }
      format.xml  { head :ok }
    end
  end
  
  def user_inactive
    channel_name = params[:channel_name]
    puts "inactive!!!"
    puts channel_name
    c = Chat.find_by_user_id_and_channel_id(current_user.id, Channel.find_by_name(channel_name).id);
    puts c
    if c
      c.delete
    end
    
    render :json => { }
  end
  
  def user_active
    channel_id = params[:channel_id]
    c = Chat.find_by_user_id_and_channel_id(current_user.id, channel_id)
    if c
      c.touch
    else
      # Chat.create(:user_id => current_user.id, :channel_id => channel_id)
    end
    channel = Channel.find(channel_id)
    channel.check_active_users
    
    render :json => { :users => channel.users }
  end

end
