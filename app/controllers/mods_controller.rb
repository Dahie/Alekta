class ModsController < ApplicationController
  
  before_filter :require_backend_user, :only => [:new, :edit, :destroy, :update]
  before_filter :permission_required, :only => [:new, :edit, :destroy, :update]
  
  
  def index
    @mods = Mod.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @mods }
    end
  end

  def my
    
  end

  def show
    @mod = Mod.find(params[:id])
  end

  def new
    @mod = Mod.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @mod }
    end
  end

  def edit
    @mod = Mod.find(params[:id])
  end

  def create
    @mod = Mod.new(params[:mod])

    respond_to do |format|
      if @mod.save
        flash[:notice] = 'Mod was successfully created.'
        format.html { redirect_to(@mod) }
        format.xml  { render :xml => @mod, :status => :created, :location => @mod }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @mod.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /mods/1
  # PUT /mods/1.xml
  def update
    @mod = Mod.find(params[:id])

    respond_to do |format|
      if @mod.update_attributes(params[:mod])
        flash[:notice] = 'Mod was successfully updated.'
        format.html { redirect_to(@mod) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @mod.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /mods/1
  # DELETE /mods/1.xml
  def destroy
    @mod = Mod.find(params[:id])
    @mod.destroy

    respond_to do |format|
      format.html { redirect_to(mods_url) }
      format.xml  { head :ok }
    end
  end
end
