class SitesController < ApplicationController
  def index
    authorize(Site)
    @sites = policy_scope(Site)
  end
end
