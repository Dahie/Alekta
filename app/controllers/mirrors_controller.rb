class MirrorsController < ApplicationController
  
  before_filter :require_backend_user, :only => [:new, :edit, :destroy, :update]
  before_filter :permission_required, :only => [:new, :edit, :destroy, :update]
  
  before_filter :get_mod, :only => [:new, :update, :edit, :create, :destroy]
  before_filter :get_release, :only => [:new, :update, :edit, :create, :destroy]

  def new
    @mirror = @mod.releases.mirrors.new
  end

  def edit
    @mirror = Mirror.find(params[:id])
  end

  def create
    @mirror  = Mirror.new(params[:mirror])
    
    if @mirror.save
      flash[:notice] = 'Mirror was successfully created.'
      redirect_to mod_release_mirrors(@mod, @release)
    else
      render :action => "new"
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
    @mod = Mod.find(params[:mod_id])
  end
  
  def get_release
    @release = Release.find(params[:release_id])
  end
  
end
