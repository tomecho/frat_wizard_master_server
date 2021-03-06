module Api
  class OrgClaimCodesController < ApplicationController
    before_action :find_org_claim_code, only: %i(show)

    def show
      render json: @claim
    end

    # create new claim code based on org_id
    def create
      # we already know this user has permission for org_claim_codes#create but we need to check they are part of this org
      unless @current_user.orgs.map(&:id).include?(new_org_claim_code_params[:org_id].to_i) || @current_user.has_permission?('*', '*')
        render json: { errors: ['user not authorized']}, status: :forbidden and return
      end

      claim = OrgClaimCode.new(new_org_claim_code_params)
      if claim.save
        render json: claim
      else
        render json: { errors: claim.errors.full_messages }, status: :unprocessable_entity
      end
    end

    # remove claim code by its id
    def destroy
      OrgClaimCode.find(params[:id]).destroy
      head :no_content
    end

    private

    def find_org_claim_code
      if id = params[:id]
        @claim = OrgClaimCode.find(id)
      elsif claim_code = params[:code]
        @claim = OrgClaimCode.find_by_code(claim_code)
      end
    end

    def new_org_claim_code_params
      params.require(:org_claim_codes).permit(:org_id)
    end
  end
end
