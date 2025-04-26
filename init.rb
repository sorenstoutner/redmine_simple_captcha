require_relative './lib/account_controller_patch'
require_relative './lib/user_patch'

Redmine::Plugin.register :stupid_captcha do
  name 'stupid captcha plugin'
  author 'Mehdi Abaakouk'
  description 'Adds a very simple captcha to the account registration page'
  version '1.0.0'
  url 'https://github.com/sileht/redmine-stupid-captcha'
  author_url 'https://github.com/sileht'
  settings({
     :partial => 'settings/settings',
     :default => {
       'stupid_captcha_question' => 'changeme',
       'stupid_captcha_answer' => 'changeme',
      }
  })
end
