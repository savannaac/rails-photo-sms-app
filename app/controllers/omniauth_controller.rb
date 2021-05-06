# class OmniauthController < Devise::OmniauthCallbacksController

#     def google
#         @user = User.create_from_provider_data(request.env["omniauth.auth"])

#         if user.persisted?
#             sign_in_and_redirect @user
#         else
#             flash.alert = "oops, there was a problem"
            
#             redirect_to new_user_registration_path
#         end
#     end
# end
