class MirrorsController < ApplicationController
  
  before_filter :get_mod, :only => [:new, :update, :edit, :destroy]
  before_filter :get_release, :only => [:new, :update, :edit, :destroy]

  # GET /mirrors/new
  # GET /mirrors/new.xml
  def new
    @mirror = @mod.releases.mirrors.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @mirror }
    end
  end

  # GET /mirrors/1/edit
  def edit
    @mirror = Mirror.find(params[:id])
  end

  # POST /mirrors
  # POST /mirrors.xml
  def create
    
    @mirror  = Mirror.new(params[:mirror])
    
    respond_to do |format|
      if @mirror.save
        flash[:notice] = 'Mirror was successfully created.'
        format.html { redirect_to(@mirror) }
        format.xml  { render :xml => @mirror, :status => :created, :location => @mirror }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @mirror.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /mirrors/1
  # PUT /mirrors/1.xml
  def update
    @mirror = Mirror.find(params[:id])

    respond_to do |format|
      if @mirror.update_attributes(params[:mirror])
        flash[:notice] = 'Mirror was successfully updated.'
        format.html { redirect_to(@mirror) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @mirror.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /mirrors/1
  # DELETE /mirrors/1.xml
  def destroy
    @mirror = Mirror.find(params[:id])
    @mirror.destroy

    respond_to do |format|
      format.html { redirect_to(mirrors_url) }
      format.xml  { head :ok }
    end
  end
  
  
  protected
  
  def get_mod
    @mods = Mod.find(params[:mod_id])
  end
  
  def get_release
    @release = Release.find(params[:release_id])
  end
  
end
