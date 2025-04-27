require_relative './lib/account_controller_patch'
require_relative './lib/user_patch'

Redmine::Plugin.register :redmine_simple_captcha do
  name 'Simple CAPTCHA'
  author 'Soren Stoutner'
  description 'Adds a very simple captcha to the account registration page.'
  version '1.0'
  url 'https://github.com/sorenstoutner/redmine_simple_captcha'
  author_url 'https://github.com/sorenstoutner'
  settings({
     :partial => 'settings/settings',
     :default => {
       'simple_captcha_question' => 'CHANGE ME',
       'simple_captcha_answer' => 'CHANGE ME',
      }
  })
end
