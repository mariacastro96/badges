class BadgesController < ApplicationController
  include DataFormat
  include CompressData

  def submit_form
  end

  def success
    hash = transform_to_hash(compress(badge_params.to_json))
    uuid = badge_params[:uuid]
    @proof_id = BadgeSubmission.new.proof_id_from(hash)
    @badge = Badge.new(hash, uuid)
  rescue StandardError => e
    flash[:notice] = e.message
    redirect_back fallback_location: :submit_form
  end

  private

  def badge_params
    params.permit(:uuid, :name, :date)
  end
end
