# SPDX-License-Identifier: MIT
# SPDX-FileCopyrightText: 2025 Soren Stoutner <soren@stoutner.com>
#
# This file is part of Redmine Simple Captcha.  <https://github.com/sorenstoutner/redmine_simple_captcha>
# See LICENSE for more information.

module AccountControllerPatch
  def self.included(base)
    base.class_eval do
      def register
        (redirect_to(home_url); return) unless Setting.self_registration? || session[:auth_source_registration]
        if request.get?
          session[:auth_source_registration] = nil
          @user = User.new(:language => current_language.to_s)
        else
          user_params = params[:user] || {}
          @user = User.new
          @user.safe_attributes = user_params
          @user.admin = false
          @user.register
          if session[:auth_source_registration]
            @user.activate
            @user.login = session[:auth_source_registration][:login]
            @user.auth_source_id = session[:auth_source_registration][:auth_source_id]
            if @user.save
              session[:auth_source_registration] = nil
              self.logged_user = @user
              flash[:notice] = l(:notice_account_activated)
              redirect_to my_account_path
            end
          else
            @user.login = params[:user][:login]
            unless user_params[:identity_url].present? && user_params[:password].blank? && user_params[:password_confirmation].blank?
              @user.password, @user.password_confirmation = user_params[:password], user_params[:password_confirmation]
            end
            if user_params[:simple_captcha_answer] == Setting.plugin_redmine_simple_captcha['simple_captcha_answer']
              case Setting.self_registration
              when '1'
                register_by_email_activation(@user)
              when '3'
                register_automatically(@user)
              else
                register_manually_by_administrator(@user)
              end
            else
              flash.delete(:simple_captcha_error)
            end
          end
        end
      end
    end
  end
end

AccountController.send(:include, AccountControllerPatch)
