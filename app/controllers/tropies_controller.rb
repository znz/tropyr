class TropiesController < ApplicationController
  # GET /tropies
  # GET /tropies.xml
  def index
    @tropies = Tropy.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @tropies }
    end
  end

  def random
    @random_tropy = Tropy.find_by_id rand(Tropy.count) + 1
    if @random_tropy
      redirect_to @random_tropy
    else
      redirect_to :action => "new"
    end
  end

  # GET /tropies/1
  # GET /tropies/1.xml
  def show
    @tropy = Tropy.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @tropy }
    end
  end

  # GET /tropies/new
  # GET /tropies/new.xml
  def new
    @tropy = Tropy.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @tropy }
    end
  end

  # GET /tropies/1/edit
  def edit
    @tropy = Tropy.find(params[:id])
  end

  # POST /tropies
  # POST /tropies.xml
  def create
    @tropy = Tropy.new(params[:tropy])

    respond_to do |format|
      if @tropy.save
        flash[:notice] = 'Tropy was successfully created.'
        format.html { redirect_to(@tropy) }
        format.xml  { render :xml => @tropy, :status => :created, :location => @tropy }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @tropy.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /tropies/1
  # PUT /tropies/1.xml
  def update
    @tropy = Tropy.find(params[:id])

    respond_to do |format|
      if @tropy.update_attributes(params[:tropy])
        flash[:notice] = 'Tropy was successfully updated.'
        format.html { redirect_to(@tropy) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @tropy.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /tropies/1
  # DELETE /tropies/1.xml
  def destroy
    @tropy = Tropy.find(params[:id])
    @tropy.destroy

    respond_to do |format|
      format.html { redirect_to(tropies_url) }
      format.xml  { head :ok }
    end
  end
end
