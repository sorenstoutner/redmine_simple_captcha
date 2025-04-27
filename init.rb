require_relative './lib/account_controller_patch'
require_relative './lib/user_patch'

Redmine::Plugin.register :redmine_simple_captcha do
  name 'Stupid CAPTCHA'
  author 'Soren Stoutner'
  description 'Adds a very simple captcha to the account registration page'
  version '1.0'
  url 'https://github.com/sorenstoutner/redmine-stupid-captcha'
  author_url 'https://github.com/sorenstoutner'
  settings({
     :partial => 'settings/settings',
     :default => {
       'stupid_captcha_question' => 'changeme',
       'stupid_captcha_answer' => 'changeme',
      }
  })
end
