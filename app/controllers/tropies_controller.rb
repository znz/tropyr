class TropiesController < ApplicationController
  # GET /tropies
  def index
    @random_tropy = Tropy.first(:offset => rand(Tropy.count))
    if @random_tropy
      @refresh_url = tropy_url(:pageid => @random_tropy.pageid)
    else
      # empty database
      redirect_to :action => "new"
    end
  end

  # GET /tropies/1
  # GET /tropies/1.xml
  def show
    pageid = params[:pageid]
    @tropy = Tropy.find_by_pageid(pageid)

    unless @tropy
      redirect_to :action => "index"
      return
    end

    @title, content = @tropy.content.split(/\r?\n/, 2)
    content = content.to_s
    content.gsub!(/\r?\n/, "\n")
    content.gsub!(/\n{2,}/, "</p>\n<p>")
    @content = "<p>#{content}</p>"

    r = 255 - pageid[0, 2].hex % 32
    g = 255 - pageid[2, 2].hex % 32
    b = 255 - pageid[4, 2].hex % 32
    @bgcolor = "#%02X%02X%02X" % [r, g, b]

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
    @tropy = Tropy.find_by_pageid(params[:pageid])
    unless @tropy
      redirect_to :action => "index"
      return
    end
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
    @tropy = Tropy.find_by_pageid(params[:pageid])
    unless @tropy
      redirect_to :action => "index"
      return
    end

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
    @tropy = Tropy.find_by_pageid(params[:pageid])
    @tropy.destroy

    respond_to do |format|
      format.html { redirect_to(random_url) }
      format.xml  { head :ok }
    end
  end
end
