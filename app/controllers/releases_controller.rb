class ReleasesController < ApplicationController
  
  before_filter :require_backend_user, :only => [:new, :edit, :create, :destroy, :update]
  before_filter :permission_required, :only => [:new, :edit, :create, :destroy, :update]
  
  before_filter :get_mod, :only => [:index, :new, :create, :update, :edit, :destroy]
  
  def index
    @releases = @mod.releases.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @releases }
    end
  end

  def show
    @release = @mod.releases.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @release }
    end
  end

  def new
    @release = @mod.releases.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @release }
    end
  end

  def edit
    @release = Release.find(params[:id])
  end

  def create
    @release = @mod.releases.new(params[:release])
    @release.user = current_user

    if @release.save
      flash[:notice] = 'Release was successfully created.'
      redirect_to mod_releases_path(@mod)
    else
       render :action => "new"
    end
  end

  def update
    @release = Release.find(params[:id])

    respond_to do |format|
      if @release.update_attributes(params[:release])
        flash[:notice] = 'Release was successfully updated.'
        format.html { redirect_to(@release) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @release.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @release = Release.find(params[:id])
    @release.destroy

    respond_to do |format|
      format.html { redirect_to mod_releases_path }
      format.xml  { head :ok }
    end
  end
  
  protected
  
  def get_mod
    @mod = Mod.find(params[:mod_id])
  end
  
end
